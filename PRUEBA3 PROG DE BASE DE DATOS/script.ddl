CREATE TABLE anotacion (
    id_anotacion            NUMBER NOT NULL,
    encuentro_id_encuentro  NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL,
    hora_anotacion          DATE NOT NULL,
    descripcion_anotacion   VARCHAR2(100)
);

ALTER TABLE anotacion ADD CONSTRAINT anotacion_pk PRIMARY KEY ( id_anotacion );

CREATE TABLE arbitro (
    id_arbitro        NUMBER NOT NULL,
    nombre_arbitro    VARCHAR2(100),
    apellido_arbitro  VARCHAR2(100)
);

ALTER TABLE arbitro ADD CONSTRAINT arbitro_pk PRIMARY KEY ( id_arbitro );

CREATE TABLE cambio (
    id_cambio               NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL, 
    jugador_id_jugador1     NUMBER NOT NULL,
    hora_cambio             DATE,
    encuentro_id_encuentro  NUMBER NOT NULL
);

ALTER TABLE cambio ADD CONSTRAINT cambio_pk PRIMARY KEY ( id_cambio );

CREATE TABLE encuentro (
    id_encuentro           NUMBER NOT NULL,
    arbitro_id_arbitro     NUMBER NOT NULL,
    ronda_id_ronda         NUMBER NOT NULL,
    fecha_encuentro        DATE,
    hora_inicio_encuentro  DATE,
    hora_fin_encuentro     DATE,
    estado_encuentro       VARCHAR2(30),
    nombre_estadio         VARCHAR2(100) NOT NULL,
    plantel_id_palntel     NUMBER NOT NULL,
    plantel_id_palntel1    NUMBER NOT NULL
);

ALTER TABLE encuentro ADD CONSTRAINT encuentro_pk PRIMARY KEY ( id_encuentro );

CREATE TABLE entrenador (
    id_entrenador        NUMBER NOT NULL,
    nombre_entrenador    VARCHAR2(100) NOT NULL,
    apellido_entrenador  VARCHAR2 (60) NOT NULL
);

ALTER TABLE entrenador ADD CONSTRAINT entrenador_pk PRIMARY KEY ( id_entrenador );

CREATE TABLE grupo (
    id_grupo      NUMBER NOT NULL,
    nombre_grupo  VARCHAR2(60)
);

ALTER TABLE grupo ADD CONSTRAINT grupo_pk PRIMARY KEY ( id_grupo );

CREATE TABLE infraccion (
    id_infraccion           NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL,
    encuentro_id_encuentro  NUMBER NOT NULL,
    tarjeta_infraccion      VARCHAR2(100),
    penal_infraccion        VARCHAR2(100),
    expulsion_infraccion    VARCHAR2(100),
    estado_infraccion       VARCHAR2(100),
    hora_infraccion         DATE NOT NULL
);

ALTER TABLE infraccion ADD CONSTRAINT infraccion_pk PRIMARY KEY ( id_infraccion );

CREATE TABLE jugador (
    id_jugador        NUMBER NOT NULL,
    nombre_jugador    VARCHAR2(100),
    apellido_jugador  VARCHAR2(100),
    edad_jugador      NUMBER
);

ALTER TABLE jugador ADD CONSTRAINT jugador_pk PRIMARY KEY ( id_jugador );

CREATE TABLE plantel (
    id_palntel                NUMBER NOT NULL,
    pais_plantel              VARCHAR2(100) NOT NULL,
    entrenador_id_entrenador  NUMBER NOT NULL,
    grupo_id_grupo            NUMBER NOT NULL
);

ALTER TABLE plantel ADD CONSTRAINT plantel_pk PRIMARY KEY ( id_palntel );

CREATE TABLE posicion (
    id_posicion      NUMBER NOT NULL,
    nombre_posicion  VARCHAR2(100) NOT NULL
);

ALTER TABLE posicion ADD CONSTRAINT posicion_pk PRIMARY KEY ( id_posicion );

CREATE TABLE ranking_jugador (
    id_ranking_jugador  NUMBER NOT NULL,
    ptje_goles          NUMBER NOT NULL,
    ptje_infracciones   NUMBER NOT NULL,
    ptje_cambio         NUMBER NOT NULL,
    ptje_seleccionado   NUMBER NOT NULL,
    ptje_ganados        NUMBER NOT NULL
);

