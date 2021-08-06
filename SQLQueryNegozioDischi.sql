--CREATE database NegozioDischi;

--create table Band(
--Id_band int identity(1,1) not null,
--Nome nvarchar(50),
--NumeroComponenti int
--constraint Pk_band primary key(Id_band)
--);

--create table Album(
--Id_album int identity(1,1) not null,
--Titolo nvarchar(100),
--AnnoUscita int,
--CasaDiscografica nvarchar(100),
--Genere nvarchar(50),
--SuppDiDistribuzione nvarchar(50),
--Id_band int FOREIGN KEY REFERENCES Band(Id_band),
--constraint Pk_album primary key(Id_album),
--constraint CHK_genere check (Genere IN ('Classico', 'Jazz', 'Pop', 'Rock', 'Metal')),
--constraint CHK_sdistribuzione check (SuppDiDistribuzione IN ('CD', 'Vinile', 'Streaming')),
--constraint CHK_albumSDD UNIQUE(Titolo, AnnoUscita,CasaDiscografica,Genere,SuppDiDistribuzione)
--);


--create table Brano(
--Id_brano int identity(1,1) not null,
--Titolo nvarchar(50),
--Durata int,
--constraint Pk_brano primary key(Id_brano)
--);

--create table Raccolta(
--Id_album int FOREIGN KEY REFERENCES Album(Id_album),
--Id_brano int FOREIGN KEY REFERENCES Brano(Id_brano),
--);

--INSERT INTO Band VALUES ('BandPippo', 4);
--INSERT INTO Band VALUES ('BandPluto', 3);
--INSERT INTO Band VALUES ('BandPaperino', 6);
--INSERT INTO Band VALUES ('BandMinnie', 2);
--INSERT INTO Band VALUES ('BandPippi', 1);

--INSERT INTO Album VALUES ('AlbumPippo', 2000, 'CasaDiscograficaPippo', 'Rock', 'CD', 1);
--INSERT INTO Album VALUES ('AlbumPippo', 2000, 'CasaDiscograficaPippo', 'Rock', 'Vinile', 1);
--INSERT INTO Album VALUES ('AlbumPluto', 2010, 'CasaDiscograficaPippo', 'Jazz', 'Vinile', 2);
--INSERT INTO Album VALUES ('AlbumPluto', 2010, 'CasaDiscograficaPippo', 'Jazz', 'Streaming', 2);
--INSERT INTO Album VALUES ('AlbumPaperino', 1970, 'CasaDiscograficaPape', 'Metal', 'Vinile', 3);
--INSERT INTO Album VALUES ('AlbumPaperino', 1970, 'CasaDiscograficaPape', 'Metal', 'CD', 3);
--INSERT INTO Album VALUES ('AlbumMinnie', 2021, 'CasaDiscograficaMinnie', 'Classico', 'Vinile', 4);
--INSERT INTO Album VALUES ('AlbumPippi', 2020, 'CasaDiscograficaPippi', 'Pop', 'Streaming', 5);
--INSERT INTO Album VALUES ('AlbumPippoCiao', 2000, 'CasaDiscograficaPippo', 'Rock', 'Vinile', 1);
--INSERT INTO Album VALUES ('AlbumPippoA', 2000, 'CasaDiscograficaPippo', 'Rock', 'Vinile', 1);



--INSERT INTO Brano VALUES ('Titolo1Pippo', 100);
--INSERT INTO Brano VALUES ('Titolo2Pippo', 200);
--INSERT INTO Brano VALUES ('Titolo1Pluto', 110);
--INSERT INTO Brano VALUES ('Titolo2Pluto', 300);
--INSERT INTO Brano VALUES ('Titolo1Paperino', 170);
--INSERT INTO Brano VALUES ('Titolo2Paperino', 200);
--INSERT INTO Brano VALUES ('Titolo3Paperino', 250);
--INSERT INTO Brano VALUES ('Titolo1Minnie', 400);
--INSERT INTO Brano VALUES ('Titolo1Pippi', 150);
--INSERT INTO Brano VALUES ('Titolo2Pippi', 180);
--INSERT INTO Brano VALUES ('Titolo3Pippi', 175);
--INSERT INTO Brano VALUES ('Titolo4Pippi', 180);
--INSERT INTO Brano VALUES ('BranoNessunAlbum', 100);
--INSERT INTO Brano VALUES ('BranoNessunAlbum2', 150);
--INSERT INTO Brano VALUES ('BranoNessunAlbum3', 180);

