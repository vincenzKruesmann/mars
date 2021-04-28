SET GLOBAL log_bin_trust_function_creators = 1;
-- Trigger: Bei Geburtstag wird in das Logbuch "Ich habe heute Geburtstag!" eingetragen
create or replace trigger geburtstags_logbucheintrag
    BEFORE INSERT ON logbuch_eintrag for each row
    begin
        if exists (select vorname, nachname, geburtsdatum from forscher where forscher_id in
                (select forscher_fk from forscher_auf_expedition where expedition_fk = new.expedition_fk)
                and geburtsdatum = current_date) then
            set new.inhalt = 'Heute hatten wir Geburtstagskuchen :) ' + new.inhalt;
        end if;
    end;
