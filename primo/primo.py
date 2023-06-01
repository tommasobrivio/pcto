numeri=['0','1','2','3','4','5','6','7','8','9']


class Studente:
    

    def __init__(self,name,nOp, op):
        self.nome=name
        self.operazioni=nOp
        self.listaOperazioni=op
        self.sbagliate=0
        self.listaSbagliate=[]
        self.voto=0

    def setSbagliate(self):
        self.sbagliate+=1

    def setVoto(self):
        punteggio=10/int(self.operazioni)
        self.voto=10-int(self.sbagliate)*punteggio

    def setListaSbagliate(self, lista):
        self.listaSbagliate.append(lista)
    

def controllaNumero(str):
    global numeri
    for i in numeri:
        if str[0] == i:
            return True
    
    return False

def cercaSegno(str):
    if '+' in str: 
        return '+'
    if '-' in str: 
        return '-'
    if '*' in str: 
        return '*'
    if '/' in str: 
        return '/'

def controllaOperazioni(s):
    n1=0
    n2=0
    ris=0
    a=[]
    
 
    k=0
    for i in s.listaOperazioni:
        a=i.split('=')
        ris=int(a[1])
        a=a[0].split(cercaSegno(i))
        n1=int(a[0])
        n2=int(a[1])
        
        if cercaSegno(i) == '+':
            if n1+n2!=ris:
                s.setSbagliate()                
                s.setListaSbagliate(s.listaOperazioni[k])
        if cercaSegno(i) == '-':
            if n1-n2!=ris:
                s.setSbagliate()
                s.setListaSbagliate(s.listaOperazioni[k])
        if cercaSegno(i) == '*':
            if n1*n2!=ris:
                s.setSbagliate()
                s.setListaSbagliate(s.listaOperazioni[k])
        if cercaSegno(i) == '/':
            if n1/n2!=ris:
                s.setSbagliate()
                s.setListaSbagliate(s.listaOperazioni[k])
        k+=1

        


with open('operazioni.txt') as f:
    lines = f.readlines()

i=0
oper=0
array=[]
operazioni=[]
for line in lines:
    line=line.replace('\n',' ')
    
    if controllaNumero(line) == False:
        if i==0:
            n=line
            i+=1
        else:
            s=Studente(n, oper, operazioni)
            array.append(s)
            oper=0
            n=line
            operazioni=[]

    else :
        oper+=1
        operazioni.append(line)
    
s=Studente(n, oper, operazioni)
array.append(s)

for k in array:
    controllaOperazioni(k) 
    k.setVoto()

with open('risultato.txt', 'w') as f:
    for k in array:
        f.write(f'nome studente: {k.nome}\n')  
        f.write(f'totale operazioni: {k.operazioni}\n') 
        f.write(f'operazioni corrette: {k.operazioni-k.sbagliate}\n')   
        f.write(f'operazioni sbagliate: {k.sbagliate}\n')  
        f.write(f'voto finale: {k.voto}\n') 
        for i in k.listaSbagliate:
            segno =cercaSegno(i)
            a=i.split('=')
            ris=int(a[1])
            a=a[0].split(segno)
            n1=int(a[0])
            n2=int(a[1])
            if segno == '+':
                ris=n1+n2
                f.write(f'correzione delle risposte sbagliate: {n1} + {n2} = {ris}\n')
            if segno == '-':
                ris=n1-n2
                f.write(f'correzione delle risposte sbagliate: {n1} - {n2} = {ris}\n')
            if segno == '*':
                ris=n1*n2
                f.write(f'correzione delle risposte sbagliate: {n1} * {n2} = {ris}\n')
            if segno == '/':
                ris=n1/n2
                f.write(f'correzione delle risposte sbagliate: {n1} / {n2} = {ris}\n')
          

            


