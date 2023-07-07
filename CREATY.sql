CREATE TABLE miejscowosc (
id_miejscowosc INT PRIMARY KEY IDENTITY,
ulica VARCHAR(30) NOT NULL,
miasto VARCHAR(30) NOT NULL,
miejsce VARCHAR(30),
nr_ulicy VARCHAR(30) NOT NULL
);

CREATE TABLE koncerty (
id_koncerty INT PRIMARY KEY IDENTITY,
id_miejscowosc INT NOT NULL,
rodzaj VARCHAR(30),
data_koncertu DATE NOT NULL,
dlugosc_koncertu VARCHAR(30) NOT NULL,
FOREIGN KEY (id_miejscowosc) REFERENCES miejscowosc (id_miejscowosc)
);

CREATE TABLE zespoly (
id_zespoly INT PRIMARY KEY IDENTITY,
nazwa VARCHAR(30) NOT NULL,
ilosc_osob_w_zespole INTEGER CHECK( ilosc_osob_w_zespole < 50 AND ilosc_osob_w_zespole > 0 )
);

CREATE TABLE adres (
id_adres INT PRIMARY KEY IDENTITY,
ulica VARCHAR(30) NOT NULL,
mieszkanie VARCHAR(30) NOT NULL,
nr_ulicy VARCHAR(30) NOT NULL,
panstwo VARCHAR(30) DEFAULT 'Polska' NOT NULL,
miasto VARCHAR(30) NOT NULL,
);

CREATE TABLE piosenki (
id_piosenki INT PRIMARY KEY IDENTITY,
id_zespoly INT NOT NULL,
tytul VARCHAR(30) NOT NULL,
data_wydarzenia DATE,
FOREIGN KEY (id_zespoly) REFERENCES zespoly(id_zespoly)
);

CREATE TABLE koncertowanie (
id_koncertowanie INT PRIMARY KEY IDENTITY,
id_zespoly INT NOT NULL,
id_koncerty INT NOT NULL,
czas_wystepowania VARCHAR(30) NOT NULL,
FOREIGN KEY (id_zespoly) REFERENCES zespoly (id_zespoly),
FOREIGN KEY (id_koncerty) REFERENCES koncerty (id_koncerty)
);

CREATE TABLE wokalista (
id_wokalista INT PRIMARY KEY IDENTITY,
id_zespoly INT NOT NULL,
imie VARCHAR(30) NOT NULL CHECK (LEN(imie) > 1),
nazwisko VARCHAR(30) NOT NULL CHECK (LEN(nazwisko) > 1),
nr_telefonu INTEGER UNIQUE CHECK (nr_telefonu LIKE '_________'),
pesel VARCHAR(11) UNIQUE CHECK (LEN(pesel) = 11),
FOREIGN KEY (id_zespoly) REFERENCES zespoly (id_zespoly),
);

CREATE TABLE uczestnicy (
id_uczestnicy INT PRIMARY KEY IDENTITY,
id_adres INT NOT NULL,
imie VARCHAR(30) NOT NULL CHECK (LEN(imie) > 1),
nazwisko VARCHAR(30) NOT NULL,
nr_telefonu INTEGER CHECK (nr_telefonu LIKE '_________'),
pesel VARCHAR(11) UNIQUE CHECK (LEN(pesel) = 11),
FOREIGN KEY (id_adres) REFERENCES adres (id_adres),
);

CREATE TABLE uczestnicy_wokalisci (
id_uczestnicy_wokalisci INT PRIMARY KEY IDENTITY,
id_wokalista INT NOT NULL,
id_uczestnicy INT NOT NULL,
ocena INTEGER CHECK (ocena >= 0 AND ocena <= 10),
opinia TEXT,
FOREIGN KEY (id_wokalista) REFERENCES wokalista (id_wokalista),
FOREIGN KEY (id_uczestnicy) REFERENCES uczestnicy (id_uczestnicy),
);

CREATE TABLE bilety (
id_bilety INT PRIMARY KEY IDENTITY,
id_uczestnicy INT NOT NULL,
id_koncerty INT NOT NULL,
cena FLOAT NOT NULL CHECK (cena > 0),
rodzaj VARCHAR(30) NOT NULL,
FOREIGN KEY (id_uczestnicy) REFERENCES uczestnicy (id_uczestnicy),
FOREIGN KEY (id_koncerty) REFERENCES koncerty (id_koncerty),
);