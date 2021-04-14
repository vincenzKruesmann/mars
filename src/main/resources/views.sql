create or replace view essen_uebrig as
select *, (essen.gewicht
    - (select sum(gewicht) from essen_anbau where essen_fk = essen.essen_id)
    - (select sum(gewicht) from essen_forscher where essen_fk = essen.essen_id)
    ) as uebrig from essen;

create or replace view essen_art_uebrig as
select name, sum(gewicht) from essen_uebrig group by name;

create or replace view forscher_mit_alter as
select *, floor(datediff(geburtsdatum, current_date) / 365) as 'alter' from forscher;