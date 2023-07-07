-- Wyswietl imie nazwisko i ilosc ocen pozytywnych ( powyzej 8 ) dla kazdego wokalisty
SELECT imie, nazwisko, COUNT(ocena) AS "ilosc pozytywnych ocen" FROM uczestnicy_wokalisci
LEFT JOIN wokalista ON uczestnicy_wokalisci.id_wokalista = wokalista.id_wokalista
WHERE ocena > 8
GROUP BY imie, nazwisko;

-- Wyswietl tytuly piosenek wraz z zespolem. Wynik posortuj malejaco po nazwie zespolu.
SELECT piosenki.tytul, zespoly.nazwa AS "nazwa zespolu" FROM zespoly
INNER JOIN piosenki ON zespoly.id_zespoly = piosenki.id_zespoly
ORDER BY zespoly.nazwa DESC;

-- Wyswietl zespoly, ktorych ilosc osob w zespole jest wieksza od sredniej ilosci osob w zespolach znajdujacych sie w bazie.
SELECT * FROM zespoly
WHERE ilosc_osob_w_zespole > (SELECT AVG(ilosc_osob_w_zespole) FROM zespoly)

-- Wyswietl rodzaje i ceny biletow wraz z ich rodzajem koncertu, ktorych cena jest wieksza od sredniej ceny wszystkich biletow do wykupienia.
SELECT bilety.rodzaj AS "rodzaj biletu", bilety.cena, koncerty.rodzaj AS "rodzaj koncertu" FROM bilety
INNER JOIN koncerty ON koncerty.id_koncerty = bilety.id_koncerty
WHERE cena > (SELECT AVG(cena) FROM bilety);

-- Wyswietl rodzaj z data wystepowania koncertu wraz podaniem miejscowosci w jakiej bedzie sie znajdowac dany koncert. Wynik posortuj rosnaco po dacie koncertow.
SELECT koncerty.rodzaj, koncerty.data_koncertu, miejscowosc.miasto FROM miejscowosc
INNER JOIN koncerty ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
ORDER BY koncerty.data_koncertu ASC;

-- Wyswietl ilosc rodzai sprzedanych biletow dla konkretnego miasta.
SELECT bilety.rodzaj, miejscowosc.miasto, COUNT(bilety.rodzaj) AS "ilosc biletow" FROM bilety
INNER JOIN koncerty ON bilety.id_koncerty = koncerty.id_koncerty
INNER JOIN miejscowosc ON miejscowosc.id_miejscowosc = koncerty.id_miejscowosc
GROUP BY bilety.rodzaj, miejscowosc.miasto;

