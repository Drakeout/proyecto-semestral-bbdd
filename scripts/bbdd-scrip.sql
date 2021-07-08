-- Generado por Oracle SQL Developer Data Modeler 21.1.0.092.1221
--   en:        2021-07-08 11:55:07 CLT
--   sitio:      Oracle Database 12c
--   tipo:      Oracle Database 12c



CREATE USER c##postulacion IDENTIFIED BY account UNLOCK 
;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE c##postulacion.complementaria (
    cod_complementaria         NUMBER(*, 0) NOT NULL,
    tiene_hijos                CHAR(1 BYTE) NOT NULL,
    numero_hijos               NUMBER(*, 0),
    discapacidad_fisica        CHAR(1 BYTE) NOT NULL,
    discapacidad_desc          VARCHAR2(60 CHAR),
    pueblo_indigena            CHAR(1 BYTE) NOT NULL,
    pueblo_desc                VARCHAR2(60 CHAR),
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL,
    estado_civil               NUMBER(*, 0) DEFAULT 1 NOT NULL,
    estado_civil_cod_estado    NUMBER(*, 0)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.complementaria__idx ON
    c##postulacion.complementaria (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.contacto (
    cod_contacto               NUMBER(*, 0) NOT NULL,
    tipo_direccion             VARCHAR2(60 CHAR) NOT NULL,
    direccion                  VARCHAR2(60 CHAR) NOT NULL,
    envio_correspondencia      VARCHAR2(60 CHAR) NOT NULL,
    opciones                   VARCHAR2(70 CHAR) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.contacto_pk ON
    c##postulacion.contacto (
        cod_contacto
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.contacto
    ADD CONSTRAINT contacto_pk PRIMARY KEY ( cod_contacto )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.direccion (
    cod_direccion              NUMBER(*, 0) NOT NULL,
    cod_region                 NUMBER(*, 0) NOT NULL,
    comuna                     VARCHAR2(30 CHAR) NOT NULL,
    direccion                  VARCHAR2(30 CHAR) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL,
    region_cod_region          NUMBER(*, 0)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.direccion_pk ON
    c##postulacion.direccion (
        cod_direccion
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.direccion
    ADD CONSTRAINT direccion_pk PRIMARY KEY ( cod_direccion )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.estado_civil (
    cod_estado    NUMBER(*, 0) NOT NULL,
    estado_civil  VARCHAR2(30 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE c##postulacion.estado_civil ADD CONSTRAINT estado_civil_pk PRIMARY KEY ( cod_estado );

CREATE TABLE c##postulacion.estudios (
    cod_estudios                 NUMBER(*, 0) NOT NULL,
    pais_estudios                VARCHAR2(60 CHAR) NOT NULL,
    dependencia_establecimiento  VARCHAR2(60 CHAR),
    tipo_establecimiento         VARCHAR2(60 BYTE) NOT NULL,
    tipo_ingreso                 VARCHAR2(60 CHAR),
    postulante_cod_postulante    NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.estudios__idx ON
    c##postulacion.estudios (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.estudios_pk ON
    c##postulacion.estudios (
        cod_estudios
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.estudios
    ADD CONSTRAINT estudios_pk PRIMARY KEY ( cod_estudios )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.experiencia_laboral (
    cod_experiencia            NUMBER(*, 0) NOT NULL,
    tipo_experencia            VARCHAR2(70 CHAR) NOT NULL,
    nombre_empresa             VARCHAR2(70 CHAR),
    fecha_inicio               DATE NOT NULL,
    fecha_termino              DATE NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.experiencia_laboral_pk ON
    c##postulacion.experiencia_laboral (
        cod_experiencia
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.experiencia_laboral
    ADD CONSTRAINT experiencia_laboral_pk PRIMARY KEY ( cod_experiencia )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.institucion (
    cod_institucion            NUMBER(*, 0) NOT NULL,
    pais                       VARCHAR2(60 CHAR) NOT NULL,
    institucion                VARCHAR2(70 CHAR) NOT NULL,
    ranking                    NUMBER(*, 0) NOT NULL,
    puntaje                    NUMBER(*, 0) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL,
    url                        VARCHAR2(90 BYTE) DEFAULT '1' NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.institucion__idx ON
    c##postulacion.institucion (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.institucion_pk ON
    c##postulacion.institucion (
        cod_institucion
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.institucion
    ADD CONSTRAINT institucion_pk PRIMARY KEY ( cod_institucion )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.linea_investigacion (
    cod_investigacion          NUMBER(*, 0) NOT NULL,
    linea_1                    VARCHAR2(200 CHAR) NOT NULL,
    linea_2                    VARCHAR2(200 CHAR) NOT NULL,
    linea_3                    VARCHAR2(200 CHAR) NOT NULL,
    diciplina_principal        VARCHAR2(200 CHAR) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.linea_investigacion__idx ON
    c##postulacion.linea_investigacion (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.linea_investigacion_pk ON
    c##postulacion.linea_investigacion (
        cod_investigacion
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.linea_investigacion
    ADD CONSTRAINT linea_investigacion_pk PRIMARY KEY ( cod_investigacion )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.objetivos (
    cod_objetivo               NUMBER(*, 0) NOT NULL,
    objetivos                  BLOB NOT NULL,
    interes                    BLOB NOT NULL,
    retorno                    BLOB NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
    LOB ( objetivos ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( interes ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    )
    LOB ( retorno ) STORE AS SECUREFILE (
        TABLESPACE users
        STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 BUFFER_POOL DEFAULT )
        CHUNK 8192
        RETENTION
        ENABLE STORAGE IN ROW
        NOCACHE LOGGING
    );

CREATE UNIQUE INDEX c##postulacion.objetivos__idx ON
    c##postulacion.objetivos (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.objetivos_pk ON
    c##postulacion.objetivos (
        cod_objetivo
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.objetivos
    ADD CONSTRAINT objetivos_pk PRIMARY KEY ( cod_objetivo )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.postulante (
    cod_postulante     NUMBER(*, 0) NOT NULL,
    apellido_paterno   VARCHAR2(30 CHAR) NOT NULL,
    apellido_materno   VARCHAR2(30 CHAR) NOT NULL,
    primer_nombre      VARCHAR2(30 CHAR) NOT NULL,
    segundo_nombre     VARCHAR2(30 CHAR),
    run                VARCHAR2(11 CHAR) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    nacionalidad       VARCHAR2(30 CHAR) NOT NULL,
    sexo               CHAR(1 BYTE) NOT NULL,
    pasaporte_visa     VARCHAR2(70 CHAR) NOT NULL,
    fecha_postulacion  DATE NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.postulante_pk ON
    c##postulacion.postulante (
        cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.postulante
    ADD CONSTRAINT postulante_pk PRIMARY KEY ( cod_postulante )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.proyecto (
    cod_proyecto               NUMBER(*, 0) NOT NULL,
    titulo                     VARCHAR2(70 CHAR) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.proyecto_pk ON
    c##postulacion.proyecto (
        cod_proyecto
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.proyecto
    ADD CONSTRAINT proyecto_pk PRIMARY KEY ( cod_proyecto )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.puntaje (
    cod_puntaje                NUMBER(*, 0) NOT NULL,
    ptje_edad                  NUMBER(*, 0) NOT NULL,
    ptje_es_civil              NUMBER(*, 0) NOT NULL,
    ptje_pueblo_indigena       NUMBER(*, 0) NOT NULL,
    ptje_zona_extrema          NUMBER(*, 0) NOT NULL,
    ptje_antec_acad            NUMBER(*, 0) NOT NULL,
    ptje_trayec                NUMBER(*, 0) NOT NULL,
    ptje_docencia              NUMBER(*, 0) NOT NULL,
    ptje_estudio               NUMBER(*, 0) NOT NULL,
    ptje_retrib                NUMBER(*, 0) NOT NULL,
    ptje_ranking               NUMBER(*, 0) NOT NULL,
    ptje_total                 NUMBER(*, 0) NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.puntaje__idx ON
    c##postulacion.puntaje (
        postulante_cod_postulante
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.puntaje_pk ON
    c##postulacion.puntaje (
        cod_puntaje
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.puntaje
    ADD CONSTRAINT puntaje_pk PRIMARY KEY ( cod_puntaje )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.region (
    cod_region  NUMBER(*, 0) NOT NULL,
    region      VARCHAR2(40 BYTE) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

ALTER TABLE c##postulacion.region ADD CONSTRAINT region_pk PRIMARY KEY ( cod_region );

CREATE TABLE c##postulacion.subarea (
    cod_subarea                  NUMBER(*, 0) NOT NULL,
    nombre_subarea               VARCHAR2(70 CHAR) NOT NULL,
    institucion_cod_institucion  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.subarea__idx ON
    c##postulacion.subarea (
        institucion_cod_institucion
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE UNIQUE INDEX c##postulacion.subarea_pk ON
    c##postulacion.subarea (
        cod_subarea
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.subarea
    ADD CONSTRAINT subarea_pk PRIMARY KEY ( cod_subarea )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.subespecialidad (
    cod_subespecialidad  NUMBER(*, 0) NOT NULL,
    nombre               VARCHAR2(70 CHAR) NOT NULL,
    requisito            VARCHAR2(70 CHAR) NOT NULL,
    experiencia_laboral  NUMBER(*, 0) NOT NULL,
    idioma               VARCHAR2(70 CHAR) NOT NULL,
    cupos                VARCHAR2(70 CHAR) NOT NULL,
    duracion             VARCHAR2(70 CHAR) NOT NULL,
    subarea_cod_subarea  NUMBER(*, 0) NOT NULL,
    modulos              VARCHAR2(200 BYTE) DEFAULT '1' NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
    DEFAULT );

CREATE UNIQUE INDEX c##postulacion.subespecialidad__idx ON
    c##postulacion.subespecialidad (
        subarea_cod_subarea
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        COMPUTE STATISTICS;

CREATE TABLE c##postulacion.titulo (
    cod_titulo                 NUMBER(*, 0) NOT NULL,
    tipo_estudio               VARCHAR2(60 CHAR) NOT NULL,
    institucion                VARCHAR2(70 CHAR) NOT NULL,
    nombre_carrera             VARCHAR2(70 CHAR) NOT NULL,
    fecha_obtencion            DATE NOT NULL,
    postulante_cod_postulante  NUMBER(*, 0) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX c##postulacion.titulo_pk ON
    c##postulacion.titulo (
        cod_titulo
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.titulo
    ADD CONSTRAINT titulo_pk PRIMARY KEY ( cod_titulo )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users
            STORAGE ( PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS UNLIMITED FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT )
        COMPUTE STATISTICS;

ALTER TABLE c##postulacion.complementaria
    ADD CONSTRAINT complementaria_estado_civil_fk FOREIGN KEY ( estado_civil_cod_estado )
        REFERENCES c##postulacion.estado_civil ( cod_estado )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.complementaria
    ADD CONSTRAINT complementaria_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.contacto
    ADD CONSTRAINT contacto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.direccion
    ADD CONSTRAINT direccion_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.direccion
    ADD CONSTRAINT direccion_region_fk FOREIGN KEY ( region_cod_region )
        REFERENCES c##postulacion.region ( cod_region )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.estudios
    ADD CONSTRAINT estudios_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.experiencia_laboral
    ADD CONSTRAINT exp_laboral_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.institucion
    ADD CONSTRAINT institucion_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.linea_investigacion
    ADD CONSTRAINT linea_invest_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.objetivos
    ADD CONSTRAINT objetivos_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.proyecto
    ADD CONSTRAINT proyecto_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.puntaje
    ADD CONSTRAINT puntaje_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.subarea
    ADD CONSTRAINT subarea_institucion_fk FOREIGN KEY ( institucion_cod_institucion )
        REFERENCES c##postulacion.institucion ( cod_institucion )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.subespecialidad
    ADD CONSTRAINT subespecialidad_subarea_fk FOREIGN KEY ( subarea_cod_subarea )
        REFERENCES c##postulacion.subarea ( cod_subarea )
    NOT DEFERRABLE;

ALTER TABLE c##postulacion.titulo
    ADD CONSTRAINT titulo_postulante_fk FOREIGN KEY ( postulante_cod_postulante )
        REFERENCES c##postulacion.postulante ( cod_postulante )
    NOT DEFERRABLE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            16
-- CREATE INDEX                            20
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
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
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
