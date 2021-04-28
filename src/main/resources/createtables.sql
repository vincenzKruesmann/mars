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
                                 forscher_fk int references forscher,
                                 feld_fk int references feld
);
create or replace table ernte(
                                 ernte_id int primary key auto_increment,
                                 zeitpunkt datetime,
                                 feld_fk int references feld,
                                 forscher_fk int references forscher
);
create or replace table essen(
                                 essen_id int primary key auto_increment,
                                 name text,
                                 kalorien int,
                                 gewicht float,
                                 ernte_fk int references ernte,
                                 rakete_fk int references rakete,
                                 constraint ernte_oder_rakete check ( ernte_fk is not null or rakete_fk is not null )
);
create or replace table essen_anbau(
                                       essen_anbau_id int primary key auto_increment,
                                       gewicht float,
                                       anbau_fk int references anbau,
                                       essen_fk int references essen
);
create or replace table essen_forscher(
                                          essen_forscher_id int primary key auto_increment,
                                          gewicht float,
                                          forscher_fk int references forscher,
                                          essen_fk int references essen
);