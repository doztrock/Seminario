
CREATE TABLE cliente (
    identificador_cliente  NUMBER(11) NOT NULL,
    nombre                 VARCHAR2(30) NOT NULL,
    apellido               VARCHAR2(30) NOT NULL,
    email                  VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE tipo_proyecto (
    identificador_tipo_proyecto  NUMBER(11) NOT NULL,
    valor                        VARCHAR2(30) UNIQUE NOT NULL
);

CREATE TABLE proyecto (
    identificador_proyecto       NUMBER(11) NOT NULL,
    identificador_cliente        NUMBER(11) NOT NULL,
    identificador_tipo_proyecto  NUMBER(11) NOT NULL,
    nombre                       VARCHAR2(30) UNIQUE NOT NULL
);