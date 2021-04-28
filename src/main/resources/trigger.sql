SET GLOBAL log_bin_trust_function_creators = 1;
-- Trigger: Bei Geburtstag wird in das Logbuch "Ich habe heute Geburtstag!" eingetragen
create or replace trigger geburtstags_logbucheintrag
    BEFORE INSERT ON logbuch_eintrag for each row
    begin
        if exists (select vorname, nachname, geburtsdatum from forscher where forscher_id in
                (select forscher_fk from forscher_auf_expedition where expedition_fk = new.expedition_fk)
                and month(geburtsdatum) = month(new.zeit) and day(geburtsdatum) = day(new.zeit)) then
            set new.inhalt = concat('Heute hatten wir Geburtstagskuchen :) ', new.inhalt);
        end if;
    end;

insert into logbuch_eintrag (zeit, inhalt, expedition_fk) values ('2020-04-28T12:00:00', 'TESTTESTTEST', 1);