ALTER TABLE ranking_jugador ADD CONSTRAINT ranking_jugador_pk PRIMARY KEY ( id_ranking_jugador );

CREATE TABLE ronda (
    id_ronda  NUMBER NOT NULL,
    nro_rona  VARCHAR2(100)
);

ALTER TABLE ronda ADD CONSTRAINT ronda_pk PRIMARY KEY ( id_ronda );

CREATE TABLE seleccionado (
    id_seleccionado          NUMBER NOT NULL,
    plantel_id_palntel       NUMBER NOT NULL,
    jugador_id_jugador       NUMBER NOT NULL,
    encuentro_id_encuentro   NUMBER NOT NULL,
    nrojugador_seleccionado NUMBER NOT NULL,
    estado_seleccionado      VARCHAR2(100),
    posicion_id_posicion     NUMBER NOT NULL
);

ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_pk PRIMARY KEY ( id_seleccionado );

ALTER TABLE anotacion
    ADD CONSTRAINT anotacion_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro )
        REFERENCES encuentro ( id_encuentro );

ALTER TABLE anotacion
    ADD CONSTRAINT anotacion_jugador_fk FOREIGN KEY ( jugador_id_jugador )
        REFERENCES jugador ( id_jugador );

ALTER TABLE cambio
    ADD CONSTRAINT cambio_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro )
        REFERENCES encuentro ( id_encuentro );

ALTER TABLE cambio
    ADD CONSTRAINT cambio_jugador_fk FOREIGN KEY ( jugador_id_jugador )
        REFERENCES jugador ( id_jugador );

ALTER TABLE cambio
    ADD CONSTRAINT cambio_jugador_fkv2 FOREIGN KEY ( jugador_id_jugador1 )
        REFERENCES jugador ( id_jugador );

ALTER TABLE encuentro
    ADD CONSTRAINT encuentro_arbitro_fk FOREIGN KEY ( arbitro_id_arbitro )
        REFERENCES arbitro ( id_arbitro );

ALTER TABLE encuentro
    ADD CONSTRAINT encuentro_plantel_fk FOREIGN KEY ( plantel_id_palntel )
        REFERENCES plantel ( id_palntel );

ALTER TABLE encuentro
    ADD CONSTRAINT encuentro_plantel_fkv2 FOREIGN KEY ( plantel_id_palntel1 )
        REFERENCES plantel ( id_palntel );

ALTER TABLE encuentro
    ADD CONSTRAINT encuentro_ronda_fk FOREIGN KEY ( ronda_id_ronda )
        REFERENCES ronda ( id_ronda );

ALTER TABLE infraccion
    ADD CONSTRAINT infraccion_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro )
        REFERENCES encuentro ( id_encuentro );

ALTER TABLE infraccion
    ADD CONSTRAINT infraccion_jugador_fk FOREIGN KEY ( jugador_id_jugador )
        REFERENCES jugador ( id_jugador );

ALTER TABLE plantel
    ADD CONSTRAINT plantel_entrenador_fk FOREIGN KEY ( entrenador_id_entrenador )
        REFERENCES entrenador ( id_entrenador );

ALTER TABLE plantel
    ADD CONSTRAINT plantel_grupo_fk FOREIGN KEY ( grupo_id_grupo )
        REFERENCES grupo ( id_grupo );

ALTER TABLE seleccionado
    ADD CONSTRAINT seleccionado_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro )
        REFERENCES encuentro ( id_encuentro );

ALTER TABLE seleccionado
    ADD CONSTRAINT seleccionado_jugador_fk FOREIGN KEY ( jugador_id_jugador )
        REFERENCES jugador ( id_jugador );

ALTER TABLE seleccionado
    ADD CONSTRAINT seleccionado_plantel_fk FOREIGN KEY ( plantel_id_palntel )
        REFERENCES plantel ( id_palntel );

ALTER TABLE seleccionado
    ADD CONSTRAINT seleccionado_posicion_fk FOREIGN KEY ( posicion_id_posicion )
        REFERENCES posicion ( id_posicion );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             30
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
-- ERRORS                                  15
-- WARNINGS                                 0
