CREATE TABLE tipo_documento (
    identificador_tipo_documento   NUMBER(11) NOT NULL,
    valor                          VARCHAR2(30) UNIQUE NOT NULL,
    CONSTRAINT tipo_documento_pk PRIMARY KEY ( identificador_tipo_documento )
);

CREATE SEQUENCE tipo_documento_identificador_tipo_documento_seq;

CREATE TRIGGER bi_tipo_documento_identificador_tipo_documento BEFORE
    INSERT ON tipo_documento
    FOR EACH ROW
BEGIN
    SELECT
        tipo_documento_identificador_tipo_documento_seq.NEXTVAL
    INTO :new.identificador_tipo_documento
    FROM
        dual;

END;
/

CREATE TABLE usuario (
    identificador_usuario          NUMBER(11) NOT NULL,
    identificador_tipo_documento   NUMBER(11) NOT NULL,
    documento                      VARCHAR2(255) NOT NULL,
    nombre                         VARCHAR2(50) NOT NULL,
    apellido                       VARCHAR2(50) NOT NULL,
    email                          VARCHAR2(50) UNIQUE NOT NULL,
    CONSTRAINT usuario_pk PRIMARY KEY ( identificador_usuario )
);

CREATE SEQUENCE usuario_identificador_usuario_seq;

CREATE TRIGGER bi_usuario_identificador_usuario BEFORE
    INSERT ON usuario
    FOR EACH ROW
BEGIN
    SELECT
        usuario_identificador_usuario_seq.NEXTVAL
    INTO :new.identificador_usuario
    FROM
        dual;

END;
/

CREATE TABLE cliente (
    identificador_cliente          NUMBER(11) NOT NULL,
    identificador_tipo_documento   NUMBER(11) NOT NULL,
    documento                      VARCHAR2(30) UNIQUE NOT NULL,
    nombre                         VARCHAR2(50) NOT NULL,
    apellido                       VARCHAR2(50) NOT NULL,
    email                          VARCHAR2(50) UNIQUE NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY ( identificador_cliente )
);

CREATE SEQUENCE cliente_identificador_cliente_seq;

CREATE TRIGGER bi_cliente_identificador_cliente BEFORE
    INSERT ON cliente
    FOR EACH ROW
BEGIN
    SELECT
        cliente_identificador_cliente_seq.NEXTVAL
    INTO :new.identificador_cliente
    FROM
        dual;

END;
/

CREATE TABLE proyecto (
    identificador_proyecto        NUMBER(11) NOT NULL,
    identificador_tipo_proyecto   NUMBER(11) NOT NULL,
    identificador_cliente         NUMBER(11) NOT NULL,
    nombre                        VARCHAR2(50) NOT NULL,
    prefijo                       VARCHAR2(10) UNIQUE NOT NULL,
    CONSTRAINT proyecto_pk PRIMARY KEY ( identificador_proyecto )
);

CREATE SEQUENCE proyecto_identificador_proyecto_seq;

CREATE TRIGGER bi_proyecto_identificador_proyecto BEFORE
    INSERT ON proyecto
    FOR EACH ROW
BEGIN
    SELECT
        proyecto_identificador_proyecto_seq.NEXTVAL
    INTO :new.identificador_proyecto
    FROM
        dual;

END;
/

CREATE TABLE rol (
    identificador_rol   NUMBER(11) NOT NULL,
    valor               VARCHAR2(30) UNIQUE NOT NULL,
    CONSTRAINT rol_pk PRIMARY KEY ( identificador_rol )
);

CREATE SEQUENCE rol_identificador_rol_seq;

CREATE TRIGGER bi_rol_identificador_rol BEFORE
    INSERT ON rol
    FOR EACH ROW
BEGIN
    SELECT
        rol_identificador_rol_seq.NEXTVAL
    INTO :new.identificador_rol
    FROM
        dual;

END;
/

