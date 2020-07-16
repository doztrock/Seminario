/* BLOQUE ACTUALIZAR PROYECTO */
SET SERVEROUTPUT ON; 

CREATE OR REPLACE PROCEDURE ACTUALIZAR_PROYECTO ( 
    identificador IN NUMBER, 
    nuevo_nombre IN VARCHAR2 
) AS 
    existe_name BOOLEAN;
    excepcion exception;
BEGIN 
    VALIDAR_SI_EXISTE_NOMBRE_DE_PROYECTO(nuevo_nombre, existe_name);
    IF existe_name = FALSE THEN 
        UPDATE proyecto p 
        SET 
            nombre = nuevo_nombre
        WHERE identificador = p.identificador; 
        dbms_output.put_line('Actualizado correctamente'); 
    ELSE 
        dbms_output.put_line('El nombre del proyecto ya se encuentra registrado intente con otro'); 
    END IF;
    
    EXCEPTION 
    WHEN excepcion THEN
        dbms_output.put_line('El proyecto no pudo ser actualizado'); 
END;