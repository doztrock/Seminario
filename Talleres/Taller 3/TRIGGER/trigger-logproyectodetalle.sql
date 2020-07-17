CREATE OR REPLACE TRIGGER logproyectodetalle BEFORE
    INSERT OR DELETE OR UPDATE ON proyecto
    FOR EACH ROW
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

    INSERT INTO logproyectodetalle VALUES (
        :old.identificador_proyecto,
        :old.identificador_cliente,
        :old.identificador_tipo_proyecto,
        :old.nombre,
        :new.identificador_proyecto,
        :new.identificador_cliente,
        :new.identificador_tipo_proyecto,
        :new.nombre,
        to_char(sysdate, 'month dd, yyyy hh24 : mi : ss'),
        user,
        tipoaccion
    );

END;