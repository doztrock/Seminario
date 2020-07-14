SELECT
    u.nombre,
    u.apellido,
    td.valor,
    u.documento,
    COUNT(i.identificador) AS cantidad
FROM
    usuario            u
    JOIN tipo_documento     td ON td.identificador = u.identificador_tipo_documento
    JOIN incidente          i ON i.identificador_usuario = u.identificador
    JOIN estado_incidente   ei ON ei.identificador = i.identificador_estado_incidente
WHERE
    ei.valor IN (
        'Pending',
        'Solving'
    )
GROUP BY
    u.nombre,
    u.apellido,
    td.valor,
    u.documento
HAVING
    COUNT(i.identificador) > 0
ORDER BY
    cantidad DESC;