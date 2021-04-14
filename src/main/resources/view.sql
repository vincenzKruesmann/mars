create or replace view essen_uebrig as
select *, (essen.gewicht
    - (select sum(gewicht) from essen_anbau where essen_fk = essen.essen_id)
    - (select sum(gewicht) from essen_forscher where essen_fk = essen.essen_id)
    ) as uebrig from essen;

create or replace view essen_art_uebrig as
select name, sum(gewicht) from essen_uebrig group by name;

create or replace view forscher_mit_alter as
select *, floor(datediff(geburtsdatum, current_date) / 365) as 'alter' from forscher;

create or replace view feld_status as
    select f.*, a.anbau_id from feld f
        inner join anbau a on f.feld_id = a.feld_fk
                                  and not exists (select * from ernte where ernte.zeitpunkt > a.zeitpunkt and ernte.feld_fk = a.feld_fk);