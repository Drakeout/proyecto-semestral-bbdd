-- Generado por Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   en:        2021-06-28 10:32:25 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE complementaria (
    cod_postulante       INTEGER NOT NULL,
    cod_complementaria   INTEGER NOT NULL,
    tiene_hijos          CHAR(1) NOT NULL,
    estado_civil         VARCHAR2(60 CHAR) NOT NULL,
    numero_hijos         INTEGER,
    discapacidad_fisica  CHAR(1) NOT NULL,
    discapacidad_desc    VARCHAR2(60 CHAR),
    pueblo_indigena      CHAR(1) NOT NULL,
    pueblo_desc          VARCHAR2(60 CHAR)
);

ALTER TABLE complementaria ADD CONSTRAINT complementaria_pk PRIMARY KEY ( cod_postulante );

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
    cod_postulante               INTEGER NOT NULL,
    cod_estudios                 INTEGER NOT NULL,
    pais_estudios                VARCHAR2(60 CHAR) NOT NULL,
    dependencia_establecimiento  VARCHAR2(60 CHAR),
    tipo_establecimiento         VARCHAR2(60) NOT NULL,
    tipo_ingreso                 VARCHAR2(60 CHAR)
);

ALTER TABLE estudios ADD CONSTRAINT estudios_pk PRIMARY KEY ( cod_postulante );

ALTER TABLE estudios ADD CONSTRAINT estudios_pkv1 UNIQUE ( cod_estudios );

CREATE TABLE experiencia_laboral (
    cod_experiencia  INTEGER NOT NULL,
    tipo_experencia  VARCHAR2(70 CHAR) NOT NULL,
    nombre_empresa   VARCHAR2(70 CHAR),
    fecha_inicio     DATE NOT NULL,
    fecha_termino    DATE NOT NULL,
    postulante_cod   INTEGER NOT NULL
);

ALTER TABLE experiencia_laboral ADD CONSTRAINT experiencia_laboral_pk PRIMARY KEY ( cod_experiencia );

CREATE TABLE institucion (
    cod_institucion            INTEGER NOT NULL,
    pais                       VARCHAR2(60 CHAR) NOT NULL,
    institucion                VARCHAR2(70 CHAR) NOT NULL,
    ranking                    INTEGER NOT NULL,
    puntaje                    INTEGER NOT NULL,
    postulante_cod_postulante  INTEGER NOT NULL,
    subarea_cod_subarea        INTEGER NOT NULL
);

CREATE UNIQUE INDEX institucion__idx ON
    institucion (
        postulante_cod_postulante
    ASC );

CREATE UNIQUE INDEX institucion__idxv1 ON
    institucion (
        subarea_cod_subarea
    ASC );

ALTER TABLE institucion ADD CONSTRAINT institucion_pk PRIMARY KEY ( cod_institucion );

CREATE TABLE linea_investigacion (
    cod_postulante       INTEGER NOT NULL,
    cod_investigacion    INTEGER NOT NULL,
    linea_1              VARCHAR2(200 CHAR) NOT NULL,
    linea_2              VARCHAR2(200 CHAR) NOT NULL,
    linea_3              VARCHAR2(200 CHAR) NOT NULL,
    diciplina_principal  VARCHAR2(200 CHAR) NOT NULL
);

ALTER TABLE linea_investigacion ADD CONSTRAINT linea_investigacion_pk PRIMARY KEY ( cod_postulante );

ALTER TABLE linea_investigacion ADD CONSTRAINT linea_investigacion_pkv1 UNIQUE ( cod_investigacion );

CREATE TABLE objetivos (
    cod_postulante  INTEGER NOT NULL,
    cod_objetivo    INTEGER NOT NULL,
    objetivos       BLOB NOT NULL,
    interes         BLOB NOT NULL,
    retorno         BLOB NOT NULL
);

ALTER TABLE objetivos ADD CONSTRAINT objetivos_pk PRIMARY KEY ( cod_postulante );

ALTER TABLE objetivos ADD CONSTRAINT objetivos_pkv1 UNIQUE ( cod_objetivo );

CREATE TABLE postulante (
    cod_postulante               INTEGER NOT NULL,
    apellido_paterno             VARCHAR2(30 CHAR) NOT NULL,
    apellido_materno             VARCHAR2(30 CHAR) NOT NULL,
    primer_nombre                VARCHAR2(30 CHAR) NOT NULL,
    segundo_nombre               VARCHAR2(30 CHAR),
    run                          VARCHAR2(11 CHAR) NOT NULL,
    fecha_nacimiento             DATE NOT NULL,
    nacionalidad                 VARCHAR2(30 CHAR) NOT NULL,
    sexo                         CHAR(1) NOT NULL,
    pasaporte_visa               VARCHAR2(70 CHAR) NOT NULL,
    fecha_postulacion            DATE NOT NULL,
    region                       VARCHAR2(30 CHAR) NOT NULL,
    institucion_cod_institucion  INTEGER NOT NULL,
    puntaje_cod_puntaje          INTEGER NOT NULL
);

CREATE UNIQUE INDEX postulante__idx ON
    postulante (
        institucion_cod_institucion
    ASC );

CREATE UNIQUE INDEX postulante__idxv1 ON
    postulante (
        puntaje_cod_puntaje
    ASC );

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
    cod_subarea         INTEGER NOT NULL,
    nombre_subarea      VARCHAR2(70 CHAR) NOT NULL,
    institucion_cod     INTEGER NOT NULL,
    subespecialidad_id  NUMBER NOT NULL
);

