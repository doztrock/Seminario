SELECT DISTINCT
    ei.valor AS estado,
    COUNT(ei.identificador) AS cantidad
FROM
    incidente             i
    JOIN tipo_incidente        ti ON ti.identificador = i.identificador_tipo_incidente
    JOIN estado_incidente      ei ON ei.identificador = i.identificador_estado_incidente
    JOIN historico_incidente   hi ON hi.identificador_incidente = i.identificador
WHERE
    hi.fecha BETWEEN TO_DATE('01-01-20', 'DD-MM-YY') AND TO_DATE('31-12-20', 'DD-MM-YY')
    AND ti.valor IN (
        'Bug',
        'Feature'
    )
GROUP BY
    ei.valor
ORDER BY
    CASE estado
        WHEN 'Pending'   THEN
            '0'
        WHEN 'Solving'   THEN
            '1'
        WHEN 'Solved'    THEN
            '2'
    END;