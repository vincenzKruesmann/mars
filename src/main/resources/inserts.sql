INSERT INTO rakete(rakete.rakete_id, rakete.name, rakete.ps, rakete.lagerplatz,
 rakete.passagiere, rakete.landezeit)
 VALUES
    ( 1, 'Challenger II', 500000000, 10, 3, '2030-06-25 08:02:37'),
    ( 2, 'Sputnik VI', 250000000, 8, 2, '2031-01-31 21:13:30'),
    ( 3, 'Falcon Renewed', 100000000, 16, 4, '2033-10-25 02:45:56')
 ;

INSERT INTO forscher(forscher.forscher_id, forscher.vorname, forscher.nachname,
                     forscher.geburtsdatum, forscher.berufung, forscher.ankunft_rakete_fk)
VALUES
(1, 'Sascha', 'Smith', '1990-04-25', 'Landwirtschaft', 1),
(2, 'Kyle', 'Müller', '1988-12-12', 'Elektromechaniker', 1),
(3, 'Elon', 'Musk', '1971-06-28', 'Memer', 1),
(4, 'Robert', 'Herrmann', '1984-10-02', 'Astrologie', 2),
(5, 'Siegfried', 'Völler', '1955-02-24', 'Reicher Rentner', 2),
(6, 'Herbert', 'Gates', '1967-05-21', 'Handwerker', 3),
(7, 'Bibi', 'Blocksberg', '1996-06-06', 'Hexe', 3),
(8, 'Benjamin', 'Blümchen', '1992-01-01', 'Vielfrass', 3),
(9, 'Darth', 'Vader', '1977-05-25', 'Bösewicht', 3)
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

INSERT INTO ernte(ernte.zeitpunkt, ernte.feld_fk, ernte.forscher_fk)
VALUES
('2030-09-13 10:00:00', 1, 3),
('2030-09-15 09:00:00', 2, 3),
('2030-10-02 15:00:00', 3, 1);

INSERT INTO essen(essen.name, essen.kalorien, essen.gewicht, essen.ernte_fk, essen.rakete_fk)
VALUES
('Kartoffeln', 10, 50, null, 1),
('Nudeln', 8, 25, null, 1),
('Karotten', 4, 10, null, 1),
('Erdbeeren', 15, 18, null, 1),
('Karotten', 4, 10, 1, null),
('Kartoffeln', 10, 15, 2, null),
('Erdbeeren', 5, 18, 3, null),
('Tomaten', 12, 10, null, 2),
('Reis', 7, 20, null, 2),
('Brot', 11, 20, null, 3)
;

INSERT INTO essen_anbau(essen_anbau.gewicht, essen_anbau.anbau_fk, essen_anbau.essen_fk)
VALUES
(5, 1, 1),
(5, 2, 3),
(10, 3, 4);
;
-- 34 auf 1, 22 auf 2, 1 auf 3, 3 auf 4, 15 auf 9, 10 auf 7, 12 auf 6, 9 auf 6
INSERT INTO essen_forscher(essen_forscher.gewicht, essen_forscher.essen_fk, essen_forscher.forscher_fk)
VALUES
(5, 1, 1),
(3, 2, 2),
(6, 1, 3),
(4, 3, 4),
(5, 4, 5),
(5, 9, 6),
(8, 7, 7),
(3, 6, 8),
(1, 8, 9)
;
-- Es fehlen Ernte, Essen, Essen_Anbau, Essen_Forscher

insert into fahrzeug (name, max_passagiere, ps) values
('Elektrischer Rasenmäher', 1, 20),
('Ingenioutier', 4, 500),
('Trabbi 2', 5, 100);


insert into expedition (startzeit, endzeit) values
('2030-09-13T11:15:00', '2030-09-13T19:49:00'),
('2030-09-14T11:00:00', '2030-09-21T18:32:00'),
('2030-09-20T07:00:00', '2030-09-20T09:11:00'),
('2030-09-24T12:30:00', '2030-12-13T12:00:00'),
('2030-10-13T11:15:00', '2030-10-14T19:49:00');

insert into logbuch_eintrag (zeit, inhalt, expedition_fk) values
('2030-09-13T18:00', 'Toller Tag, tolle Aussicht, 10/10 would recommend - aber jetzt erstmal zurück fahren und essen', 1),
('2030-09-14T12:00', 'JETZT GEHTS LOOOOOS JETZT GEHTS LOOOOOS JAAAAY', 2),
('2030-09-18T18:00', 'Heute habe ich ein Alien gesehen :O', 2),
('2030-09-21T12:00', 'Richtig mieses Wetter, schwach', 2),
('2030-09-20T07:00', 'Pizza + Ananas = <3', 3),
('2030-09-20T08:00', 'Ding Dong der letzte Logbucheintrag war wrong', 3),
('2030-09-20T19:00', 'Das war ein toller Ausflug', 3),
('2030-09-13T18:00', 'Ich schreibe doch kein Logbuch hä', 4),
('2030-09-13T18:00', 'Seh ich aus wie Göthe oder was?', 4),
('2030-10-13T12:00', 'Wir haben draußen ein Solarpanel repariert', 5);

insert into forscher_auf_expedition (expedition_fk, forscher_fk, fahrzeug_fk) values
(1, 4, 2),
(1, 1, 2),
(1, 2, 1),
(1, 3, 1),
(2, 1, 3),
(3, 3, 1),
(4, 2, 3),
(5, 4, 2);

insert into forscher_auf_expedition (expedition_fk, forscher_fk, fahrzeug_fk) values
(1, 10, 2);