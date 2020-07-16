SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE getprojects IS
    CURSOR listado IS
    SELECT
        identificador_proyecto,
        identificador_cliente,
        identificador_tipo_proyecto,
        nombre
    FROM
        proyecto;

BEGIN
    FOR resultado IN listado LOOP
        dbms_output.put_line('Nombre: ' || resultado.nombre);
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No se han encontrado proyectos');
END;