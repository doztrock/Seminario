CREATE OR REPLACE PROCEDURE desplegarmensaje (
    men VARCHAR2
) IS
BEGIN
    dbms_output.put_line(men);
END;