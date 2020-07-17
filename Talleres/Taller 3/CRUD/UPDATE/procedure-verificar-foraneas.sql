SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE verificar_foraneas (
    identificador_cliente         IN    NUMBER,
    identificador_tipo_proyecto   IN    NUMBER,
    retorno                       OUT   BOOLEAN
) AS
    resultado_cliente         BOOLEAN;
    resultado_tipo_proyecto   BOOLEAN;
BEGIN
    verificar_identificador_cliente(identificador_cliente, resultado_cliente);
    verificar_identificador_tipo_proyecto(identificador_tipo_proyecto, resultado_tipo_proyecto);
    IF ( resultado_cliente = true AND resultado_tipo_proyecto = true ) THEN
        retorno := true;
    ELSE
        IF ( resultado_cliente = false ) THEN
            dbms_output.put_line('No existe el cliente');
        END IF;
        IF ( resultado_tipo_proyecto = false ) THEN
            dbms_output.put_line('No existe el tipo de proyecto');
        END IF;
        retorno := false;
    END IF;

END;