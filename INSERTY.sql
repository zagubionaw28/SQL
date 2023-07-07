SET DATEFORMAT DMY;

INSERT INTO miejscowosc(ulica, miasto, miejsce, nr_ulicy)
VALUES ('Ffordd Pen Llech', 'Harlech', 'park', '56');
INSERT INTO miejscowosc(ulica, miasto, miejsce, nr_ulicy)
VALUES ('Oxford Street', 'Oxford', 'sala koncertowa', '71');
INSERT INTO miejscowosc( ulica, miasto, miejsce, nr_ulicy)
VALUES ('Wiejska', 'Gdynia', 'muszla koncertowa', '28');
INSERT INTO miejscowosc( ulica, miasto, miejsce, nr_ulicy)
VALUES ('Lwowska', 'Warszawa', 'sala koncertowa', '13');
INSERT INTO miejscowosc(ulica, miasto, miejsce, nr_ulicy)
VALUES ('Potworowska', 'Radom', 'park', '2');

INSERT INTO koncerty(id_miejscowosc, rodzaj, data_koncertu,
dlugosc_koncertu)
VALUES (1, 'muzyka klasyczna', '13.06.2023', '5H');
INSERT INTO koncerty(id_miejscowosc, rodzaj, data_koncertu,
dlugosc_koncertu)
VALUES (2, 'muzyka filmowa', '30.08.2023', '10H');
INSERT INTO koncerty(id_miejscowosc, rodzaj, data_koncertu,
dlugosc_koncertu)
VALUES (3, 'muzyka folkowa', '28.01.2023', '6H');
INSERT INTO koncerty(id_miejscowosc, rodzaj, data_koncertu,
dlugosc_koncertu)
VALUES (4, 'pop', '04.07.2023', '4H');
INSERT INTO koncerty(id_miejscowosc, rodzaj, data_koncertu,
dlugosc_koncertu)
VALUES (5, 'muzyka rockowa', '14.04.2023', '2H');

INSERT INTO zespoly(nazwa, ilosc_osob_w_zespole)
VALUES ('Celtic Woman', '8');
INSERT INTO zespoly(nazwa, ilosc_osob_w_zespole)
VALUES ('Two steps from hell', '30');
INSERT INTO zespoly(nazwa, ilosc_osob_w_zespole)
VALUES ('Celtic metal', '2');
INSERT INTO zespoly(nazwa, ilosc_osob_w_zespole)
VALUES ('Kwiat Jabloni', '5');
INSERT INTO zespoly(nazwa, ilosc_osob_w_zespole)
VALUES ('Wake me', '6');

INSERT INTO adres(ulica, mieszkanie, nr_ulicy, panstwo, miasto)
VALUES ('Avenida Corrientes', '4', '1', 'Argentyna', 'Bueons Aires');
INSERT INTO adres(ulica, mieszkanie, nr_ulicy, panstwo, miasto)
VALUES ('Avenida Paulista', '199', '5', 'Brazylia', 'Sao Paulo');
INSERT INTO adres(ulica, mieszkanie, nr_ulicy, panstwo, miasto)
VALUES ('Blotna', '18', '12', 'Polska', 'Gdynia');
INSERT INTO adres(ulica, mieszkanie, nr_ulicy, panstwo, miasto)
VALUES ('Szarych Szeregow', '38', '19', 'Polska', 'Inowroclaw');
INSERT INTO adres(ulica, mieszkanie, nr_ulicy, panstwo, miasto)
VALUES ('Smocza', '50', '6', 'Bialorus', 'Grodno');

INSERT INTO piosenki(id_zespoly, tytul, data_wydarzenia)
VALUES (1, 'The Voice', '31.10.2020');
INSERT INTO piosenki(id_zespoly, tytul, data_wydarzenia)
VALUES (2, 'To Glory', '06.03.2000');
INSERT INTO piosenki(id_zespoly, tytul, data_wydarzenia)
VALUES (3, 'Lords of Iron', '01.01.2018');
INSERT INTO piosenki(id_zespoly, tytul, data_wydarzenia)
VALUES (4, 'Kto powie mi jak', '15.06.2021');
INSERT INTO piosenki(id_zespoly, tytul, data_wydarzenia)
VALUES (5, 'Kiss from a rose', '31.10.1999');

INSERT INTO koncertowanie(id_zespoly, id_koncerty, czas_wystepowania)
VALUES (1, 1, '3 min');
INSERT INTO koncertowanie(id_zespoly, id_koncerty, czas_wystepowania)
VALUES (2, 2, '15 min');
INSERT INTO koncertowanie(id_zespoly, id_koncerty, czas_wystepowania)
VALUES (3, 3, '20 min');
INSERT INTO koncertowanie(id_zespoly, id_koncerty, czas_wystepowania)
VALUES (4, 4, '2,5 min');
INSERT INTO koncertowanie(id_zespoly, id_koncerty, czas_wystepowania)
VALUES (5, 5, '6 min');

INSERT INTO wokalista(id_zespoly, imie, nazwisko, nr_telefonu, pesel)
VALUES (1, 'Filip', 'Mackowiak', '628659000', '74927610374');
INSERT INTO wokalista(id_zespoly, imie, nazwisko, nr_telefonu, pesel)
VALUES (2, 'Artur', 'Jakubowski', '749274916', '72916389271');
INSERT INTO wokalista(id_zespoly, imie, nazwisko, nr_telefonu, pesel)
VALUES (3, 'Pawel', 'Maiseichyk', '849261846', '83629163826');
INSERT INTO wokalista(id_zespoly, imie, nazwisko, nr_telefonu, pesel)
VALUES (4, 'Maciek', 'Mrozek', '739264815', '17439283029');
INSERT INTO wokalista(id_zespoly, imie, nazwisko, nr_telefonu, pesel)
VALUES (5, 'Weronika', 'Niezorawska', '519725065', '86749302749');

INSERT INTO uczestnicy(id_adres, imie, nazwisko, nr_telefonu, pesel)
VALUES (1, 'Emilka', 'Wyka', NULL, '86902716840');
INSERT INTO uczestnicy(id_adres, imie, nazwisko, nr_telefonu, pesel)
VALUES (2, 'Alicja', 'Cison', '768493027', '28165739072');
INSERT INTO uczestnicy(id_adres, imie, nazwisko, nr_telefonu, pesel)
VALUES (3, 'Martynka', 'Niezorawska', '976483920', '17584935271');
INSERT INTO uczestnicy(id_adres, imie, nazwisko, nr_telefonu, pesel)
VALUES (4, 'Wiktoria', 'Smiech', '867482019', '02756198194');
INSERT INTO uczestnicy(id_adres, imie, nazwisko, nr_telefonu, pesel)
VALUES (5, 'Weronika', 'Jaszczewska', '756483291', '03526785193');

INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (1, 1, '10', 'Wspanialy');
INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (2, 2, '9', 'Cudowny');
INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (3, 3, NULL, 'Wysmienity');
INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (4, 4, '7', 'Najlepszy');
INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (5, 5, '6', NULL);
INSERT INTO uczestnicy_wokalisci(id_wokalista, 
id_uczestnicy, ocena, opinia)
VALUES (1, 3, '8', 'The best');

INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (1, 1, 50, 'miejsca z tylu');
INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (2, 2, 300, 'miejsca z przodu');
INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (3, 3, 1000, 'VIP');
INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (4, 4, 1000, 'VIP');
INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (5, 5, 50, 'miejsca z tylu');
INSERT INTO bilety(id_uczestnicy, id_koncerty, cena, rodzaj)
VALUES (1, 3, 200, 'VIP');