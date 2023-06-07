/*

1. Ottenere tutti gli ordini clienti (Anno, Numero, DataDocumento, RagioneSociale, IdBanca, DSBANCA, IdAgenzia, dsAgenzia, IdLingua, DsLingua) collegato con i clienti, banche, 
    agenzie, lingue dell'anno 2016 dove il cliente non è obsoleto

    SELECT T.Anno, C.RagioneSociale, T.IdBanca, B.DsBanca,
    T.IdAgenzia, A.DsAgenzia, T.IdLingua, L.DsLingua
    FROM OrdiniCliTeste T
    INNER JOIN Clienti C ON T.IdCliente=C.IdConto
    INNER JOIN Banche B ON T.IdBanca=B.IdBanca
    INNER JOIN Agenzie A ON T.IdAgenzia=A.IdAgenzia AND A.IdBanca= B.IdBanca
    INNER JOIN Lingue L ON T.IdLingua=L.IdLingua
    WHERE T.Anno=2016 AND C.DataObsoleto IS NULL

2. Ottenere tutte le bolle clienti (Anno, Numero, DataDocumento, RagioneSociale, IdBanca, IdAgenzia, dsAgenzia, IdLingua, DsLingua) collegato con i clienti, banche, agenzie, 
    lingue dell'anno 2012 dove il cliente non è obsoleto

    SELECT T.Anno, T.Numero, C.RagioneSociale, T.DataDocumento, T.IdBanca, B.DsBanca,
    T.IdAgenzia, A.DsAgenzia, T.IdLingua, L.DsLingua, C.DataObsoleto
    FROM BolleCliTeste T
    INNER JOIN Clienti C ON T.IdCliente=C.IdConto
    INNER JOIN Banche B ON T.IdBanca=B.IdBanca
    INNER JOIN Agenzie A ON T.IdAgenzia=A.IdAgenzia AND A.IdBanca= B.IdBanca
    INNER JOIN Lingue L ON T.IdLingua=L.IdLingua
    WHERE T.Anno=2014 AND C.DataObsoleto IS NULL

3. Ottenere tutte le fatture clienti (Anno, Numero, DataDocumento, RagioneSociale, IdBanca, IdAgenzia, dsAgenzia, IdLingua, DsLingua) collegato con i clienti, banche, agenzie, 
    lingue dell'anno 2010 dove il cliente non è obsoleto

    SELECT T.Anno, T.Numero, C.RagioneSociale, T.DataDocumento, T.IdBanca, B.DsBanca,
    T.IdAgenzia, A.DsAgenzia, T.IdLingua, L.DsLingua, C.DataObsoleto
    FROM FattureCliTeste T
    INNER JOIN Clienti C ON T.IdCliente=C.IdConto
    INNER JOIN Banche B ON T.IdBanca=B.IdBanca
    INNER JOIN Agenzie A ON T.IdAgenzia=A.IdAgenzia AND A.IdBanca= B.IdBanca
    INNER JOIN Lingue L ON T.IdLingua=L.IdLingua
    WHERE T.Anno=2010 AND C.DataObsoleto IS NULL

4. Visualizzare il codice cliente, ragione sociale degli ordini clienti con il numero di quante volte quel cliente ha effettuato un ordine
    001, GEASOFTWARE, 5
    002, JEAN MONNET, 10

    
    SELECT T.IdCliente, C.RagioneSociale, COUNT(T.IdCliente)
    FROM OrdiniCliTeste T
    INNER JOIN Clienti C ON T.IdCliente=C.IdConto
    WHERE T.Anno=2012
    GROUP BY T.IdCliente, C.RagioneSociale


GROUP BY
COUNT(*)

Tabelle: OrdiniCliTeste, BolleCliTeste, FattureCliTeste, Banche, Agenzie, Lingue, Clienti
DataObsoleto


5. visualizzare tutti dati della testata ordine dove la somma degli importi netti delle relative righe risulta maggiore di 50

    SELECT T.Anno, T.Numero, r.importonetto, SUM(R.ImportoNetto)
    FROM FattureCliTeste T
    INNER JOIN FattureCliRighe R ON R.KFattCliT=T.KFattCliT
    GROUP BY T.Anno, T.Numero, r.importonetto
    HAVING SUM(R.ImportoNetto)>7000
    ORDER BY T.Anno, T.Numero

6. visualizzare anno, numero della testa, ragione sociale del cliente, descrizione prodotto del rigo di tutte le fatture clienti 
    dove la ragione sociale del cliente inizia per 'C'

    SELECT T.Anno, t.Numero, C.RagioneSociale, A.DsProdotto
    FROM FattureCliTeste T
    INNER JOIN Clienti C ON C.IdConto=T.IdCliente
    INNER JOIN FattureCliRighe R ON R.KFattCliT=T.KFattCliT
    INNER JOIN Articoli A ON A.IdProdotto=R.IdProdotto
    WHERE C.RagioneSociale LIKE '%trasp%'


-- IN
7. visualizzare anno, numero della testa, ds prodotto della riga dove i codici prodotti delle righe corrispondono a
100
101
12
15
15/C
18
18 P
18/B
18/C
18PA
18TS

SELECT DISTINCT T.Anno, T.Numero, A.DsProdotto, A.IdProdotto
FROM Articoli A
INNER JOIN FattureCliRighe R ON A.IdProdotto=R.IdProdotto
INNER JOIN FattureCliTeste T ON T.KFattCliT=R.KFattCliT
WHERE A.IdProdotto IN ('100','101','12','15','15/C','18','18/P','18/B','18/C','18PA','18TS')


-- (between, >= e <=)
8.visualizzare anno, numero, data documento delle fatture comprese tra 01/05/2015 e 31/05/2015. 
yyyy-mm-dd
yyyymmdd

SELECT T.Anno, T.Numero, T.DataDocumento
FROM FattureCliTeste T
WHERE T.DataDocumento BETWEEN '20150501' AND '20150531'
ORDER BY T.DataDocumento

SELECT T.Anno, T.Numero, T.DataDocumento
FROM FattureCliTeste T
WHERE T.DataDocumento >= '20150501' AND T.DataDocumento <= '20150531'
ORDER BY T.DataDocumento


-- UPDATE
9. aggiornami le descrizioni dei prodotti dove il FlStato = 1 (la nuova descrizione sarà la descrizione + ' TEST')

UPDATE Articoli 
SET DsProdotto=DsProdotto+'test'
WHERE FlStato = '1'


-- DELETE
10 eliminami il prodotto dove il codice prodotto è uguale a "PROVA"

DELETE FROM Articoli WHERE IdProdotto='PROVA'


-- INSERT
11 inserisci un nuovo record nella tabella "ZoneConsegna"

INSERT INTO ZoneConsegna(IdZonaConsegna,DsZonaConsegna,FlUtilizzo)
VALUES ('1', 'Via Milano 33', 1)


-- UNION
12 fammi vedere tipoCampo ("Bolla", "Fattura", "Ordine"), anno, numero da bolle, fatture, ordini dove l'anno è 2015 ordinati per ragione sociale decrescente del cliente

SELECT 'Bolla' AS TipoDocumento,B.Anno, B.Numero,  C.RagioneSociale
FROM BolleCliTeste B
INNER JOIN Clienti C ON C.IdConto=B.IdCliente
UNION 
SELECT 'Fattura' AS TipoDocumento,F.Anno, F.Numero, C.RagioneSociale
FROM FattureCliTeste F
INNER JOIN Clienti C ON C.IdConto=F.IdCliente
UNION 
SELECT 'Ordine' AS TipoDocumento,O.Anno, O.Numero, C.RagioneSociale
FROM OrdiniCliTeste O
INNER JOIN Clienti C ON C.IdConto=O.IdCliente
ORDER BY C.RagioneSociale DESC


-- case
13.fammi vedere codice prodotto, ds prodotto dagli articoli, e un campo "attivo" se flStato = 0, altrimenti "non attivo"

SELECT FlStato,IdProdotto, DsProdotto,	
CASE
	WHEN FlStato=0 THEN 'Attivo'
	ELSE 'Non Attivo'
END AS Stato
FROM Articoli 


14 crea un nuovo DB che si chiama "TestTommaso"

CREATE DATABASE TommmasoTest


15 crea una tabella nel nuovo DB che si chiama "Articoli" con campi codice e descrizione

CREATE TABLE Persone(
	Nome char(20),
	Cognome char(20),
	DataNascita char(10),
	Altezza float,
	NumeroScarpa tinyint
)


16 aggiungi in un secondo momento un nuovo campo sulla tabella "Articoli" che si chiama "Prezzo" ed è un numero decimale

ALTER TABLE Articoli
ADD PrezzoTest float


17 crea una nuova tabella a tuo piacimento e poi distruggila

CREATE TABLE PersoneTEST(
	Nome char(20),
	Cognome char(20),
	DataNascita char(10),
	Altezza float,
	NumeroScarpa tinyint
)

DROP TABLE PersoneTEST


18 visualizzae anno, numero delle fatture dove il codice cliente è '00000668' tramite variabili

DECLARE @client AS nvarchar(8)
SET @client = '00000668'

SELECT T.Anno, T.Numero, T.IdCliente
FROM FattureCliTeste T
WHERE T.IdCliente=@client


19 visualizzare per le fatture clienti con cliente = "00001152" anno, numero fattura, dsprodotto, un campo "nuovoCampo" 
che unisce l'eventuale descrizione del prodotto con le sue note.
se le note o la descrizione sono nulle, fammi uscire "descrizione non presente" o "note non presente"
ISNULL()
CONCAT()

SELECT T.Anno, T.Numero, A.IdProdotto,CONCAT(ISNULL(A.DsProdotto, 'Nessuna descrizione'), '-',
ISNULL(A.Note,'Nessuna nota'))
FROM FattureCliTeste T
INNER JOIN FattureCliRighe R ON T.KFattCliT= R.KFattCliT
LEFT JOIN Articoli A ON A.IdProdotto=R.IdProdotto
WHERE T.IdCliente='00000668'




select
from (prima tabella)
join (collegare n tabelle con paragone colonne)
where (condizioni)
gorup by (raggruppare info da visualizzare)
order by

*/