CREATE TABLE usuario_proyecto (
    identificador_usuario_proyecto   NUMBER(11) NOT NULL,
    identificador_usuario            NUMBER(11) NOT NULL,
    identificador_proyecto           NUMBER(11) NOT NULL,
    identificador_rol                NUMBER(11) NOT NULL,
    CONSTRAINT usuario_proyecto_pk PRIMARY KEY ( identificador_usuario_proyecto )
);

CREATE SEQUENCE usuario_proyecto_identificador_usuario_proyecto_seq;

CREATE TRIGGER bi_usuario_proyecto_identificador_usuario_proyecto BEFORE
    INSERT ON usuario_proyecto
    FOR EACH ROW
BEGIN
    SELECT
        usuario_proyecto_identificador_usuario_proyecto_seq.NEXTVAL
    INTO :new.identificador_usuario_proyecto
    FROM
        dual;

END;
/

CREATE TABLE tipo_proyecto (
    identificador_tipo_proyecto   NUMBER(11) NOT NULL,
    valor                         VARCHAR2(30) UNIQUE NOT NULL,
    CONSTRAINT tipo_proyecto_pk PRIMARY KEY ( identificador_tipo_proyecto )
);

CREATE SEQUENCE tipo_proyecto_identificador_tipo_proyecto_seq;

CREATE TRIGGER bi_tipo_proyecto_identificador_tipo_proyecto BEFORE
    INSERT ON tipo_proyecto
    FOR EACH ROW
BEGIN
    SELECT
        tipo_proyecto_identificador_tipo_proyecto_seq.NEXTVAL
    INTO :new.identificador_tipo_proyecto
    FROM
        dual;

END;
/

CREATE TABLE incidente (
    identificador_incidente          NUMBER(11) NOT NULL,
    identificador_tipo_incidente     NUMBER(11) NOT NULL,
    identificador_estado_incidente   NUMBER(11) NOT NULL,
    identificador_proyecto           NUMBER(11) NOT NULL,
    identificador_usuario            NUMBER(11) NOT NULL,
    titulo                           VARCHAR2(100) NOT NULL,
    descripcion                      VARCHAR2(1000) NOT NULL,
    CONSTRAINT incidente_pk PRIMARY KEY ( identificador_incidente )
);

CREATE SEQUENCE incidente_identificador_incidente_seq;

CREATE TRIGGER bi_incidente_identificador_incidente BEFORE
    INSERT ON incidente
    FOR EACH ROW
BEGIN
    SELECT
        incidente_identificador_incidente_seq.NEXTVAL
    INTO :new.identificador_incidente
    FROM
        dual;

END;
/

CREATE TABLE tipo_incidente (
    identificador_tipo_incidente   NUMBER(11) NOT NULL,
    valor                          VARCHAR2(30) UNIQUE NOT NULL,
    CONSTRAINT tipo_incidente_pk PRIMARY KEY ( identificador_tipo_incidente )
);

CREATE SEQUENCE tipo_incidente_identificador_tipo_incidente_seq;

CREATE TRIGGER bi_tipo_incidente_identificador_tipo_incidente BEFORE
    INSERT ON tipo_incidente
    FOR EACH ROW
BEGIN
    SELECT
        tipo_incidente_identificador_tipo_incidente_seq.NEXTVAL
    INTO :new.identificador_tipo_incidente
    FROM
        dual;

END;
/

CREATE TABLE estado_incidente (
    identificador_estado_incidente   NUMBER(11) NOT NULL,
    valor                            VARCHAR2(30) UNIQUE NOT NULL,
    CONSTRAINT estado_incidente_pk PRIMARY KEY ( identificador_estado_incidente )
);

CREATE SEQUENCE estado_incidente_identificador_estado_incidente_seq;

CREATE TRIGGER bi_estado_incidente_identificador_estado_incidente BEFORE
    INSERT ON estado_incidente
    FOR EACH ROW
