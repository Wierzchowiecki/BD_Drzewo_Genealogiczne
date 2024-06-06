-- Tworzenie bazy danych
CREATE DATABASE DrzewoGenealogiczne1;

-- Nadawanie uprawnień użytkownikom
GRANT ALL ON DrzewoGenealogiczne1.* TO 'trener'@'localhost';
GRANT ALL ON DrzewoGenealogiczne1.* TO 'trener'@'%';
GRANT SELECT ON DrzewoGenealogiczne1.* TO 'student'@'localhost';
GRANT SELECT ON DrzewoGenealogiczne1.* TO 'student'@'%';
GRANT INSERT ON DrzewoGenealogiczne1.* TO 'student'@'%';
GRANT SELECT ON DrzewoGenealogiczne1.* TO 'api'@'localhost';
GRANT SELECT ON DrzewoGenealogiczne1.* TO 'api'@'%';
GRANT INSERT ON DrzewoGenealogiczne1.* TO 'api'@'%';

FLUSH PRIVILEGES;

-- Używanie bazy danych
USE DrzewoGenealogiczne1;

-- Tworzenie tabeli Osoba
CREATE TABLE Osoba (
    PESEL VARCHAR(11) PRIMARY KEY UNIQUE,
    Imie VARCHAR(255) NOT NULL,
    Nazwisko VARCHAR(255) NOT NULL,
    Data_urodzenia DATE NOT NULL,
    Data_smierci DATE,
    Plec ENUM('K', 'M') NOT NULL COMMENT 'Może przyjmować wartości: K - kobieta, M - mężczyzna',
    PESEL_Ojca VARCHAR(11),
    PESEL_Matki VARCHAR(11),
    FOREIGN KEY (PESEL_Ojca) REFERENCES Osoba(PESEL),
    FOREIGN KEY (PESEL_Matki) REFERENCES Osoba(PESEL)
);

-- Wstawianie danych do tabeli "Osoba"
INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Data_smierci, Plec)
VALUES ('37010312345', 'Genowefa', 'Zielinska', '1937-01-03', '2009-09-26', 'K');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Data_smierci, Plec)
VALUES ('31051912345', 'Kazimierz', 'Zielinski', '1931-05-19', '1977-08-26', 'M');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Data_smierci, Plec)
VALUES ('33081212345', 'Cecylia', 'Pogorzała', '1933-08-12', '2003-12-01', 'K');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Data_smierci, Plec)
VALUES ('34010112345', 'Mieczyslaw', 'Pogorzała', '1934-01-01', '1988-10-18', 'M');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Plec, PESEL_Ojca, PESEL_Matki)
VALUES ('56031212345', 'Danuta', 'Zielinska', '1956-03-12', 'K', '34010112345', '33081212345');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Plec, PESEL_Ojca, PESEL_Matki)
VALUES ('56073112345', 'Ryszard', 'Zielinski', '1956-07-31', 'M', '31051912345', '37010312345');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Plec, PESEL_Ojca, PESEL_Matki)
VALUES ('84011512345', 'Aneta', 'Zielinska', '1984-01-15', 'K', '56073112345', '56031212345');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Plec, PESEL_Ojca, PESEL_Matki)
VALUES ('88101512345', 'Mariusz', 'Zielinski', '1988-10-15', 'M', '56073112345', '56031212345');

INSERT INTO Osoba (PESEL, Imie, Nazwisko, Data_urodzenia, Plec, PESEL_Ojca)
VALUES ('21021512345', 'Franciszek', 'Zielinski', '2021-02-15', 'M', '88101512345');

