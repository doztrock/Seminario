SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE getclient (
    identificador IN VARCHAR2
) AS
    resultado cliente%rowtype;
BEGIN
    SELECT
        identificador_cliente,
        nombre,
        apellido,
        email
    INTO resultado
    FROM
        cliente
    WHERE
        identificador_cliente = identificador;

    dbms_output.put_line('Nombre: ' || resultado.nombre);
    dbms_output.put_line('Apellido: ' || resultado.apellido);
    dbms_output.put_line('Email: ' || resultado.email);
    dbms_output.new_line();
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No se ha encontrado el cliente');
END;
