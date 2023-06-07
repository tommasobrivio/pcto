/*

1. fammi vedere esercizio, numero odl, numero odp, codice prod, ds prod, ds um, la ds del tipo prodotto, la qta da produrre, cod fase, ds fase, cod macchina, ds macchina
dove la quantita da produrre è maggiore di 70, se unita di misura null-> messaggio, se nota vuota o null -> messaggio

SELECT Ol.Esercizio, Ol.NumeroOdl, Ol.NumeroOdp, A.IdArticolo, A.Descrizione, 
CASE
WHEN A.Note='' THEN 'Nota vuota'
WHEN A.Note IS NULL THEN 'Nota non presente'
ELSE A.Note
END AS Note,
ISNULL(U.Descrizione, 'Descrizione non presente') AS UM,
CASE
WHEN A.IdTipoProdotto='' THEN 'Tipo prodotto assente'
ELSE P.Descrizione
END AS Descrizione,
Ol.QuantitaLav, F.IdFase, F.Descrizione, M.IdMacchina, M.Descrizione
FROM OrdiniDiLavoro Ol
LEFT JOIN Articoli A ON A.IdArticolo=Ol.IdArticolo
LEFT JOIN UnitaMisura U ON U.IdUm=A.IdUm
LEFT JOIN TipiProdotto P ON P.IdTipoProdotto=A.IdTipoProdotto
INNER JOIN ArticoliFasi Af ON Af.IdArticolo=A.IdArticolo
INNER JOIN Fasi F ON F.IdFase=Af.IdFase
INNER JOIN Macchine M ON M.IdMacchina=Af.IdMacchina
WHERE Ol.QuantitaLav>70




2. fammi vedere esercizio, numero odl, numero odp, codice prod, ds prod, sommando i tempi di lavorazione
dove la quantita da produrre è maggiore di 70


SELECT Ol.Esercizio, Ol.NumeroOdl, Ol.NumeroOdp, A.IdArticolo, A.Descrizione, Ol.TPLTGG AS GiorniTotali,
SUM(Ol.TPLHH) + SUM(Ol.TPAHH) + SUM(Ol.TPLTHH) AS OreTotali, SUM(Ol.TPLMM) + SUM(Ol.TPAMM) + SUM(Ol.TPLTMM) 
AS MInutiTotali,  SUM(Ol.TPLSS) + SUM(Ol.TPASS) + SUM(Ol.TPLTSS) AS SecondiTotali, OL.QuantitaLav
FROM OrdiniDiLavoro Ol
INNER JOIN Articoli A  ON A.IdArticolo=Ol.IdArticolo
WHERE Ol.QuantitaLav>70
GROUP BY Ol.Esercizio, Ol.NumeroOdl, Ol.NumeroOdp, A.IdArticolo, A.Descrizione, Ol.TPLTGG, OL.QuantitaLav



*/

