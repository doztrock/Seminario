/* creaci�n de un archivo log para los proyectos con registro de valores antiguos y nuevos)*/
CREATE TABLE logproyectodetalle (
    oldidentificador_proyecto        NUMBER(11),
    oldidentificador_cliente         NUMBER(11),
    oldidentificador_tipo_proyecto   NUMBER(11),
    oldnombre                        VARCHAR2(30),
    newidentificador_proyecto        NUMBER(11),
    newidentificador_cliente         NUMBER(11),
    newidentificador_tipo_proyecto   NUMBER(11),
    newnombre                        VARCHAR2(30),
    fecha                            VARCHAR2(50),
    usuario                          VARCHAR2(50),
    accion                           CHAR(1)
);