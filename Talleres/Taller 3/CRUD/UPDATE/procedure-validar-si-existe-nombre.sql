/* VALIDAR SI EL NOMBRE DEL PROYECTO YA EXISTE */
SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE VALIDAR_SI_EXISTE_NOMBRE_DE_PROYECTO ( 
    nombre_proyecto IN VARCHAR2,
    exist_name OUT BOOLEAN
) AS 
    cnt NUMBER;
BEGIN 
    SELECT COUNT(*) INTO cnt 
        FROM proyecto p 
    WHERE p.nombre = nombre_proyecto;
    IF cnt = 1 THEN
        exist_name := true;
    ELSE 
        exist_name := false;
    END IF;
END;