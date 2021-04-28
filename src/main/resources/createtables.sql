create or replace table rakete(
                                  rakete_id int primary key auto_increment,
                                  name text,
                                  ps int,
                                  landezeit datetime,
                                  lagerplatz int,
                                  passagiere int,
                                  ankunftszeit datetime
);
create or replace table forscher(
                                    forscher_id int primary key auto_increment,
                                    vorname text,
                                    nachname text,
                                    geburtsdatum date,
                                    berufung text,
                                    ankunft_rakete_fk int,
                                    constraint foreign key (ankunft_rakete_fk) references rakete (rakete_id)
);
create or replace table fahrzeug(
                                    fahrzeug_id int primary key auto_increment,
                                    name text,
                                    max_passagiere int,
                                    ps int
);
create or replace table expedition(
                                      expedition_id int auto_increment primary key,
                                      startzeit datetime,
                                      endzeit datetime
);
create or replace table logbuch_eintrag(
                                           logbuch_eintrag_id int auto_increment primary key,
                                           zeit datetime,
                                           inhalt text,
                                           expedition_fk int,
                                           constraint foreign key (expedition_fk) references expedition (expedition_id)
);
create or replace table forscher_auf_expedition(
                                                   expedition_fk int,
                                                   forscher_fk int,
                                                   fahrzeug_fk int,
                                                   constraint forscher_auf_expedition_fk primary key (expedition_fk, forscher_fk),
                                                   constraint foreign key (fahrzeug_fk) references fahrzeug(fahrzeug_id)
);
create or replace table feld(
                                feld_id int primary key auto_increment,
                                laenge float,
                                breite float
);
create or replace table anbau(
                                 anbau_id int primary key auto_increment,
                                 zeitpunkt datetime,
                                 forscher_fk int,
                                 feld_fk int,
                                 constraint foreign key (forscher_fk) references forscher(forscher_id),
                                 constraint foreign key (feld_fk) references feld(feld_id)
);
create or replace table ernte(
                                 ernte_id int primary key auto_increment,
                                 zeitpunkt datetime,
                                 feld_fk int,
                                 forscher_fk int,
                                 constraint foreign key (forscher_fk) references forscher(forscher_id),
                                 constraint foreign key (feld_fk) references feld(feld_id)
);
create or replace table essen(
                                 essen_id int primary key auto_increment,
                                 name text,
                                 kalorien int,
                                 gewicht float,
                                 ernte_fk int,
                                 rakete_fk int,
                                 constraint foreign key (ernte_fk) references ernte(ernte_id),
                                 constraint foreign key (rakete_fk) references rakete(rakete_id),
                                 constraint ernte_oder_rakete check ( ernte_fk is not null or rakete_fk is not null )
);
create or replace table essen_anbau(
                                       essen_anbau_id int primary key auto_increment,
                                       gewicht float,
                                       anbau_fk int,
                                       essen_fk int,
                                       constraint foreign key (essen_fk) references essen(essen_id),
                                       constraint foreign key (anbau_fk) references anbau(anbau_id)
);
create or replace table essen_forscher(
                                          essen_forscher_id int primary key auto_increment,
                                          gewicht float,
                                          forscher_fk int,
                                          essen_fk int,
                                          constraint foreign key (essen_fk) references essen(essen_id),
                                          constraint foreign key (forscher_fk) references forscher(forscher_id)
);