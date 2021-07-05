
--=========================================================
ALTER TABLE complementaria DROP CONSTRAINT complementaria_postulante_fk;

ALTER TABLE contacto DROP CONSTRAINT contacto_postulante_fk;

ALTER TABLE estudios DROP CONSTRAINT estudios_postulante_fk;

ALTER TABLE experiencia_laboral DROP CONSTRAINT experiencia_laboral_post_fk;

ALTER TABLE institucion DROP CONSTRAINT institucion_postulante_fk;

ALTER TABLE linea_investigacion DROP CONSTRAINT linea_investigacion_post_fk;

ALTER TABLE objetivos DROP CONSTRAINT objetivos_postulante_fk;

ALTER TABLE proyecto DROP CONSTRAINT proyecto_postulante_fk;

ALTER TABLE puntaje DROP CONSTRAINT puntaje_postulante_fk;

ALTER TABLE subarea DROP CONSTRAINT subarea_institucion_fk;

ALTER TABLE subespecialidad DROP CONSTRAINT subespecialidad_subarea_fk;

ALTER TABLE titulo DROP CONSTRAINT titulo_postulante_fk;

DROP INDEX institucion__idx;

DROP INDEX puntaje__idx;

DROP INDEX subarea__idx;

DROP INDEX subespecialidad__idx;

DROP TABLE complementaria CASCADE CONSTRAINTS;

DROP TABLE contacto CASCADE CONSTRAINTS;

DROP TABLE estudios CASCADE CONSTRAINTS;

DROP TABLE experiencia_laboral CASCADE CONSTRAINTS;

DROP TABLE institucion CASCADE CONSTRAINTS;

DROP TABLE linea_investigacion CASCADE CONSTRAINTS;

DROP TABLE objetivos CASCADE CONSTRAINTS;

DROP TABLE postulante CASCADE CONSTRAINTS;

DROP TABLE proyecto CASCADE CONSTRAINTS;

DROP TABLE puntaje CASCADE CONSTRAINTS;

DROP TABLE subarea CASCADE CONSTRAINTS;

DROP TABLE subespecialidad CASCADE CONSTRAINTS;

DROP TABLE titulo CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

--=========================================================
ALTER TABLE complementaria DROP CONSTRAINT complementaria_postulante_fk;

ALTER TABLE contacto DROP CONSTRAINT contacto_postulante_fk;

ALTER TABLE estudios DROP CONSTRAINT estudios_postulante_fk;

ALTER TABLE experiencia_laboral DROP CONSTRAINT experiencia_laboral_post_fk;

ALTER TABLE institucion DROP CONSTRAINT institucion_postulante_fk;

ALTER TABLE linea_investigacion DROP CONSTRAINT linea_investigacion_post_fk;

ALTER TABLE objetivos DROP CONSTRAINT objetivos_postulante_fk;

ALTER TABLE proyecto DROP CONSTRAINT proyecto_postulante_fk;

ALTER TABLE puntaje DROP CONSTRAINT puntaje_postulante_fk;

ALTER TABLE subarea DROP CONSTRAINT subarea_institucion_fk;

ALTER TABLE subespecialidad DROP CONSTRAINT subespecialidad_subarea_fk;

ALTER TABLE titulo DROP CONSTRAINT titulo_postulante_fk;

DROP INDEX institucion__idx;

DROP INDEX puntaje__idx;

DROP INDEX subarea__idx;

DROP INDEX subespecialidad__idx;

DROP TABLE complementaria CASCADE CONSTRAINTS;

DROP TABLE contacto CASCADE CONSTRAINTS;

DROP TABLE estudios CASCADE CONSTRAINTS;

DROP TABLE experiencia_laboral CASCADE CONSTRAINTS;

DROP TABLE institucion CASCADE CONSTRAINTS;

DROP TABLE linea_investigacion CASCADE CONSTRAINTS;

DROP TABLE objetivos CASCADE CONSTRAINTS;

DROP TABLE postulante CASCADE CONSTRAINTS;

DROP TABLE proyecto CASCADE CONSTRAINTS;

DROP TABLE puntaje CASCADE CONSTRAINTS;

DROP TABLE subarea CASCADE CONSTRAINTS;

DROP TABLE subespecialidad CASCADE CONSTRAINTS;

DROP TABLE titulo CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY


CREATE TABLE complementaria (
    cod_complementaria         INTEGER NOT NULL,
    tiene_hijos                CHAR(1) NOT NULL,
    estado_civil               VARCHAR2(60 CHAR) NOT NULL,
    numero_hijos               INTEGER,
    discapacidad_fisica        CHAR(1) NOT NULL,
    discapacidad_desc          VARCHAR2(60 CHAR),
    pueblo_indigena            CHAR(1) NOT NULL,
    pueblo_desc                VARCHAR2(60 CHAR),
    postulante_cod_postulante  INTEGER NOT NULL
);

