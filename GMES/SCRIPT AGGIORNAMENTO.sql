CREATE VIEW [dbo].[vOrdiniDiLavoro] AS

SELECT L.IdOdl, L.Esercizio, L.NumeroOdl, L.NumeroOdp, L.Sequenza, L.IdArticolo, L.Descrizione, L.IdUm, L.QuantitaLav, L.DataOraInserimento, L.DataOraInvioProduzione, L.DataOraFineProduzione,
L.DataOraInizioPrevista, L.DataOraFinePrevista, L.DataConsegna, L.IdCliente, L.IdMacchina, L.IdCommessa, L.IdArticoloFase, L.IdFase,
CASE 
WHEN L.FlStato = 0 THEN 'In attesa'
WHEN L.FlStato = 10 THEN 'Finito'
WHEN L.FlStato = 5 THEN 'In lavorazione'
END AS StatoODL,
L.TPLHH, L.TPLMM, L.TPLSS, L.TPAHH, L.TPAMM, L.TPASS, L.TPLTGG, L.TPLTHH, L.TPLTMM, L.TPLTSS, L.Costo AS CostoODL, L.ImportoNetto AS ImportoNettoODL,
LM.IdOdlMateriale, LM.IdArticoloMateriale, LM.IdMateriale, LM.DescrizioneMateriale, LM.IdUm AS IdUmMateriale, LM.QuantitaSingola AS QuantitaSingolaMateriale, LM.QuantitaTotale AS QuantitaTotaleMateriale,
LM.Costo AS CostoMateriale 
FROM OrdiniDiLavoro L
LEFT JOIN OrdiniDiLavoroMateriali LM ON L.IdOdl = LM.IdOdl
GO


ALTER TABLE ArticoliFasi
ADD NoteAttrezzaggio nvarchar(max) NULL    


ALTER TABLE Attrezzi
ADD PathImmagine nvarchar(max) NULL   

ALTER TABLE [dbo].[OrdiniDiLavoro] 
ADD  CONSTRAINT [DF_OrdiniDiLavoro_OrdinamentoProd_1]  DEFAULT ((0)) FOR [OrdinamentoProd]    --letto

ALTER TABLE [dbo].[Articoli] ADD  CONSTRAINT [DF_Articoli_FlUltimaRevisione_1]  DEFAULT ((0)) FOR [FlUltimaRevisione]

ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FlGenerazioneLotti_1]  DEFAULT ((0)) FOR [FlGenerazioneLotti]

ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_FormatoGenerazioneLotti_1]  DEFAULT (N'') FOR [FormatoGenerazioneLotti]

ALTER TABLE [dbo].[Configurazioni] ADD  CONSTRAINT [DF_Configurazioni_LunghezzaProgrLotti_1]  DEFAULT ((0)) FOR [LunghezzaProgrLotti]

ALTER TABLE [dbo].[Macchine] ADD  CONSTRAINT [DF_Macchine_ConsumoGas_1]  DEFAULT ((0)) FOR [ConsumoGas]

ALTER TABLE [dbo].[MacchineReg] ADD  CONSTRAINT [DF_MacchineReg_OrdinamentoInvio_1]  DEFAULT ((0)) FOR [OrdinamentoInvio]

ALTER TABLE [dbo].[OrdiniDiLavoroMateriali] ADD  CONSTRAINT [DF_OrdiniDiLavoroMateriali_QuantitaTotalePrev_1]  DEFAULT ((0)) FOR [QuantitaTotalePrev]

