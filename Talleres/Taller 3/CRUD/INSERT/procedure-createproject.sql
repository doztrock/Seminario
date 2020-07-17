SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE createproject (
    identificador_cliente         IN   NUMBER,
    identificador_tipo_proyecto   IN   NUMBER,
    nombre                        IN   VARCHAR2
) AS
    identificador   NUMBER;
    resultado       BOOLEAN;
BEGIN
    verificar_foraneas(identificador_cliente, identificador_tipo_proyecto, resultado);
    IF ( resultado = true ) THEN
        SELECT
            nvl(MAX(identificador_proyecto), 0) + 1
        INTO identificador
        FROM
            proyecto;

        INSERT INTO proyecto VALUES (
            identificador,
            identificador_cliente,
            identificador_tipo_proyecto,
            nombre
        );

    ELSE
        dbms_output.put_line('Ocurrio un error');
    END IF;

EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('El proyecto ya esta registrado');
END;