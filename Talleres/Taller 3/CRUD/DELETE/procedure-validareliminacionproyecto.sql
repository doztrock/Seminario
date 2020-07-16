/* 
Procedimiento que recibe el identificador del proyecto. Primero comprueba que el proyecto exista
con el fin  de llamar al procedimiento eliminarproyecto. En caso de que no  exista el proyecto 
entonces procede a levantar una excepci�n indicando que el proyecto no est� registrado  
*/
CREATE OR REPLACE PROCEDURE validareliminacionproyecto (
    v_idproy proyecto.identificador_proyecto%TYPE
) IS
    res  BOOLEAN;
    noexiste EXCEPTION;
    men  VARCHAR2(50);
BEGIN
    validaproyecto(v_idproy, res);
    IF res = true THEN
        eliminarproyecto(v_idproy);
        men := ' Proyecto eliminado ';
        desplegarmensaje(men);
    ELSE
        RAISE noexiste;
    END IF;

EXCEPTION
    WHEN noexiste THEN
        men := ' Proyecto no est�  registrado ';
        desplegarmensaje(men);
END;