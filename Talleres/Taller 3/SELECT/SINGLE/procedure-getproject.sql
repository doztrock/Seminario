SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE getproject (
    identificador IN VARCHAR2
) AS
    resultado proyecto%rowtype;
BEGIN
    SELECT
        identificador_proyecto,
        identificador_cliente,
        identificador_tipo_proyecto,
        nombre
    INTO resultado
    FROM
        proyecto
    WHERE
        identificador_proyecto = identificador;

    dbms_output.put_line('Nombre: ' || resultado.nombre);
    dbms_output.new_line();
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No se ha encontrado el proyecto');
END;
