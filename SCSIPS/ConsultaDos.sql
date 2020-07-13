SELECT
    u.nombre,
    u.apellido,
    tc.valor,
    u.documento,
    COUNT(i.identificador)
FROM
    usuario          u
    JOIN tipo_documento   tc ON tc.identificador = u.identificador_tipo_documento
    JOIN incidente        i ON i.identificador_usuario = u.identificador
GROUP BY
    u.nombre,
    u.apellido,
    tc.valor,
    u.documento