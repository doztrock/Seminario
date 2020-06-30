CREATE TABLE "tipo_documento" (
	"identificador" NUMBER(11) NOT NULL,
	"valor" VARCHAR2(30) UNIQUE NOT NULL,
	constraint TIPO_DOCUMENTO_PK PRIMARY KEY ("identificador"));

CREATE sequence "TIPO_DOCUMENTO_IDENTIFICADOR_SEQ";

CREATE trigger "BI_TIPO_DOCUMENTO_IDENTIFICADOR"
  before insert on "tipo_documento"
  for each row
begin
  select "TIPO_DOCUMENTO_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "usuario" (
	"identificador" NUMBER(11) NOT NULL,
	"identificador_tipo_documento" NUMBER(11) NOT NULL,
	"documento" VARCHAR2(255) NOT NULL,
	"nombre" VARCHAR2(50) NOT NULL,
	"apellido" VARCHAR2(50) NOT NULL,
	"email" VARCHAR2(50) UNIQUE NOT NULL,
	constraint USUARIO_PK PRIMARY KEY ("identificador"));

CREATE sequence "USUARIO_IDENTIFICADOR_SEQ";

CREATE trigger "BI_USUARIO_IDENTIFICADOR"
  before insert on "usuario"
  for each row
begin
  select "USUARIO_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "cliente" (
	"identificador" NUMBER(11) NOT NULL,
	"identificador_tipo_documento" NUMBER(11) NOT NULL,
	"documento" VARCHAR2(30) UNIQUE NOT NULL,
	"nombre" VARCHAR2(50) NOT NULL,
	"apellido" VARCHAR2(50) NOT NULL,
	"email" VARCHAR2(50) UNIQUE NOT NULL,
	constraint CLIENTE_PK PRIMARY KEY ("identificador"));

CREATE sequence "CLIENTE_IDENTIFICADOR_SEQ";

CREATE trigger "BI_CLIENTE_IDENTIFICADOR"
  before insert on "cliente"
  for each row
begin
  select "CLIENTE_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "proyecto" (
	"identificador" VARCHAR2(11) NOT NULL,
	"identificador_tipo_proyecto" NUMBER(11) NOT NULL,
	"identificador_cliente" NUMBER(11) NOT NULL,
	"nombre" VARCHAR2(50) NOT NULL,
	"prefijo" VARCHAR2(10) UNIQUE NOT NULL,
	constraint PROYECTO_PK PRIMARY KEY ("identificador"));


/
CREATE TABLE "rol" (
	"identificador" NUMBER(11) NOT NULL,
	"valor" VARCHAR2(30) UNIQUE NOT NULL,
	constraint ROL_PK PRIMARY KEY ("identificador"));

CREATE sequence "ROL_IDENTIFICADOR_SEQ";

CREATE trigger "BI_ROL_IDENTIFICADOR"
  before insert on "rol"
  for each row
begin
  select "ROL_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "usuario_proyecto" (
	"identificador" VARCHAR2(11) NOT NULL,
	"identificador_usuario" NUMBER(11) NOT NULL,
	"identificador_proyecto" NUMBER(11) NOT NULL,
	"identificador_rol" NUMBER(11) NOT NULL,
	constraint USUARIO_PROYECTO_PK PRIMARY KEY ("identificador"));


/
CREATE TABLE "tipo_proyecto" (
	"identificador" NUMBER(11) NOT NULL,
	"valor" VARCHAR2(30) UNIQUE NOT NULL,
	constraint TIPO_PROYECTO_PK PRIMARY KEY ("identificador"));

CREATE sequence "TIPO_PROYECTO_IDENTIFICADOR_SEQ";

CREATE trigger "BI_TIPO_PROYECTO_IDENTIFICADOR"
  before insert on "tipo_proyecto"
  for each row
begin
  select "TIPO_PROYECTO_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "incidente" (
	"identificador" NUMBER(11) NOT NULL,
	"identificador_tipo_incidente" NUMBER(11) NOT NULL,
	"identificador_estado_incidente" NUMBER(11) NOT NULL,
	constraint INCIDENTE_PK PRIMARY KEY ("identificador"));

CREATE sequence "INCIDENTE_IDENTIFICADOR_SEQ";

CREATE trigger "BI_INCIDENTE_IDENTIFICADOR"
  before insert on "incidente"
  for each row
