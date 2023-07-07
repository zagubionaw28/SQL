-- VIEW X2

-- Wyswietla ilosc rodzai sprzedanych biletow dla konkretnego miasta.
GO
CREATE VIEW sprzedane_bilety AS 
SELECT bilety.rodzaj, miejscowosc.miasto, COUNT(bilety.rodzaj) AS "ilosc biletow" FROM bilety
INNER JOIN koncerty ON bilety.id_koncerty = koncerty.id_koncerty
INNER JOIN miejscowosc ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
GROUP BY bilety.rodzaj, miejscowosc.miasto;
GO
SELECT * FROM sprzedane_bilety WHERE rodzaj='VIP';
-- Wy�wietla imie nazwisko i ilosc ocen pozytywnych ( powyzej 8 ) dla kazdego wokalisty
GO 
CREATE VIEW positive_marks AS
SELECT wokalista.imie, wokalista.nazwisko, COUNT(ocena) AS "ilosc pozytywnych ocen" FROM uczestnicy_wokalisci
LEFT JOIN wokalista ON uczestnicy_wokalisci.id_wokalista = wokalista.id_wokalista
INNER JOIN uczestnicy ON uczestnicy_wokalisci.id_uczestnicy = uczestnicy.id_uczestnicy
WHERE ocena > 8
GROUP BY wokalista.imie, wokalista.nazwisko;
GO
SELECT * FROM positive_marks;


-- FUNCTION X2

-- Ta funkcja ma wyswietlac rodzaje koncertu, miejscowosci i daty wystepowania koncertu, 
-- ktore wystepuje po danej dacie. Wynik jest posortowany malejaco.

GO
CREATE FUNCTION find_concerts(@data_koncertu DATE, @rodzaj VARCHAR(30))
RETURNS TABLE AS
RETURN (
SELECT koncerty.rodzaj, koncerty.data_koncertu, miejscowosc.miasto FROM miejscowosc
INNER JOIN koncerty ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
WHERE ( data_koncertu > @data_koncertu ) AND ( rodzaj = @rodzaj )
);
GO
SELECT * FROM dbo.find_concerts('2022-07-02', 'pop')

-- Wyswietla rodzaje i ceny biletow wraz z ich rodzajem koncertu, 
-- ktorych cena jest wieksza od sredniej ceny wszystkich biletow do wykupienia.

GO 
CREATE FUNCTION find_tickets(@rodzaj_biletu VARCHAR(30))
RETURNS TABLE AS
RETURN (
SELECT bilety.rodzaj AS "rodzaj biletu", bilety.cena, koncerty.rodzaj AS "rodzaj koncertu" FROM bilety
INNER JOIN koncerty ON koncerty.id_koncerty = bilety.id_koncerty
WHERE cena > (SELECT AVG(cena) FROM bilety) AND bilety.rodzaj = @rodzaj_biletu
);
GO
SELECT * FROM dbo.find_tickets('VIP')

-- PROCEDURE X2

-- Procedura z tytulami piosenek wraz z zespolami oraz z miejscem ich wystepowania 
-- (podac miasto i miejsce). Wynik jest posortowany malejaco po nazwie zespolu.

GO
CREATE PROCEDURE display_songs @miejsce VARCHAR(30)
AS
SELECT piosenki.tytul, miejscowosc.miasto, miejscowosc.miejsce, zespoly.nazwa AS 'nazwa zespolu' FROM zespoly
INNER JOIN piosenki ON zespoly.id_zespoly = piosenki.id_zespoly
INNER JOIN koncertowanie ON zespoly.id_zespoly = koncertowanie.id_zespoly
INNER JOIN koncerty ON koncerty.id_koncerty = koncertowanie.id_koncerty
INNER JOIN miejscowosc ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
WHERE miejsce = @miejsce
ORDER BY zespoly.nazwa DESC;
GO
EXEC display_songs @miejsce = 'park'; 

-- Procedura, ktora updatuje ceny biletow konkretnego rodzaju w danym miescie.

GO
CREATE PROCEDURE ticket_price @cena FLOAT, @miasto VARCHAR(30), @rodzaj VARCHAR(30)
AS
UPDATE bilety SET cena = @cena WHERE id_bilety IN (
SELECT id_bilety FROM bilety
INNER JOIN koncerty ON bilety.id_koncerty = koncerty.id_koncerty
INNER JOIN miejscowosc ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
WHERE miasto = @miasto AND bilety.rodzaj = @rodzaj)
GO
EXEC ticket_price @cena = 1500, @miasto = 'Warszawa', @rodzaj = 'VIP';


-- TRIGGER X2

-- TRIGGER, dzieki ktoremu nie mozna obnizac ceny danego biletu, jedynie je podwyzszac.
GO
CREATE TRIGGER no_reducing
ON bilety
AFTER UPDATE
AS
BEGIN
	IF UPDATE(cena)
	BEGIN
		DECLARE kursor_update CURSOR
		FOR SELECT id_bilety, cena FROM deleted;
		OPEN kursor_update
		DECLARE @id_bilety INT, @cena FLOAT
		FETCH NEXT FROM kursor_update INTO @id_bilety, @cena
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (@cena > (SELECT cena FROM bilety WHERE id_bilety = @id_bilety))
			BEGIN
               PRINT 'Nie mozesz obnizac ceny!'
               ROLLBACK
           END
           FETCH NEXT FROM kursor_update INTO @id_bilety, @cena
       END
       CLOSE kursor_update
       DEALLOCATE kursor_update
   END
END

UPDATE bilety SET cena = 800 WHERE id_bilety = 3;

-- TRIGGER, dzieki ktoremu nie mozna obnizac oceny danego wokalisty, jedynie je podwyzszac.
GO 
CREATE TRIGGER increase_marks
ON uczestnicy_wokalisci
AFTER UPDATE
AS
BEGIN
	IF UPDATE(ocena)
	BEGIN
		DECLARE kursor_update CURSOR
		FOR SELECT id_uczestnicy_wokalisci, ocena FROM deleted;
		OPEN kursor_update
		DECLARE @id_uczestnicy_wokalisci INT, @ocena FLOAT
		FETCH NEXT FROM kursor_update INTO @id_uczestnicy_wokalisci, @ocena
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF (@ocena > (SELECT ocena FROM uczestnicy_wokalisci WHERE id_uczestnicy_wokalisci = @id_uczestnicy_wokalisci))
			BEGIN
               PRINT 'Nie mozesz obnizac oceny!'
               ROLLBACK
           END
           FETCH NEXT FROM kursor_update INTO @id_uczestnicy_wokalisci, @ocena
       END
       CLOSE kursor_update
       DEALLOCATE kursor_update
   END
END

UPDATE uczestnicy_wokalisci SET ocena = 7 WHERE id_uczestnicy_wokalisci = 3;