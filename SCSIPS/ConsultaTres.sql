SELECT
    i.identificador,
    ti.valor,
    hi.identificador_estado_incidente,
    ei.valor,
    hi.fecha
FROM
    incidente             i
    JOIN tipo_incidente        ti ON ti.identificador = i.identificador_tipo_incidente
    JOIN historico_incidente   hi ON hi.identificador_incidente = i.identificador
    JOIN estado_incidente      ei ON ei.identificador = i.identificador_estado_incidente