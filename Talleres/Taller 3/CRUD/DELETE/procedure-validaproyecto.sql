CREATE OR REPLACE PROCEDURE validaproyecto (
    v_idproy  IN   NUMBER,
    res       OUT  BOOLEAN
) IS
    v_proyecto proyecto%rowtype;
BEGIN
    SELECT
        *
    INTO v_proyecto
    FROM
        proyecto
    WHERE
        identificador_proyecto = v_idproy;

    res := true;
EXCEPTION
    WHEN no_data_found THEN
        res := false;
END;