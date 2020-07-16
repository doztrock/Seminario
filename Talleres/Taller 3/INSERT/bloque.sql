SET SERVEROUTPUT ON;

DECLARE
    identificador_cliente        NUMBER;
    identificador_tipo_proyecto  NUMBER;
    nombre                       VARCHAR2;
BEGIN
    identificador_cliente := &identificador_cliente;
    identificador_tipo_proyecto := &identificador_tipo_proyecto;
    nombre := &nombre_proyecto;

    createproject(identificador_cliente, identificador_tipo_proyecto, nombre);

END;