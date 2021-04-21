INSERT INTO rakete(rakete.rakete_id, rakete.name, rakete.ps, rakete.lagerplatz,
 rakete.passagiere, rakete.abflugzeit, rakete.landezeit) 
 VALUES
    ( 1, 'Challenger II', 500000000, 10, 3, '2030-09-12 16:23:48', '2030-06-25 08:02:37'),
    ( 2, 'Sputnik VI', 250000000, 8, 2, '2031-04-02 14:30:02', '2031-01-31 21:13:30'),
    ( 3, 'Falcon Renewed', 100000000, 16, 4, '2033-12-11 07:00:45', '2033-10-25 02:45:56')
 ;
 
 INSERT INTO forscher(forscher.forscher_id, forscher.vorname, forscher.nachname,
forscher.geburtsdatum, forscher.berufung, forscher.ankunft_rakete_fk, forscher.abflug_rakete_fk) 
VALUES
(1, 'Sascha', 'Smith', '1990-04-25', 'Landwirtschaft', 1, 3), 
(2, 'Kyle', 'Müller', '1988-12-12', 'Elektromechaniker', 1, 2), 
(3, 'Elon', 'Musk', '1971-06-28', 'Memer', 1, 2),
(4, 'Robert', 'Herrmann', '1984-10-02', 'Astrologie', 2, 3),
(5, 'Siegfried', 'Völler', '1955-02-24', 'Reicher Rentner', 2, 3),
(6, 'Herbert', 'Gates', '1967-05-21', 'Handwerker', 3, NULL),
(7, 'Bibi', 'Blocksberg', '1996-06-06', 'Hexe', 3, NULL),
(8, 'Benjamin', 'Blümchen', '1992-01-01', 'Vielfrass', 3, 3),
(9, 'Darth', 'Vader', '1977-05-25', 'Bösewicht', 3, NULL)
;

INSERT INTO feld(feld.feld_id, feld.breite, feld.laenge) VALUES
(1, 100, 300),
(2, 50, 150),
(3, 100, 350)
;

INSERT INTO anbau(anbau.anbau_id, anbau.zeitpunkt, anbau.forscher_fk, anbau.feld_fk)
VALUES
(1, '2030-06-27 08:00:00', 1, 1),
(2, '2030-06-27 16:00:00', 2, 2),
(3, '2030-06-27 17:00:00', 3, 3)
;

//Es fehlen Ernte, Essen, Essen_Anbau, Essen_Forscher
//Forscher-Table angepassen -> Kein Abflug
//Rakete-Table anpassen -> Kein Abflug