--INSERT INTO Raccolta VALUES (1,1);
--INSERT INTO Raccolta VALUES (2,1);
--INSERT INTO Raccolta VALUES (1,2);
--INSERT INTO Raccolta VALUES (2,2);
--INSERT INTO Raccolta VALUES (3,3);
--INSERT INTO Raccolta VALUES (3,4);
--INSERT INTO Raccolta VALUES (4,3);
--INSERT INTO Raccolta VALUES (4,4);
--INSERT INTO Raccolta VALUES (5,5);
--INSERT INTO Raccolta VALUES (6,6);
--INSERT INTO Raccolta VALUES (6,7);
--INSERT INTO Raccolta VALUES (7,8);
--INSERT INTO Raccolta VALUES (8,9);
--INSERT INTO Raccolta VALUES (8,10);
--INSERT INTO Raccolta VALUES (8,11);


---------------------------------------------------------------------------------------------------------------


--1) Scrivere una query che restituisca i titoli degli album degli “883” in ordine alfabetico;
-- Ho messo il distinct perchè se no visualizzava stessi titoli di album con supporto di distribuzione diversa
--SELECT distinct a.Titolo
--FROM Album a JOIN Band b on a.Id_band =b.Id_band
--WHERE b.Nome ='BandPippo'
--ORDER BY a.Titolo;


SELECT distinct a.Titolo
FROM Album a JOIN Band b on a.Id_band =b.Id_band
WHERE b.Nome ='883'
ORDER BY a.Titolo;

--------------------------------------------------------------------------------------------------
--2) Selezionare tutti gli album della casa discografica “Sony Music” relativi all’anno 2020;

--SELECT *
--FROM Album
--WHERE CasaDiscografica ='CasaDiscograficaPippi' AND AnnoUscita = 2020;

SELECT *
FROM Album
WHERE CasaDiscografica ='Sony Music' AND AnnoUscita = 2020;

--------------------------------------------------------------------------------------------------
--3) Scrivere una query che restituisca tutti i titoli delle canzoni dei “Maneskin” appartenenti 
--ad album pubblicati prima del 2019;

--SELECT b.Titolo
--FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
--             JOIN Album a on a.Id_album = r.Id_album
--			 JOIN Band on Band.Id_band = a.Id_band
--WHERE Band.Nome ='BandPaperino' AND a.AnnoUscita<2019;

SELECT b.Titolo
FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
             JOIN Album a on a.Id_album = r.Id_album
			 JOIN Band on Band.Id_band = a.Id_band
WHERE Band.Nome ='Maneskin' AND a.AnnoUscita<2019;

------------------------------------------------------------------------------------------------
--4) Individuare tutti gli album in cui è contenuta la canzone “Imagine”;

--SELECT a.*
--FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
--             JOIN Album a on a.Id_album = r.Id_album
--WHERE b.Titolo = 'Titolo1Pluto';

SELECT a.*
FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
             JOIN Album a on a.Id_album = r.Id_album
WHERE b.Titolo = 'Imagine';

------------------------------------------------------------------------------------------------
--5) Restituire il numero totale di canzoni eseguite dalla band “The Giornalisti”;

--SELECT COUNT(r.Id_brano) as [Numero Canzoni]
--FROM Band b JOIN Album a ON b.Id_band =a.Id_band
--            JOIN Raccolta r on r.Id_album = a.Id_album
--WHERE b.Nome='BandPaperino';

SELECT COUNT(r.Id_brano) as [Numero Canzoni]
FROM Band b JOIN Album a ON b.Id_band =a.Id_band
            JOIN Raccolta r on r.Id_album = a.Id_album
WHERE b.Nome='The Giornalisti';

