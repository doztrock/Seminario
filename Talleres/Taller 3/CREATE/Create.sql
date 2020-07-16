CREATE TABLE proyecto (
    identificador_proyecto       NUMBER(11) NOT NULL,
    identificador_cliente        NUMBER(11) NOT NULL,
    identificador_tipo_proyecto  NUMBER(11) NOT NULL,
    nombre                       VARCHAR2(30) UNIQUE NOT NULL
);