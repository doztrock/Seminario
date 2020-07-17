SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE verificar_identificador_cliente (
    identificador   IN    NUMBER,
    retorno         OUT   BOOLEAN
) AS
    resultado NUMBER;
BEGIN
    SELECT
        COUNT(c.identificador_cliente)
    INTO resultado
    FROM
        cliente c
    WHERE
        c.identificador_cliente = identificador;

    IF ( resultado = 1 ) THEN
        retorno := true;
    ELSE
        retorno := false;
    END IF;

END;