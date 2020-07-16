SET SERVEROUTPUT ON;

DECLARE
    identificador_proyecto NUMBER;
BEGIN
    identificador_proyecto := &identificador;
    getproject(identificador_proyecto);
END;