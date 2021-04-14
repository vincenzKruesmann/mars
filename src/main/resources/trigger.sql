-- Trigger: Bei Geburtstag wird in das Logbuch "Ich habe heute Geburtstag!" eingetragen
create or replace trigger geburtstags_logbucheintrag
    BEFORE INSERT ON logbuch_eintrag for each row
    begin
        for geburtstagskind in (select vorname, nachname, geburtsdatum from forscher where forscher_id in
                (select forscher_fk from forscher_auf_expedition where expedition_fk = new.expedition_fk)
                and geburtsdatum = current_date) loop
            new.inhalt = 'Heute hatten wir Kuchen, weil ' + geburtstagskind.vorname + ' ' + geburtstagskind.nachname + 'Geburtstag hatte. ' + new.inhalt;
        end loop;
        return new;
    end;
