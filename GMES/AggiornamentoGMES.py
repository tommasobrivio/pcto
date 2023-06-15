import configparser 
import sys
import os

class Tabella():
    def __init__(self, tabella) :
        self.tabella=tabella
        self.listaColonne={}
        self.constraint=[]
        self.sqlCrea=''


    def setCrea(self, crea):
        self.sqlCrea=crea

class Campo():
    def __init__(self, colonna, tipo, identity, nullable, grandezza) :
        self.nomeColonna=colonna
        self.tipo=tipo
        self.identity=identity
        self.nullable=nullable
        self.grandezza=grandezza

class Procedura():
    def __init__(self, procedura, nome) :
        self.procedura=procedura
        self.nome=nome

class View():
    def __init__(self, nome, view) :
        self.nomeView=nome
        self. view=view


        
def controllaFile(lines):
    
    
    leggiColonne = False
    leggiCreaSql=False
    leggiProcedura=False
    leggiView=False
    colonne=[]
    listaTabelle={}
    listaProcedure={}
    listaview={}
    crea=""
    procedura=""
    view=""

    for l in lines:
    
        if l.find("CREATE TABLE") > -1:
            l = l.replace('\n', '').replace('\t', '')
            colonne.clear()
            if len(l.split('.')) >1:
                nomeTabella=l.split('.')[1].replace('[','')
                nomeTabella=nomeTabella.replace(']','')
                nomeTabella=nomeTabella.replace('(','')

                listaTabelle[nomeTabella] = Tabella(nomeTabella) 
                leggiColonne=True
                crea=l+'\n'
                leggiCreaSql=True

        elif l.find("CREATE PROCEDURE")>-1:
            l = l.replace('\n', '').replace('\t', '')
            nomeProcedura=l.split(' ')[2]
            procedura+=l+'\n'
            leggiProcedura=True

        elif l.find("CREATE VIEW") > -1:
            l = l.replace('\n', '').replace('\t', '')
            nomeView=l.split('.')[1].replace('[','')
            nomeView=nomeView.replace(']','')
            view+=l+'\n'
            leggiView=True

        elif l.find("GO")>-1:
            l = l.replace('\n', '').replace('\t', '')
            if leggiCreaSql == True:
                listaTabelle[nomeTabella].setCrea(crea)
                leggiCreaSql=False
            elif leggiView==True:
                listaview[nomeView]=View(nomeView, view)
                leggiView=False
            elif leggiProcedura==True:
                listaProcedure[nomeProcedura]=Procedura(procedura, nomeProcedura)
                leggiProcedura=False  
                

        elif leggiProcedura==True:
            l = l.replace('\n', '').replace('\t', '')
            procedura+=l+'\n'

        elif l.find("ALTER TABLE") >-1:
            l = l.replace('\n', '').replace('\t', '')
            nomeTabella=l.split('.')[1].split(' ')[0].replace('[','').replace(']','')
            listaTabelle[nomeTabella].constraint.append(l)
        
        elif leggiView==True:
            l = l.replace('\n', '').replace('\t', '')
            view+=l+'\n'

        elif l.find("PRIMARY KEY") > -1: 
            l = l.replace('\n', '').replace('\t', '')
            leggiColonne=False     
            crea+=l +'\n'

        elif l.find("PRIMARY KEY") == -1:
            l = l.replace('\n', '').replace('\t', '')
            if leggiColonne==True:
                crea+=l+'\n'
                nomeColonna=l.split(' ')[0].replace('[','')
                nomeColonna=nomeColonna.replace(']','')
                tipoColonna=l.split(' ')[1].replace('[','')
                tipoColonna=tipoColonna.split(']')[0]
                grandezza=""
                if tipoColonna=="nvarchar" or tipoColonna=="datetime2":
                    grandezza=l.split(' ')[1].split(']')[1].split(' ')[0].replace('(','').replace(')','')
                identity=""
                nullable=-1
                if l.find("IDENTITY")>-1:
                    identity=l.split(' ')[2]
                    if l.split(' ')[3]=="NOT":
                        nullable=0
                    else: 
                        nullable=1
                elif l.split(' ')[2]=="NOT":
                    nullable=0
                else: 
                    nullable=1

                listaTabelle[nomeTabella].listaColonne[nomeColonna]= Campo(nomeColonna,tipoColonna,identity, nullable, grandezza)
            elif leggiCreaSql==True:
                crea+=l+'\n'

         
    return listaTabelle, listaProcedure, listaview

        


if getattr(sys,'frozen', False):
    path=sys._MEIPASS
else:
    path=os.path.dirname(os.path.abspath(__file__))

path=os.path.join(path, 'config.ini')
config=configparser.ConfigParser()

config.read(path)
GMES_Sorgente=config['config']['gmes_sorgente']
GMES_Ultimo=config['config']['gmes_ultimo']
Cartella_Salvataggio=config['config']['cartella_salvataggio']


f = open(GMES_Sorgente, "r")

lines  = f.readlines()

tabelleSorgente, procedureSorgente, viewsSorgente = controllaFile(lines)


f = open(GMES_Ultimo, "r")
lines  = f.readlines()

tabelleFinali, procedureFinali, viewsFinali= controllaFile(lines)

fileSave=os.path.join(Cartella_Salvataggio, "aggiornamento.sql")

# f=open(fileSave, 'w')

queryDrop=""

arrayCreate=[]
arrayAlter=[]
arrayDrop=[]