-------------------------------------------------------------------------------------------------
--6) Contare per ogni album, la “durata totale” cioè la somma dei secondi dei suoi brani
---Tenendo conto dei vari supporti di distribuzione e raggruppati anche per id_album
SELECT a.Titolo,  a.SuppDiDistribuzione, SUM(b.Durata) AS [Durata Totale]
FROM Album a JOIN Raccolta r ON a.Id_album = r.Id_album
			 JOIN Brano b ON b.Id_brano = r.Id_brano
GROUP BY a.Id_album, a.Titolo, a.SuppDiDistribuzione

--Non tenendo conto dei vari supporti (ridondanza) ma solamente raggruppati per titolo
SELECT a.Titolo, SUM(b.Durata) AS [Durata Totale]
FROM Album a JOIN Raccolta r ON a.Id_album = r.Id_album
			 JOIN Brano b ON b.Id_brano = r.Id_brano
GROUP BY a.Titolo

-------------------------------------------------------------------------------------------------
--7) Mostrare i brani (distinti) degli “883” che durano più di 3 minuti (in alternativa usare i 
--secondi quindi 180 s).

--SELECT distinct b.*
--FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
--             JOIN Album a on a.Id_album = r.Id_album
--			 JOIN Band on Band.Id_band = a.Id_band
--WHERE Band.Nome='BandPaperino' AND b.Durata>180; 

SELECT distinct b.*
FROM Brano b JOIN Raccolta r ON b.Id_brano = r.Id_brano
             JOIN Album a on a.Id_album = r.Id_album
			 JOIN Band on Band.Id_band = a.Id_band
WHERE Band.Nome='883' AND b.Durata>180; 

-------------------------------------------------------------------------------------------------
--8) Mostrare tutte le Band il cui nome inizia per “M” e finisce per “n”.

--SELECT *
--FROM Band
--WHERE Nome LIKE 'B%e';

SELECT *
FROM Band
WHERE Nome LIKE'M%n';

--------------------------------------------------------------------------------------------------
--9) Mostrare il titolo dell’Album e di fianco un’etichetta che stabilisce che si tratta di un
--Album:
--‘Very Old’ se il suo anno di uscita è precedente al 1980, 
--‘New Entry’ se l’anno di uscita è il 2021,
--‘Recente’ se il suo anno di uscita è compreso tra il 2010 e 2020, 
--‘Old’ altrimenti.

SELECT Titolo, AnnoUscita,
        CASE WHEN AnnoUscita<1980 THEN 'Very Old'
		     WHEN AnnoUscita=2021 THEN 'New Entry'
		     WHEN AnnoUscita>=2010 AND AnnoUscita<=2020 THEN 'Recente'
		     ELSE 'Old'
		     END AS Stato
FROM Album;

-- Per eliminare ridondanza
SELECT DISTINCT Titolo, AnnoUscita,
        CASE WHEN AnnoUscita<1980 THEN 'Very Old'
		     WHEN AnnoUscita=2021 THEN 'New Entry'
		     WHEN AnnoUscita>=2010 AND AnnoUscita<=2020 THEN 'Recente'
		     ELSE 'Old'
		     END AS Stato
FROM Album;

---------------------------------------------------------------------------------------------------
--10) Mostrare i brani non contenuti in nessun album.

SELECT *
FROM Brano b
WHERE NOT EXISTS ( SELECT *
				   FROM Raccolta r
				   WHERE b.Id_brano = r.Id_brano);

---------------------------------------------------------------------------------------------------
--FACOLTATIVA
--Mostrare il Nome delle band che sono un duo
SELECT Nome
FROM Band
WHERE NumeroComponenti = 2;

--Mostrare il titolo di un album che contiene più brani
SELECT Titolo
FROM Album AS a
WHERE (
(SELECT MAX([Numero brani album]) AS [Numero massimo brani]
FROM (SELECT Id_album AS ID, COUNT(Id_brano) AS [Numero brani album]
FROM Raccolta AS r
GROUP BY Id_album) AS ContaRaccolta)
=
(SELECT COUNT(Id_brano) AS [Numero brani album]
FROM Raccolta AS r
WHERE (a.Id_album = r.Id_album))
)

--Mostrare le band che hanno pubblicato brani di genere Rock prima del 2000
SELECT distinct b.*
FROM Band b JOIN Album a ON b.Id_band = a.Id_band
WHERE a.Genere ='Rock' AND AnnoUscita<=2000;