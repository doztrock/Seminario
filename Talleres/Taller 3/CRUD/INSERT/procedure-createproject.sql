SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE createproject (
    identificador_cliente        IN  NUMBER,
    identificador_tipo_proyecto  IN  NUMBER,
    nombre                       IN  VARCHAR2
) AS
    identificador NUMBER;
BEGIN
    SELECT
        nvl(MAX(identificador), 0) + 1
    INTO identificador
    FROM
        proyecto;

    INSERT INTO proyecto VALUES (
        identificador,
        identificador_cliente,
        identificador_tipo_proyecto,
        nombre
    );

EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('El proyecto ya esta registrado');
END;