#controllo se si deve aggiungere qualocosa dal vecchio al nuovo
for key in tabelleFinali.keys():
    scritto=False
    if tabelleSorgente.get(key, None) is None: 
        arrayCreate.append(tabelleFinali[key].sqlCrea+'\n\n')
    else:
        for field in tabelleFinali[key].listaColonne.keys():
            #se non esiste la colonna
            if tabelleSorgente[key].listaColonne.get(field, None) is None:
                #cerca nelle constraint finali se esiste l' ALTER TABLE per quella colonna
                for i in range(len(tabelleFinali[key].constraint)):
                    #se esiste copia
                    if tabelleFinali[key].constraint[i].find(field) > -1:
                        #copiare l' ALTER TABLE
                        if tabelleFinali[key].listaColonne[field].nullable==0:
                            null="NOT NULL"
                        else:
                            null="NULL"
                        queryAlterRow= "ALTER TABLE " + key + " ADD " + field + ' '+ tabelleFinali[key].listaColonne[field].tipo +' '+ null +' \n'+ tabelleFinali[key].constraint[i]
                        arrayAlter.append(queryAlterRow+'\n\n')
                        scritto=True
                    #se no crea

                if scritto==False:    
                    if tabelleFinali[key].listaColonne[field].nullable==0:
                        null="NOT NULL"
                    else:
                        null="NULL"
                    #crea ALTER standard
                    queryAlterRow= "ALTER TABLE " + key + " ADD " + field +' '+ tabelleFinali[key].listaColonne[field].tipo + '(' +tabelleFinali[key].listaColonne[field].grandezza  +') '+ null
                    arrayAlter.append(queryAlterRow+'\n\n')
            #se esiste controllo tipo, identity, nullable, grandezza
            else:
                if tabelleFinali[key].listaColonne[field].tipo == tabelleSorgente[key].listaColonne[field].tipo:

                    if tabelleFinali[key].listaColonne[field].nullable == tabelleSorgente[key].listaColonne[field].nullable:

                        if tabelleFinali[key].listaColonne[field].grandezza == tabelleSorgente[key].listaColonne[field].grandezza:

                            pass

                        else:

                            if tabelleFinali[key].listaColonne[field].nullable==0:
                                null="NOT NULL"
                            else:
                                null="NULL"

                            queryAlterColumn = "ALTER TABLE " + tabelleSorgente[key] + " ALTER COLUMN " + tabelleFinali[key].listaColonne[field].nomeColonna +' '+ tabelleFinali[key].listaColonne[field].tipo +' '+ tabelleFinali[key].listaColonne[field].grandezza + ' '+null
                            arrayAlter.append(queryAlterColumn+'\n')

                    else:

                        if tabelleFinali[key].listaColonne[field].nullable==0:
                            null="NOT NULL"
                        else:
                            null="NULL"

                        queryAlterColumn = "ALTER TABLE " + tabelleSorgente[key] + " ALTER COLUMN " + tabelleFinali[key].listaColonne[field].nomeColonna +' '+ tabelleFinali[key].listaColonne[field].tipo +' '+ tabelleFinali[key].listaColonne[field].grandezza +' '+ null
                        arrayAlter.append(queryAlterColumn+'\n')
                
                else:
                    if tabelleFinali[key].listaColonne[field].nullable==0:
                        null="NOT NULL"
                    else:
                        null="NULL"

                    queryAlterColumn = "ALTER TABLE " + tabelleSorgente[key] + " ALTER COLUMN " + tabelleFinali[key].listaColonne[field].nomeColonna + ' '+tabelleFinali[key].listaColonne[field].tipo +' '+ tabelleFinali[key].listaColonne[field].grandezza +' '+ null
                    arrayAlter.append(queryAlterColumn+'\n')

        for i in range(len(tabelleFinali[key].constraint)-1):
            
            if tabelleFinali[key].constraint[i].find("ALTER TABLE") > -1:
                idx=3 if tabelleFinali[key].constraint[i].split(' ')[3] != "" else  4
                if tabelleFinali[key].constraint[i].split(' ')[idx] not in ["WITH","CHECK"] :
                    constFinale=tabelleFinali[key].constraint[i].split(' ')[6].replace('_1','')

                    try:
                        constSorgente=tabelleSorgente[key].constraint[i].split(' ')[6].replace('_1','')
                        if tabelleFinali[key].constraint[i].split(' ')[6] ==tabelleSorgente[key].constraint[i].split(' ')[6]:
                            continue

                        elif constSorgente==constFinale:
                            queryDrop="ALTER TABLE "+ tabelleFinali[key].tabella + " DROP CONSTRAINT " + tabelleFinali[key].constraint[i].split(' ')[6].replace('[','').replace(']','').replace('_1','')
                            arrayAlter.append(queryDrop+'\n'+tabelleFinali[key].constraint[i]+'\n')

                        else: 
                            continue
                    except Exception as E:
                        print(E)
                else: 
                    continue
            else :
                continue

            
for key in procedureFinali.keys():
    if procedureSorgente.get(key, None) is None:
        arrayCreate.append(procedureFinali[key].procedura)
    else :
        pass

for key in viewsFinali.keys():
    if viewsSorgente.get(key, None) is None:
        arrayCreate.append('\n'+viewsFinali[key].view)

    else: 
        pass

for key in procedureSorgente.keys():
    if procedureFinali.get(key, None) is None:
        query="DROP PROCEDURE "+procedureSorgente[key].nome
        arrayDrop.append('\n'+query)
    else :
        pass

                        
with open(fileSave, 'w') as f:
    for i in range(len(arrayCreate)):
        f.write(arrayCreate[i]+'\n')

    f.write('\nGO\n')

    for i in range(len(arrayDrop)):
        f.write(arrayDrop[i]+'\n')

    f.write('\nGO\n')

    for i in range(len(arrayAlter)):
        f.write(arrayAlter[i]+'\n')