CREATE UNIQUE INDEX complementaria__idx ON
    complementaria (
        postulante_cod_postulante
    ASC );

CREATE TABLE contacto (
    cod_contacto               INTEGER NOT NULL,
    tipo_direccion             VARCHAR2(60 CHAR) NOT NULL,
    direccion                  VARCHAR2(60 CHAR) NOT NULL,
    envio_correspondencia      VARCHAR2(60 CHAR) NOT NULL,
    opciones                   VARCHAR2(70 CHAR) NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

ALTER TABLE contacto ADD CONSTRAINT contacto_pk PRIMARY KEY ( cod_contacto );

CREATE TABLE estudios (
    cod_estudios                 INTEGER NOT NULL,
    pais_estudios                VARCHAR2(60 CHAR) NOT NULL,
    dependencia_establecimiento  VARCHAR2(60 CHAR),
    tipo_establecimiento         VARCHAR2(60) NOT NULL,
    tipo_ingreso                 VARCHAR2(60 CHAR),
    postulante_cod_postulante    INTEGER NOT NULL
);

CREATE UNIQUE INDEX estudios__idx ON
    estudios (
        postulante_cod_postulante
    ASC );

ALTER TABLE estudios ADD CONSTRAINT estudios_pk PRIMARY KEY ( cod_estudios );

CREATE TABLE experiencia_laboral (
    cod_experiencia            INTEGER NOT NULL,
    tipo_experencia            VARCHAR2(70 CHAR) NOT NULL,
    nombre_empresa             VARCHAR2(70 CHAR),
    fecha_inicio               DATE NOT NULL,
    fecha_termino              DATE NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

ALTER TABLE experiencia_laboral ADD CONSTRAINT experiencia_laboral_pk PRIMARY KEY ( cod_experiencia );

CREATE TABLE institucion (
    cod_institucion            INTEGER NOT NULL,
    pais                       VARCHAR2(60 CHAR) NOT NULL,
    institucion                VARCHAR2(70 CHAR) NOT NULL,
    ranking                    INTEGER NOT NULL,
    puntaje                    INTEGER NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

CREATE UNIQUE INDEX institucion__idx ON
    institucion (
        postulante_cod_postulante
    ASC );

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( cod_institucion );

CREATE TABLE linea_investigacion (
    cod_investigacion          INTEGER NOT NULL,
    linea_1                    VARCHAR2(200 CHAR) NOT NULL,
    linea_2                    VARCHAR2(200 CHAR) NOT NULL,
    linea_3                    VARCHAR2(200 CHAR) NOT NULL,
    diciplina_principal        VARCHAR2(200 CHAR) NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

CREATE UNIQUE INDEX linea_investigacion__idx ON
    linea_investigacion (
        postulante_cod_postulante
    ASC );

ALTER TABLE linea_investigacion ADD CONSTRAINT linea_investigacion_pk PRIMARY KEY ( cod_investigacion );

CREATE TABLE objetivos (
    cod_objetivo               INTEGER NOT NULL,
    objetivos                  BLOB NOT NULL,
    interes                    BLOB NOT NULL,
    retorno                    BLOB NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

CREATE UNIQUE INDEX objetivos__idx ON
    objetivos (
        postulante_cod_postulante
    ASC );

ALTER TABLE objetivos ADD CONSTRAINT objetivos_pk PRIMARY KEY ( cod_objetivo );

CREATE TABLE postulante (
    cod_postulante     INTEGER NOT NULL,
    apellido_paterno   VARCHAR2(30 CHAR) NOT NULL,
    apellido_materno   VARCHAR2(30 CHAR) NOT NULL,
    primer_nombre      VARCHAR2(30 CHAR) NOT NULL,
    segundo_nombre     VARCHAR2(30 CHAR),
    run                VARCHAR2(11 CHAR) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    nacionalidad       VARCHAR2(30 CHAR) NOT NULL,
    sexo               CHAR(1) NOT NULL,
    pasaporte_visa     VARCHAR2(70 CHAR) NOT NULL,
    fecha_postulacion  DATE NOT NULL,
    region             VARCHAR2(30 CHAR) NOT NULL
);

ALTER TABLE postulante ADD CONSTRAINT postulante_pk PRIMARY KEY ( cod_postulante );

CREATE TABLE proyecto (
    cod_proyecto               INTEGER NOT NULL,
    titulo                     VARCHAR2(70 CHAR) NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

ALTER TABLE proyecto ADD CONSTRAINT proyecto_pk PRIMARY KEY ( cod_proyecto );

CREATE TABLE puntaje (
    cod_puntaje                INTEGER NOT NULL,
    ptje_edad                  INTEGER NOT NULL,
    ptje_es_civil              INTEGER NOT NULL,
    ptje_pueblo_indigena       INTEGER NOT NULL,
    ptje_zona_extrema          INTEGER NOT NULL,
    ptje_antec_acad            INTEGER NOT NULL,
    ptje_trayec                INTEGER NOT NULL,
    ptje_docencia              INTEGER NOT NULL,
    ptje_estudio               INTEGER NOT NULL,
    ptje_retrib                INTEGER NOT NULL,
    ptje_ranking               INTEGER NOT NULL,
    ptje_total                 INTEGER NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

CREATE UNIQUE INDEX puntaje__idx ON
    puntaje (
        postulante_cod_postulante
    ASC );

ALTER TABLE puntaje ADD CONSTRAINT puntaje_pk PRIMARY KEY ( cod_puntaje );

CREATE TABLE subarea (
    cod_subarea                  INTEGER NOT NULL,
    nombre_subarea               VARCHAR2(70 CHAR) NOT NULL,
    institucion_cod_institucion  INTEGER NOT NULL
);

CREATE UNIQUE INDEX subarea__idx ON
    subarea (
        institucion_cod_institucion
    ASC );

ALTER TABLE subarea ADD CONSTRAINT subarea_pk PRIMARY KEY ( cod_subarea );

CREATE TABLE subespecialidad (
    cod_subespecialidad    INTEGER NOT NULL,
    nombre                 VARCHAR2(70 CHAR) NOT NULL,
    requisito              VARCHAR2(70 CHAR) NOT NULL,
    experiencia_laboral    INTEGER NOT NULL,
    idioma                 VARCHAR2(70 CHAR) NOT NULL,
    cupos                  VARCHAR2(70 CHAR) NOT NULL,
    duracion               VARCHAR2(70 CHAR) NOT NULL,
    modulos                BLOB NOT NULL,
    institucion_academica  VARCHAR2(70 CHAR) NOT NULL,
    ranking                INTEGER NOT NULL,
    url                    VARCHAR2(70 CHAR) NOT NULL,
    ciudad                 VARCHAR2(70 CHAR) NOT NULL,
    pais                   VARCHAR2(70 CHAR) NOT NULL,
    subarea_cod_subarea    INTEGER NOT NULL
);

CREATE UNIQUE INDEX subespecialidad__idx ON
    subespecialidad (
        subarea_cod_subarea
    ASC );

CREATE TABLE titulo (
    cod_titulo                 INTEGER NOT NULL,
    tipo_estudio               VARCHAR2(60 CHAR) NOT NULL,
    institucion                VARCHAR2(70 CHAR) NOT NULL,
    nombre_carrera             VARCHAR2(70 CHAR) NOT NULL,
    fecha_obtencion            DATE NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);


ALTER TABLE titulo ADD CONSTRAINT titulo_pk PRIMARY KEY ( cod_titulo );

ALTER TABLE complementaria
    ADD CONSTRAINT complementaria_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE contacto
    ADD CONSTRAINT contacto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE experiencia_laboral
    ADD CONSTRAINT exp_laboral_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE institucion
    ADD CONSTRAINT institucion_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE linea_investigacion
    ADD CONSTRAINT linea_invest_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE objetivos
    ADD CONSTRAINT objetivos_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE proyecto
    ADD CONSTRAINT proyecto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE puntaje
    ADD CONSTRAINT puntaje_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE subarea
    ADD CONSTRAINT subarea_institucion_fk FOREIGN KEY ( institucion_cod_institucion )
        REFERENCES institucion ( cod_institucion );

ALTER TABLE subespecialidad
    ADD CONSTRAINT subespecialidad_subarea_fk FOREIGN KEY ( subarea_cod_subarea )
        REFERENCES subarea ( cod_subarea );

ALTER TABLE titulo
    ADD CONSTRAINT titulo_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

--modelo v2
CREATE TABLE direccion (
    cod_direccion              INTEGER NOT NULL,
    cod_region                 INTEGER NOT NULL,
    comuna                     VARCHAR2(30 CHAR) NOT NULL,
    direccion                  VARCHAR2(30 CHAR) NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL
);

ALTER TABLE direccion ADD CONSTRAINT direccion_pk PRIMARY KEY ( cod_direccion );

ALTER TABLE direccion
    ADD CONSTRAINT direccion_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );


