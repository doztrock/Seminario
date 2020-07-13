SELECT
    p.nombre   AS proyecto,
    tp.valor   AS tipo,
    COUNT(i.identificador) AS cantidad_incidentes
FROM
    proyecto        p
    JOIN cliente         c ON c.identificador = p.identificador_cliente
    JOIN tipo_proyecto   tp ON tp.identificador = p.identificador_tipo_proyecto
    JOIN incidente       i ON i.identificador_proyecto = p.identificador
WHERE
    c.identificador = 2
GROUP BY
    p.nombre,
    tp.valor;