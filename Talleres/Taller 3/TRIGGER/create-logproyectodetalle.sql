/* creación de un archivo log para los proyectos con registro de valores antiguos y nuevos)*/

create table logproyectodetalle(
oldidentificador_proyecto  number(11),        
oldidentificador_cliente number(11),       
oldidentificador_tipo_proyecto   number(11),
oldnombre VARCHAR2(30),
newidentificador_proyecto  number(11),        
newidentificador_cliente number(11),       
newidentificador_tipo_proyecto   number(11),
newnombre   VARCHAR2(30),
fecha varchar2(50),
usuario varchar2(50),
accion char(1)
);