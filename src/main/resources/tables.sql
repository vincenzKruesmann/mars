create table anbau
(
    anbau_id    int auto_increment
        primary key,
    zeitpunkt   datetime null,
    forscher_fk int      null,
    feld_fk     int      null
);

create table ernte
(
    ernte_id    int auto_increment
        primary key,
    zeitpunkt   datetime null,
    feld_fk     int      null,
    forscher_fk int      null
);

create table essen
(
    essen_id  int auto_increment
        primary key,
    name      text  null,
    kalorien  int   null,
    gewicht   float null,
    ernte_fk  int   null,
    rakete_fk int   null,
    constraint ernte_oder_rakete
        check (`ernte_fk` is not null or `rakete_fk` is not null)
);

create table essen_anbau
(
    essen_anbau_id int auto_increment
        primary key,
    gewicht        float null,
    anbau_fk       int   null,
    essen_fk       int   null
);

create table essen_forscher
(
    essen_forscher_id int auto_increment
        primary key,
    gewicht           float null,
    forscher_fk       int   null,
    essen_fk          int   null
);

create table expedition
(
    expedition_id int auto_increment
        primary key,
    startzeit     datetime null,
    endzeit       datetime null
);

create table fahrzeug
(
    fahrzeug_id    int auto_increment
        primary key,
    name           text null,
    max_passagiere int  null,
    ps             int  null
);

create table feld
(
    feld_id int auto_increment
        primary key,
    laenge  float null,
    breite  float null
);

create table forscher
(
    forscher_id       int auto_increment
        primary key,
    vorname           text null,
    nachname          text null,
    geburtsdatum      date null,
    berufung          text null,
    ankunft_rakete_fk int  null,
    abflug_rakete_fk  int  null
);

create index ankunft_rakete_fk
    on forscher (ankunft_rakete_fk);

create table forscher_auf_expedition
(
    expedition_fk int not null,
    forscher_fk   int not null,
    primary key (expedition_fk, forscher_fk)
);

create table logbuch_eintrag
(
    logbuch_eintrag_id int auto_increment
        primary key,
    zeit               datetime null,
    inhalt             text     null,
    expedition_fk      int      null
);

create table rakete
(
    rakete_id  int auto_increment
        primary key,
    name       text     null,
    ps         int      null,
    landezeit  datetime null,
    lagerplatz int      null,
    passagiere int      null,
    abflugzeit datetime null
);

