/* BLOQUE ANONIMO */
DECLARE 
    identificador_cliente NUMBER(11);
    identificador_tipo_proyecto NUMBER(11);
    identificador_proyecto NUMBER(11);
    nombre_proyecto VARCHAR2(30);
BEGIN
    identificador_proyecto := &identificador_proyecto;
    nombre_proyecto := '&nombre_proyecto';
    identificador_cliente := &identificador_cliente;
    identificador_tipo_proyecto := &identificador_tipo_proyecto;
   
    ACTUALIZAR_PROYECTO(identificador_proyecto, nombre_proyecto, identificador_cliente, identificador_tipo_proyecto);
END;