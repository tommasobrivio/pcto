from django.urls import path
from hello import views 

urlpatterns = [
    path("", views.home, name="home"),

    #login logout
    path("login", views._login, name="login"),
    path("logout", views._logout, name="logout"),

    #add user
    path("add",  views.add, name="add"),
    #add libro
    path("addlibro", views.addLibro, name="addLibro"),

    #elimina libro
    path("eliminaLibro", views.eliminaLibro, name="eliminaLibro"),
    #elimina user
    path("eliminaUser", views.eliminaUser, name="eliminaUser"),
    #elimina prestito
    path("eliminaPrestito", views.eliminaPrestito, name="eliminaPrestito"),

    #modifica libro
    path("modificaLibro", views.modificaLibro, name="modificaLibro"),
    #modifica user
    path("modificaUser", views.modificaUser, name="modificaUser"),

    #salva modifiche libro
    path("salvaLibro", views.salvaLibro, name="salvaLibro"),
    #salva modifiche user
    path("salvaUser", views.salvaUser, name="salvaUser"),

    #get libri
    path("ajax_getLibri", views.ajax_getLibri,name="ajax_getLibri"),
    #get libri filtrati titolo, autore, categoria
    path("ajax_getLibriFilter", views.ajax_getLibriFilter,name="ajax_getLibriFilter"),
    #get user
    path("ajax_getUtenti", views.ajax_getUtenti,name="ajax_getUtenti"),
    #get user id
    path("getUtenteId", views.getUtenteId,name="getUtenteId"),
    #get prestiti
    path("getPrestiti", views.getPrestiti,name="getPrestiti"),
    #get prestiti di un utente
    path("getPrestitiUtente", views.getPrestitiUtente,name="getPrestitiUtente"),

    #apre pagina utenti da admin
    path('utenti', views.utenti, name='utenti'),
    #apre pagina libri da admin
    path('libri', views.libri, name='libri'),
    #apre pagina home admin
    path('homePageAdmin', views.homePageAdmin, name='homePageAdmin'),
    #apre pagina home degli utenti
    path("homePageUser", views.homePageUser, name="homePageUser"),
    #apre pagina per aggiungere utenti
    path('paginaAddUser', views.paginaAddUser, name='paginaAddUser'),
    #apre pagina per modificare utenti
    path('paginaModificaUser', views.paginaModificaUser, name='paginaModificaUser'),
    #apre pagina per aggiungere libri
    path('paginaAddLibro', views.paginaAddLibro, name='paginaAddLibro'),
    #apre pagina per modificare libri
    path('paginaModificaLibri', views.paginaModificaLibri, name='paginaModificaLibri'),
    #aprire pagina ritira
    path('ritira', views.ritira, name='ritira'),
    #aprire pagina consegna
    path('consegna', views.consegna, name='consegna'),
    #aprire pagina prestiti
    path('prestiti', views.prestiti, name='prestiti'),

    #permette di ritirare tot libri
    path('ritiraLibro', views.ritiraLibro, name='ritiraLibro'),
    #permette di consegnare tot libri
    path('consegnaLibro', views.consegnaLibro, name='consegnaLibro'),

    


    
]