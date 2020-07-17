SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE verificar_identificador_tipo_proyecto (
    identificador   IN    NUMBER,
    retorno         OUT   BOOLEAN
) AS
    resultado NUMBER;
BEGIN
    SELECT
        COUNT(tp.identificador_tipo_proyecto)
    INTO resultado
    FROM
        tipo_proyecto tp
    WHERE
        tp.identificador_tipo_proyecto = identificador;

    IF ( resultado = 1 ) THEN
        retorno := true;
    ELSE
        retorno := false;
    END IF;

END;