/*
    Ejercicio 7.
*/

/**

    Borrar los registros de los colegios los cuales no tengan estudiantes asignados 
    "Tabla colegio del usuario usr_backup".
    
*/
DELETE 
FROM
    colegio c
WHERE
    c.cocolegio
IN
(
SELECT DISTINCT 
    c.cocolegio
FROM 
    colegio c
LEFT JOIN
    estudiante e
  ON
    c.cocolegio = e.cocolegio
WHERE
    e.cocolegio IS NULL
);    


/**

    Realizar una consulta que despliegue:
    
    -Código 
    -Nombre 
    
    De los colegios que se encuentran en la tabla colegio del usuario colegio 
    y que no se encuentren en la tabla de colegio del usuario del usuario "usr_backup".
    
*/
SELECT 
    c.cocolegio, c.nombrecolegio
FROM 
    colegio b
RIGHT JOIN
    COLEGIO.colegio c
  ON
    b.cocolegio = c.cocolegio
WHERE
    b.cocolegio IS NULL;






