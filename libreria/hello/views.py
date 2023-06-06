from django.shortcuts import render, redirect
from django.contrib.auth import get_user_model, authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password
from hello.models import Libro, Prestiti
from datetime import date
from django.http import JsonResponse
from django.forms import model_to_dict
import json

# Create your views here.
from django.http import HttpResponse

def home(request):
    if request.user.id is not None:
        if request.user.is_superuser:
            return render(request, 'homeAdmin.html', context={'utenti': ajax_getUtenti(request), 'libri': ajax_getLibri(request)})
        else:
            return render(request, 'home.html')
    else:
        return render(request, 'login.html')


def _logout(request):
    logout(request)
    return redirect('home')

def _login(request):
    userName=request.POST['userName']
    password=request.POST['password']

    #ritorna l' oggetto se esiste l' username 
    user=authenticate(username=userName, password=password)

    if user is not None:
        login(request, user)

    return redirect('home')
    

def add(request):
    body = json.loads(request.body)
    userNameAdd=body['userNameAdd']
    passwordAdd=body['passwordAdd']
    nome=body['nome']
    cognome=body['cognome']
    controllo=True
    try:
        utente=User.objects.create(username=userNameAdd, password=make_password(passwordAdd), first_name=nome, last_name=cognome)
    except:
        controllo=False

    return JsonResponse({'controllo':controllo})

def addLibro(request):
    body = json.loads(request.body)
    titoloLibro=body['titolo']
    autoreLibro=body['autore']
    categoriaLibro=body['categoria']
    nPagine=body['nPagine']
    nCopie=body['nCopie']
    controllo=True
    libri=Libro.objects.filter(titolo=titoloLibro)
    messaggio=True

    
    if len(libri)!=0:
        controllo=False
        return JsonResponse({'controllo':controllo, 'messaggio':'esiste già un libro con lo stesso titolo'})
        
    try:
        libro=Libro.objects.create(titolo=titoloLibro, autore=autoreLibro, categoria=categoriaLibro, nPagina=int(nPagine), nCopieMax=nCopie, nCopieRitirate=0)
    except:
        controllo=False
        messaggio='errore in inserimento'
    return JsonResponse({'controllo':controllo, 'messaggio':messaggio})



def eliminaLibro(request):
    id=request.GET['id']
    libro=Libro.objects.get(id=id)
    if int(libro.nCopieRitirate) > 0:
        return JsonResponse({'operazione':False, 'mex':'Ci sono copie di questo libro non ancora consegnate'})
    else:
        libro.delete()
        return JsonResponse({'operazione':True, 'mex':'Il libro è stato eliminato con successo'})

def eliminaUser(request):
    id=request.GET['id']
    controllo=True
    user=Prestiti.objects.filter(idUtente=id, nCopiePrestate__gt=0)
    if len(user)!=0:
        controllo=False
        return JsonResponse({'operazione':controllo, 'mex':'Questo utente deve ancora consegnare dei libri'})
    else:
        user=User.objects.get(id=id).delete()
        controllo=eliminaPrestito(request, id)
    return JsonResponse({'operazione':controllo, 'mex':'Questo utente è stato cancellato con successo'})

def eliminaPrestito(request, id):
    users=Prestiti.objects.filter(idUtente=id)
    for u in users:
        u.delete()
    return True

def modificaLibro(request):
    id=request.GET['id']
    libro=Libro.objects.get(id=id)
    
    return JsonResponse({'libro':model_to_dict(libro)})

def modificaUser(request):
    id=request.GET['id']
    utente=User.objects.get(id=id)
    
    return JsonResponse({'utente':model_to_dict(utente)})

def salvaLibro(request):
    operazione=True
    id=request.GET['id']
    libro=Libro.objects.get(id=id)
    body = json.loads(request.body)
    libro.titolo=body['titolo']
    libro.autore=body['autore']
    libro.categoria=body['categoria']
    libro.nPagina=body['nPagine']
    libro.nCopieMax=body['nCopie']

    try:
        libro.save()
    except:
        operazione=False

    return JsonResponse({'operazione':operazione})

def salvaUser(request):
    operazione=True
    id=request.GET['id']
    utente=User.objects.get(id=id)
    body = json.loads(request.body)
    utente.first_name=body['nome']
    utente.last_name=body['cognome']
    utente.username=body['userNameAdd']
    utente.password=make_password(body['passwordAdd'])

    try:
        utente.save()
    except:
        operazione=False

    return JsonResponse({'operazione':operazione})


def ajax_getLibri(request):
    libri=Libro.objects.all().order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nPagina','nCopieMax','nCopieRitirate')
    return JsonResponse({'libri':list(libri)})


