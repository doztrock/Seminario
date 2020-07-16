SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE createclient (
    nombre    IN   VARCHAR2,
    apellido  IN   VARCHAR2,
    email     IN   VARCHAR2,
    retorno   OUT  NUMBER
) AS
    identificador NUMBER;
BEGIN
    SELECT
        nvl(MAX(identificador), 0) + 1
    INTO identificador
    FROM
        cliente;

    INSERT INTO cliente VALUES (
        identificador,
        nombre,
        apellido,
        email
    );

    retorno := identificador;
EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('Procedimiento createclient: email ya registrado');
END;

CREATE OR REPLACE PROCEDURE createprojecttype (
    valor    IN   VARCHAR2,
    retorno  OUT  NUMBER
) AS
    identificador NUMBER;
BEGIN
    SELECT
        nvl(MAX(identificador), 0) + 1
    INTO identificador
    FROM
        tipo_proyecto;

    INSERT INTO tipo_proyecto VALUES (
        identificador,
        valor
    );

    retorno := identificador;
EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('Procedimiento createprojecttype: tipo de proyecto ya registrado');
END;

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
        dbms_output.put_line('Procedimiento createproject: proyecto ya registrado');
END;

DECLARE
    identificador_cliente        NUMBER;
    identificador_tipo_proyecto  NUMBER;
BEGIN
    createclient('Carla', 'Diaz', 'carla.diaz@sgmail.com', identificador_cliente);
    createprojecttype('NodeJS', identificador_tipo_proyecto);
    createproject(identificador_cliente, identificador_tipo_proyecto, 'Proyecto 1');
    dbms_output.put_line('Proyecto creado exitosamente');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Ocurrio un error al procesar la informacion');
END;