BEGIN
    SELECT
        estado_incidente_identificador_estado_incidente_seq.NEXTVAL
    INTO :new.identificador_estado_incidente
    FROM
        dual;

END;
/

CREATE TABLE historico_incidente (
    identificador_historico_incidente   NUMBER(11) NOT NULL,
    identificador_incidente             NUMBER(11) NOT NULL,
    identificador_usuario               NUMBER(11) NOT NULL,
    identificador_estado_incidente      NUMBER(11) NOT NULL,
    fecha                               TIMESTAMP NOT NULL,
    CONSTRAINT historico_incidente_pk PRIMARY KEY ( identificador_historico_incidente )
);

CREATE SEQUENCE historico_incidente_identificador_historico_incidente_seq;

CREATE TRIGGER bi_historico_incidente_identificador_historico_incidente BEFORE
    INSERT ON historico_incidente
    FOR EACH ROW
BEGIN
    SELECT
        historico_incidente_identificador_historico_incidente_seq.NEXTVAL
    INTO :new.identificador_historico_incidente
    FROM
        dual;

END;
/

ALTER TABLE usuario
    ADD CONSTRAINT usuario_fk0 FOREIGN KEY ( identificador_tipo_documento )
        REFERENCES tipo_documento ( identificador_tipo_documento );

ALTER TABLE cliente
    ADD CONSTRAINT cliente_fk0 FOREIGN KEY ( identificador_tipo_documento )
        REFERENCES tipo_documento ( identificador_tipo_documento );

ALTER TABLE proyecto
    ADD CONSTRAINT proyecto_fk0 FOREIGN KEY ( identificador_tipo_proyecto )
        REFERENCES tipo_proyecto ( identificador_tipo_proyecto );

ALTER TABLE proyecto
    ADD CONSTRAINT proyecto_fk1 FOREIGN KEY ( identificador_cliente )
        REFERENCES cliente ( identificador_cliente );

ALTER TABLE usuario_proyecto
    ADD CONSTRAINT usuario_proyecto_fk0 FOREIGN KEY ( identificador_usuario )
        REFERENCES usuario ( identificador_usuario );

ALTER TABLE usuario_proyecto
    ADD CONSTRAINT usuario_proyecto_fk1 FOREIGN KEY ( identificador_proyecto )
        REFERENCES proyecto ( identificador_proyecto );

ALTER TABLE usuario_proyecto
    ADD CONSTRAINT usuario_proyecto_fk2 FOREIGN KEY ( identificador_rol )
        REFERENCES rol ( identificador_rol );

ALTER TABLE incidente
    ADD CONSTRAINT incidente_fk0 FOREIGN KEY ( identificador_tipo_incidente )
        REFERENCES tipo_incidente ( identificador_tipo_incidente );

ALTER TABLE incidente
    ADD CONSTRAINT incidente_fk1 FOREIGN KEY ( identificador_estado_incidente )
        REFERENCES estado_incidente ( identificador_estado_incidente );

ALTER TABLE incidente
    ADD CONSTRAINT incidente_fk2 FOREIGN KEY ( identificador_proyecto )
        REFERENCES proyecto ( identificador_proyecto );

ALTER TABLE incidente
    ADD CONSTRAINT incidente_fk3 FOREIGN KEY ( identificador_usuario )
        REFERENCES usuario ( identificador_usuario );

ALTER TABLE historico_incidente
    ADD CONSTRAINT historico_incidente_fk0 FOREIGN KEY ( identificador_incidente )
        REFERENCES incidente ( identificador_incidente );

ALTER TABLE historico_incidente
    ADD CONSTRAINT historico_incidente_fk1 FOREIGN KEY ( identificador_usuario )
        REFERENCES usuario ( identificador_usuario );

ALTER TABLE historico_incidente
    ADD CONSTRAINT historico_incidente_fk2 FOREIGN KEY ( identificador_estado_incidente )
        REFERENCES estado_incidente ( identificador_estado_incidente );