/*
	Elimina el proyecto
*/
CREATE OR REPLACE PROCEDURE eliminarproyecto (
    v_idproy proyecto.identificador_proyecto%TYPE
) IS
BEGIN
    DELETE FROM proyecto
    WHERE
        identificador_proyecto = v_idproy;

END;