CREATE UNIQUE INDEX subarea__idx ON
    subarea (
        subespecialidad_id
    ASC );

CREATE UNIQUE INDEX subarea__idxv1 ON
    subarea (
        institucion_cod
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
    subarea_cod_subarea    INTEGER NOT NULL,
    subespecialidad_id     NUMBER NOT NULL
);

CREATE UNIQUE INDEX subespecialidad__idx ON
    subespecialidad (
        subarea_cod_subarea
    ASC );

ALTER TABLE subespecialidad ADD CONSTRAINT subespecialidad_pk PRIMARY KEY ( subespecialidad_id );

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
    ADD CONSTRAINT complementaria_postulante_fk FOREIGN KEY ( cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE contacto
    ADD CONSTRAINT contacto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE estudios
    ADD CONSTRAINT estudios_postulante_fk FOREIGN KEY ( cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE experiencia_laboral
    ADD CONSTRAINT exp_laboral_postulante_fk FOREIGN KEY ( postulante_cod )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE institucion
    ADD CONSTRAINT institucion_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE institucion
    ADD CONSTRAINT institucion_subarea_fk FOREIGN KEY ( subarea_cod_subarea )
        REFERENCES subarea ( cod_subarea );

ALTER TABLE linea_investigacion
    ADD CONSTRAINT linea_invest_postulante_fk FOREIGN KEY ( cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE objetivos
    ADD CONSTRAINT objetivos_postulante_fk FOREIGN KEY ( cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_institucion_fk FOREIGN KEY ( institucion_cod_institucion )
        REFERENCES institucion ( cod_institucion );

ALTER TABLE postulante
    ADD CONSTRAINT postulante_puntaje_fk FOREIGN KEY ( puntaje_cod_puntaje )
        REFERENCES puntaje ( cod_puntaje );

ALTER TABLE proyecto
    ADD CONSTRAINT proyecto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE puntaje
    ADD CONSTRAINT puntaje_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

ALTER TABLE subarea
    ADD CONSTRAINT subarea_institucion_fk FOREIGN KEY ( institucion_cod )
        REFERENCES institucion ( cod_institucion );

ALTER TABLE subarea
    ADD CONSTRAINT subarea_subespecialidad_fk FOREIGN KEY ( subespecialidad_id )
        REFERENCES subespecialidad ( subespecialidad_id );

ALTER TABLE subespecialidad
    ADD CONSTRAINT subespecialidad_subarea_fk FOREIGN KEY ( subarea_cod_subarea )
        REFERENCES subarea ( cod_subarea );

ALTER TABLE titulo
    ADD CONSTRAINT titulo_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES postulante ( cod_postulante );

CREATE OR REPLACE TRIGGER ARC_FKArc_1_estudios BEFORE
    INSERT OR UPDATE OF cod_postulante ON estudios
    FOR EACH ROW
DECLARE
    d INTEGER; 
BEGIN SELECT
          a.cod_postulante
      INTO d
      FROM
          postulante a
      WHERE
          a.cod_postulante = :new.cod_postulante;if ( d IS NULL OR d < > integer) THEN 
        raise_application_error(-20223,'FK estudios_postulante_FK in Table estudios violates Arc constraint on Table postulante - discriminator column cod_postulante doesn''t have value integer'); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FKArc_1_objetivos 
BEFORE INSERT OR UPDATE OF cod_postulante 
ON objetivos 
FOR EACH ROW 
DECLARE 
    d INTEGER; 
BEGIN 
    SELECT A.cod_postulante INTO d 
    FROM postulante A 
    WHERE A.cod_postulante = :new.cod_postulante; 
    IF (d IS NULL OR d <> integer) THEN 
        raise_application_error(-20223,'FK objetivos_postulante_FK in Table objetivos violates Arc constraint on Table postulante - discriminator column cod_postulante doesn''t have value integer'); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FKArc_1_complementaria 
BEFORE INSERT OR UPDATE OF cod_postulante 
ON complementaria 
FOR EACH ROW 
DECLARE 
    d INTEGER; 
BEGIN 
    SELECT A.cod_postulante INTO d 
    FROM postulante A 
    WHERE A.cod_postulante = :new.cod_postulante; 
    IF (d IS NULL OR d <> integer) THEN 
        raise_application_error(-20223,'FK complementaria_postulante_FK in Table complementaria violates Arc constraint on Table postulante - discriminator column cod_postulante doesn''t have value integer'); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FKArc__linea_investigacion 
BEFORE INSERT OR UPDATE OF cod_postulante 
ON linea_investigacion 
FOR EACH ROW 
DECLARE 
    d INTEGER; 
BEGIN 
    SELECT A.cod_postulante INTO d 
    FROM postulante A 
    WHERE A.cod_postulante = :new.cod_postulante; 
    IF (d IS NULL OR d <> INTEGER ) THEN
    raise_application_error(-20223,
                           'FK linea_invest_postulante_FK in Table linea_investigacion violates Arc constraint on Table postulante - discriminator column cod_postulante doesn''t have value integer');
END IF;EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END; 
/

CREATE SEQUENCE subespecialidad_subespecialida START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER subespecialidad_subespecialida BEFORE
    INSERT ON subespecialidad
    FOR EACH ROW
    WHEN ( new.subespecialidad_id IS NULL )
BEGIN
    :new.subespecialidad_id := subespecialidad_subespecialida.nextval;
END;
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             8
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           5
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          1
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
