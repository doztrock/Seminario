INSERT INTO PROYECTO (identificador_proyecto, identificador_cliente, identificador_tipo_proyecto, nombre) VALUES (10, 1, 1, 'Proyecto 10');

UPDATE PROYECTO
SET NOMBRE = 'PROYECTO 10.2'
WHERE identificador_proyecto = 10;

DELETE FROM PROYECTO WHERE identificador_proyecto = 10;
