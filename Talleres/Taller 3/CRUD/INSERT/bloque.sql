SET SERVEROUTPUT ON;

DECLARE
    identificador_cliente         NUMBER(11);
    identificador_tipo_proyecto   NUMBER(11);
    nombre                        VARCHAR2(30);
BEGIN
    identificador_cliente := &identificador_cliente;
    identificador_tipo_proyecto := &identificador_tipo_proyecto;
    nombre := '&nombre_proyecto';
    createproject(identificador_cliente, identificador_tipo_proyecto, nombre);
END;