def ajax_getLibriFilter(request):
    titolo=request.GET['titolo']
    autore=request.GET['autore']
    categoria=request.GET['categoria']
    if titolo == '' and autore=='' and categoria=='':
        return ajax_getLibri(request)
    elif titolo != '' and autore=='' and categoria=='':
        libri=Libro.objects.filter(titolo__icontains=titolo).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    elif titolo == '' and autore!='' and categoria=='':
        libri=Libro.objects.filter(autore__icontains=autore).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    elif titolo == '' and autore=='' and categoria!='':
        libri=Libro.objects.filter(categoria__icontains=categoria).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    elif titolo != '' and autore!='' and categoria=='':
        libri=Libro.objects.filter(titolo__incontains=titolo,autore__icontains=autore).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    elif titolo != '' and autore=='' and categoria!='':
        libri=Libro.objects.filter(titolo__incontains=titolo,categoria__icontains=categoria).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    elif titolo == '' and autore!='' and categoria!='':
        libri=Libro.objects.filter(autore__incontains=autore,categoria__icontains=categoria).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
    else:
        libri=Libro.objects.filter(titolo__incontains=titolo,autore__incontains=autore,categoria__icontains=categoria).order_by('categoria','autore','titolo').values('id', 'titolo', 'autore', 'categoria', 'nCopieMax','nCopieRitirate')
   
    return JsonResponse({'libri':list(libri)})

def getUtenteId(request):
    id=request.GET['id']
    utente=User.objects.filter(is_superuser=False, id=id).values('first_name', 'last_name')
    return JsonResponse({'utente':list(utente)})

def ajax_getUtenti(request):
    utenti=User.objects.filter(is_superuser=False).values('id', 'first_name', 'last_name', 'username')

    return JsonResponse({'utenti':list(utenti)})

def getPrestiti(request):
    prestiti=Prestiti.objects.all().values('idUtente', 'libro', 'nCopiePrestate', 'dataRitiro', 'dataConsegna')
    result=[]
    for p in prestiti:
        utente = User.objects.get(id=p['idUtente'])
        result.append({'nome': utente.first_name, 'cognome':utente.last_name, 'id':utente.id})
    return JsonResponse({'prestiti':list(prestiti), 'result': result})

def getPrestitiUtente(request):
    idPrestito=request.GET['id']
    prestiti=Prestiti.objects.filter(idUtente=idPrestito)
    result=[]
    for p in prestiti:
        result.append(model_to_dict(p))
    return JsonResponse({'prestiti':result})

def utenti(request):
    if request.user.id is not None:
        return render(request, 'utenti.html')
    else:
        return redirect('home')

def libri(request):
    if request.user.id is not None:
        return render(request, 'libri.html')
    else:
        return redirect('home')
    
def homePageAdmin(request):
    if request.user.id is not None:
        return render(request, 'homeAdmin.html')
    else:
        return redirect('home')
    
def homePageUser(request):
    if request.user.id is not None:
        return render(request, 'home.html')
    else:
        return redirect('home')
    
def paginaAddUser(request):
    if request.user.id is not None:
        return render(request, 'addUser.html')
    else: 
        return redirect('home')

def paginaModificaUser(request):
    id=request.GET['id']
    utente=User.objects.get(id=id)
    if request.user.id is not None:
        return render(request, 'modificaUser.html', context={'utente':utente})
    else: 
        return redirect('home')

def paginaAddLibro(request):
    if request.user.id is not None:
        return render(request, 'addLibro.html')
    else: 
        return redirect('home')

def paginaModificaLibri(request):
    id=request.GET['id']
    libro=Libro.objects.get(id=id)
    if request.user.id is not None:
        return render(request, 'modificaLibro.html', context={'libro':libro})
    else: 
        return redirect('home')

def ritira(request):
    id=request.GET['id']
    utente=User.objects.get(id=id)
    if request.user.id is not None:
        return render(request, 'ritira.html', context={'utente':utente})
    else: 
        return redirect('home')
    
def consegna(request):
    id=request.GET['id']
    utente=User.objects.get(id=id)
    if request.user.id is not None:
        return render(request, 'consegna.html', context={'utente':utente})
    else: 
        return redirect('home')
    
def prestiti(request):
    
    if request.user.id is not None:
        return render(request, 'prestiti.html')
    else: 
        return redirect('home')

def ritiraLibro(request):
    id=request.GET['id'].split(',')
    copie=request.GET['copie'].split(',')
    idUser=request.GET['idUser']
    k=0
    for i in id:
        libro=Libro.objects.get(id=i)
        libro.nCopieRitirate+=int(copie[k])
        libro.save()
        if len(Prestiti.objects.filter(idUtente=idUser, libro=libro.titolo)) == 0:
            prestito=Prestiti.objects.create(idUtente=idUser, libro=libro.titolo, nCopiePrestate=copie[k], dataRitiro=date(year=date.today().year,month=date.today().month, day=date.today().day), dataConsegna=date(year=date.today().year,month=date.today().month+1, day=date.today().day))
            k+=1
        else:
            prestito=Prestiti.objects.get(idUtente=idUser, libro=libro.titolo)
            prestito.nCopiePrestate+=int(copie[k])
            prestito.save()
            k+=1

    return JsonResponse({'controllo':True})

def consegnaLibro(request):
    id=request.GET['id'].split(',')
    copie=request.GET['copie'].split(',')
    titoli=request.GET['titoli'].split(',')
    k=0
    for i in id:
        libro=Libro.objects.get(titolo=titoli[k])
        libro.nCopieRitirate-=int(copie[k])
        libro.save()
        prestito=Prestiti.objects.get(id=i)
        prestito.nCopiePrestate-=int(copie[k])
        prestito.save()
    return JsonResponse({'controllo':True})

