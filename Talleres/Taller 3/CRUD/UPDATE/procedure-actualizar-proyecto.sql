/* BLOQUE ACTUALIZAR PROYECTO */
SET SERVEROUTPUT ON; 

CREATE OR REPLACE PROCEDURE ACTUALIZAR_PROYECTO ( 
    identificador_proyecto IN NUMBER, 
    nuevo_nombre IN VARCHAR2,
    identificador_cliente IN NUMBER,
    identificador_tipo_proyecto IN NUMBER
) AS 
    existe_name BOOLEAN;
    es_verificado_llaves_foraneas BOOLEAN;
    excepcion exception;
BEGIN 
    verificar_foraneas(identificador_cliente, identificador_tipo_proyecto, es_verificado_llaves_foraneas);
    IF (es_verificado_llaves_foraneas = TRUE) THEN 
        VALIDAR_SI_EXISTE_NOMBRE_DE_PROYECTO(nuevo_nombre, existe_name);
        IF existe_name = FALSE THEN 
            UPDATE proyecto p 
            SET 
                nombre = nuevo_nombre
            WHERE identificador_proyecto = p.identificador; 
            dbms_output.put_line('Actualizado correctamente'); 
        ELSE 
            dbms_output.put_line('El nombre del proyecto ya se encuentra registrado intente con otro'); 
        END IF;
    ELSE 
        dbms_output.put_line('Ocurrio un error, no se pudo actualizar el proyecto');
    END IF;
    EXCEPTION 
    WHEN excepcion THEN
        dbms_output.put_line('El proyecto no pudo ser actualizado'); 
END;