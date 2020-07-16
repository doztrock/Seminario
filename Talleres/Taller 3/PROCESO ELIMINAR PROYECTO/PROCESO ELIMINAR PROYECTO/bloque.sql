/* bloque que recibe el identificador del proyecto y  luego llama al procedimiento almacenado
  validareliminacionproyecto  */
SET SERVEROUTPUT ON;

SET VERIFY OFF;

DECLARE
    v_idproy proyecto.identificador_proyecto%TYPE;
BEGIN
    v_idproy := &c�digo_proyecto;
    validareliminacionproyecto(v_idproy);
END;