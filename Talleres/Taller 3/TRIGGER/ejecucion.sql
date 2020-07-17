INSERT INTO proyecto (
    identificador_proyecto,
    identificador_cliente,
    identificador_tipo_proyecto,
    nombre
) VALUES (
    10,
    1,
    1,
    'Proyecto 10'
);

UPDATE proyecto
SET
    nombre = 'PROYECTO 10.2'
WHERE
    identificador_proyecto = 10;

DELETE FROM proyecto
WHERE
    identificador_proyecto = 10;