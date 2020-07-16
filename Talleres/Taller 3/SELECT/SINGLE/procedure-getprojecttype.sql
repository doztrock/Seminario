SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE getprojecttype (
    identificador IN VARCHAR2
) AS
    resultado tipo_proyecto%rowtype;
BEGIN
    SELECT
        identificador_tipo_proyecto,
        valor
    INTO resultado
    FROM
        tipo_proyecto
    WHERE
        identificador_tipo_proyecto = identificador;

    dbms_output.put_line('Tipo: ' || resultado.valor);
    dbms_output.new_line();
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No se ha encontrado el tipo de proyecto');
END;