begin
  select "INCIDENTE_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "tipo_incidente" (
	"identificador" NUMBER(11) NOT NULL,
	"valor" VARCHAR2(30) UNIQUE NOT NULL,
	constraint TIPO_INCIDENTE_PK PRIMARY KEY ("identificador"));

CREATE sequence "TIPO_INCIDENTE_IDENTIFICADOR_SEQ";

CREATE trigger "BI_TIPO_INCIDENTE_IDENTIFICADOR"
  before insert on "tipo_incidente"
  for each row
begin
  select "TIPO_INCIDENTE_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "estado_incidente" (
	"identificador" NUMBER(11) NOT NULL,
	"valor" VARCHAR2(30) UNIQUE NOT NULL,
	constraint ESTADO_INCIDENTE_PK PRIMARY KEY ("identificador"));

CREATE sequence "ESTADO_INCIDENTE_IDENTIFICADOR_SEQ";

CREATE trigger "BI_ESTADO_INCIDENTE_IDENTIFICADOR"
  before insert on "estado_incidente"
  for each row
begin
  select "ESTADO_INCIDENTE_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/
CREATE TABLE "historico_incidente" (
	"identificador" NUMBER(11) NOT NULL,
	"identificador_incidente" NUMBER(11) NOT NULL,
	"identificador_usuario" NUMBER(11) NOT NULL,
	"identificador_estado_incidente" NUMBER(11) NOT NULL,
	"fecha" TIMESTAMP NOT NULL,
	constraint HISTORICO_INCIDENTE_PK PRIMARY KEY ("identificador"));

CREATE sequence "HISTORICO_INCIDENTE_IDENTIFICADOR_SEQ";

CREATE trigger "BI_HISTORICO_INCIDENTE_IDENTIFICADOR"
  before insert on "historico_incidente"
  for each row
begin
  select "HISTORICO_INCIDENTE_IDENTIFICADOR_SEQ".nextval into :NEW."identificador" from dual;
end;

/

ALTER TABLE "usuario" ADD CONSTRAINT "usuario_fk0" FOREIGN KEY ("identificador_tipo_documento") REFERENCES "tipo_documento"("identificador");

ALTER TABLE "cliente" ADD CONSTRAINT "cliente_fk0" FOREIGN KEY ("identificador_tipo_documento") REFERENCES "tipo_documento"("identificador");

ALTER TABLE "proyecto" ADD CONSTRAINT "proyecto_fk0" FOREIGN KEY ("identificador_tipo_proyecto") REFERENCES "tipo_proyecto"("identificador");
ALTER TABLE "proyecto" ADD CONSTRAINT "proyecto_fk1" FOREIGN KEY ("identificador_cliente") REFERENCES "cliente"("identificador");


ALTER TABLE "usuario_proyecto" ADD CONSTRAINT "usuario_proyecto_fk0" FOREIGN KEY ("identificador_usuario") REFERENCES "usuario"("identificador");
ALTER TABLE "usuario_proyecto" ADD CONSTRAINT "usuario_proyecto_fk1" FOREIGN KEY ("identificador_proyecto") REFERENCES "proyecto"("identificador");
ALTER TABLE "usuario_proyecto" ADD CONSTRAINT "usuario_proyecto_fk2" FOREIGN KEY ("identificador_rol") REFERENCES "rol"("identificador");


ALTER TABLE "incidente" ADD CONSTRAINT "incidente_fk0" FOREIGN KEY ("identificador_tipo_incidente") REFERENCES "tipo_incidente"("identificador");
ALTER TABLE "incidente" ADD CONSTRAINT "incidente_fk1" FOREIGN KEY ("identificador_estado_incidente") REFERENCES "estado_incidente"("identificador");



ALTER TABLE "historico_incidente" ADD CONSTRAINT "historico_incidente_fk0" FOREIGN KEY ("identificador_incidente") REFERENCES "incidente"("identificador");
ALTER TABLE "historico_incidente" ADD CONSTRAINT "historico_incidente_fk1" FOREIGN KEY ("identificador_usuario") REFERENCES "usuario"("identificador");
ALTER TABLE "historico_incidente" ADD CONSTRAINT "historico_incidente_fk2" FOREIGN KEY ("identificador_estado_incidente") REFERENCES "estado_incidente"("identificador");

