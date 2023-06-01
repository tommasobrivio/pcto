class Lavoratore():
    def __init__(self, n, pO, pS, oF):
        self.nome=n
        self.pagaOraria=pO
        self.pagaStraordinari=pS
        self.oreFerieIniziali=oF
        self.listaOrari=[]
        self.minutiFerieUsate=0
        self.stipendioSettimanale=0
        self.minutiStraordinari=0
        
    
    def setOrari(self, g, iM, uM, iP, uP):
        orari={
            'giorno':g,
            'ingressoMattina': iM,
            'uscitaMattina':uM,
            'ingressoPomeriggio':iP,
            'uscitaPomeriggio':uP
        }
        self.listaOrari.append(orari)

def calcoloMinutiTotali(l):
    totSettimana=0
    totWeekend=0
    i=0
    for o in l.listaOrari:
        if len(l.listaOrari)>5:
            while i<=5:
                if o['ingressoMattina'] != '' and o['uscitaMattina'] != '':
                    totSettimana+=(int(o['uscitaMattina'][8:10])*60-int(o['ingressoMattina'][8:10])*60)
                    totSettimana+=(int(o['uscitaMattina'][10:12])-int(o['ingressoMattina'][10:12]))

                if o['ingressoPomeriggio'] != ' ' or o['uscitaPomeriggio'] != ' ':
                    totSettimana+=(int(o['uscitaPomeriggio'][8:10])*60-int(o['ingressoPomeriggio'][8:10])*60)
                    totSettimana+=(int(o['uscitaPomeriggio'][10:12])-int(o['ingressoPomeriggio'][10:12]))
                i+=1

            if o['ingressoMattina'] != '' and o['uscitaMattina'] != '':
                    totWeekend+=(int(o['uscitaMattina'][8:10])*60-int(o['ingressoMattina'][8:10])*60)
                    totWeekend+=(int(o['uscitaMattina'][10:12])-int(o['ingressoMattina'][10:12]))

            if o['ingressoPomeriggio'] != ' ' or o['uscitaPomeriggio'] != ' ':
                totWeekend+=(int(o['uscitaPomeriggio'][8:10])*60-int(o['ingressoPomeriggio'][8:10])*60)
                totWeekend+=(int(o['uscitaPomeriggio'][10:12])-int(o['ingressoPomeriggio'][10:12]))
        else:
            if o['ingressoMattina'] != '' and o['uscitaMattina'] != '':
                totSettimana+=(int(o['uscitaMattina'][8:10])*60-int(o['ingressoMattina'][8:10])*60)
                totSettimana+=(int(o['uscitaMattina'][10:12])-int(o['ingressoMattina'][10:12]))

            if o['ingressoPomeriggio'] != ' ' or o['uscitaPomeriggio'] != ' ':
                totSettimana+=(int(o['uscitaPomeriggio'][8:10])*60-int(o['ingressoPomeriggio'][8:10])*60)
                totSettimana+=(int(o['uscitaPomeriggio'][10:12])-int(o['ingressoPomeriggio'][10:12]))


    return totSettimana,totWeekend

    

    
        
with open('secondo/timbrature.csv') as f:
    lines = f.readlines()

listaLavoratori=[]

i=-1

for line in lines:
    if line[0]=='-':
        tmp=line.split(';')
        listaLavoratori.append(Lavoratore(tmp[0], tmp[1], tmp[2], tmp[3]))
        g=1
        i+=1
    else:
        tmp=line.split(';')
        listaLavoratori[i].setOrari(g,tmp[0], tmp[1], tmp[2], tmp[3])
        g+=1




for k in listaLavoratori:
    stipendioStraordinari=0
    minutiSettimana, minutiWeekend=calcoloMinutiTotali(k)
    if len(k.listaOrari)<=5:
        minutiFerie=(8*60*5) - minutiSettimana
    if minutiFerie>0:
        k.minutiFerieUsate+=minutiFerie

    else:
        k.minutiStraordinari=minutiFerie*(-1)
        stipendioStraordinari=((minutiFerie*(-1))/60)*int(k.pagaStraordinari) + minutiWeekend*int(k.pagaStraordinari)
    
    k.stipendioSettimanale=8 * int(k.pagaOraria) *5 + stipendioStraordinari


oreFerie=0
with open('secondo/risultato.csv', 'w') as f:
    for l in listaLavoratori:
        #nome
        l.nome=l.nome.replace('-',' ')
        f.write(f'nome lavoratore: {l.nome}\n')

        #ore straordinari
        if l.minutiStraordinari==0 and minutiWeekend==0:
            f.write(f'ore straordinarie: 0\n')
        elif l.minutiStraordinari==0 and minutiWeekend>0:
            oreWeekend=int(minutiWeekend/60)
            minutiWeekend-=oreWeekend*60
            f.write(f'ore straordinarie: {oreWeekend}, minuti {minutiWeekend}\n')
        else:
            oreWeekend=int(minutiWeekend/60)
            oreStraordinari=int(l.minutiStraordinari/60)
            straordinariTotOre=oreWeekend+oreStraordinari
            straordinariTotMinuti=(minutiWeekend-oreWeekend*60)+(l.minutiStraordinari-oreStraordinari*60)
            f.write(f'ore straordinarie: {oreStraordinari}, minuti {straordinariTotMinuti}\n')

        #ore ferie prese
        if l.minutiFerieUsate>0:
            f.write(f'ore ferie: {int(l.minutiFerieUsate/60)}, minuti {l.minutiFerieUsate-oreFerie*60}\n')
        else: 
            f.write(f'ore ferie: 0\n')

        #stipendio settimanale
        f.write(f'paga settimanale: {l.stipendioSettimanale}\n')

        #ore feriali rimanenti
        l.oreFerieIniziali=l.oreFerieIniziali.replace('\n', ' ')
        minutiFerieIniziali=int(l.oreFerieIniziali)*60
        minutiFerieRimanenti=minutiFerieIniziali-l.minutiFerieUsate
        oreFerieRimanenti=int(minutiFerieRimanenti/60)
        minutiFerieRimanenti-=oreFerieRimanenti*60
        f.write(f'ore ferie mancanti: {oreFerieRimanenti}, minuti: {minutiFerieRimanenti}\n')




