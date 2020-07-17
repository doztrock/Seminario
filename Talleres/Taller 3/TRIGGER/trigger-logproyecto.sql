CREATE OR REPLACE TRIGGER logproyecto AFTER
    INSERT OR DELETE OR UPDATE ON proyecto
DECLARE
    tipoaccion CHAR(1);
BEGIN
    IF inserting THEN
        tipoaccion := 'I';
    ELSIF updating THEN
        tipoaccion := 'U';
    ELSE
        tipoaccion := 'D';
    END IF;

    INSERT INTO logproyecto VALUES (
        to_char(sysdate, 'month dd, yyyy hh24 : mi : ss'),
        tipoaccion,
        user
    );

END;