DROP TABLE anotacion CASCADE CONSTRAINTS;
DROP TABLE arbitro CASCADE CONSTRAINTS;
DROP TABLE cambio CASCADE CONSTRAINTS;
DROP TABLE encuentro CASCADE CONSTRAINTS;
DROP TABLE entrenador CASCADE CONSTRAINTS;
DROP TABLE grupo CASCADE CONSTRAINTS;
DROP TABLE infraccion CASCADE CONSTRAINTS;
DROP TABLE jugador CASCADE CONSTRAINTS;
DROP TABLE plantel CASCADE CONSTRAINTS;
DROP TABLE posicion CASCADE CONSTRAINTS;
DROP TABLE ranking_jugador CASCADE CONSTRAINTS;
DROP TABLE ronda CASCADE CONSTRAINTS;
DROP TABLE seleccionado CASCADE CONSTRAINTS;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla anotacion
--

CREATE TABLE anotacion (
    id_anotacion            NUMBER NOT NULL,
    encuentro_id_encuentro  NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL,
    hora_anotacion          DATE NOT NULL,
    descripcion_anotacion   VARCHAR2(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla arbitro 
--

CREATE TABLE arbitro  (
    id_arbitro          NUMBER NOT NULL,
    nombre_arbitro    VARCHAR2(100),
    apellido_arbitro  VARCHAR2(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla cambio 
--

CREATE TABLE cambio  (
    id_cambio               NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL,
    jugador_id_jugador1     NUMBER NOT NULL,
    hora_cambio             DATE,
    encuentro_id_encuentro  NUMBER NOT NULL
);

-- --------------------------------------------------------


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla encuentro
--

CREATE TABLE encuentro (
    id_encuentro           NUMBER NOT NULL,
    arbitro_id_arbitro     NUMBER NOT NULL,
    ronda_id_ronda         NUMBER NOT NULL,
    fecha_encuentro        DATE,
    hora_inicio_encuentro  DATE,
    hora_fin_encuentro     DATE,
    estado_encuentro       VARCHAR2(100) NOT NULL,
    nombre_estadio         VARCHAR2(100) NOT NULL,
    plantel_id_plantel     NUMBER NOT NULL,
    plantel_id_plantel1    NUMBER NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla entrenador
--

CREATE TABLE entrenador (
    id_entrenador        NUMBER NOT NULL,
    nombre_entrenador    VARCHAR2(100) NOT NULL,
    apellido_entrenador  VARCHAR2(100) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla grupo
--

CREATE TABLE grupo (
    id_grupo      NUMBER NOT NULL,
    nombre_grupo  VARCHAR2(100) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla infraccion
--

CREATE TABLE infraccion (
    id_infraccion           NUMBER NOT NULL,
    jugador_id_jugador      NUMBER NOT NULL,
    encuentro_id_encuentro  NUMBER NOT NULL,
    tarjeta_infraccion      VARCHAR2(100),
    penal_infraccion        VARCHAR2(100),
    expulsion_infraccion    VARCHAR2(100),
    estado_infraccion       VARCHAR2(100) NOT NULL,
    hora_infraccion         DATE NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla jugador
--

CREATE TABLE jugador (
    id_jugador        NUMBER NOT NULL,
    nombre_jugador    VARCHAR2(100),
    apellido_jugador  VARCHAR2(100),
    edad_jugador      NUMBER
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla plantel
--

CREATE TABLE plantel (
    id_plantel                NUMBER NOT NULL,
    pais_plantel              VARCHAR2(100) NOT NULL,
    entrenador_id_entrenador  NUMBER NOT NULL,
    grupo_id_grupo            NUMBER NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla posicion
--

CREATE TABLE posicion (
    id_posicion      NUMBER NOT NULL,
    nombre_posicion  VARCHAR2(100) NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla ranking_jugador
--

CREATE TABLE ranking_jugador (
    id_ranking_jugador  NUMBER NOT NULL,
    ptje_goles          NUMBER NOT NULL,
    ptje_infracciones   NUMBER NOT NULL,
    ptje_cambio         NUMBER NOT NULL,
    ptje_seleccionado   NUMBER NOT NULL,
    ptje_ganados        NUMBER NOT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla ronda
--

CREATE TABLE ronda (
    id_ronda  NUMBER NOT NULL,
    nro_rona  VARCHAR2(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla seleccionado
--

CREATE TABLE seleccionado (
    id_seleccionado          NUMBER NOT NULL,
    plantel_id_plantel       NUMBER NOT NULL,
    jugador_id_jugador       NUMBER NOT NULL,
    encuentro_id_encuentro   NUMBER NOT NULL,
    nrojugador_seleccionado  NUMBER NOT NULL,
    estado_seleccionado      VARCHAR2(100),
    posicion_id_posicion     NUMBER NOT NULL
);

--
-- Índices para tablas volcadas
--
ALTER TABLE anotacion ADD CONSTRAINT anotacion_pk PRIMARY KEY ( id_anotacion );
ALTER TABLE arbitro ADD CONSTRAINT arbitro_pk PRIMARY KEY ( id_arbitro );
ALTER TABLE cambio ADD CONSTRAINT cambio_pk PRIMARY KEY ( id_cambio );
ALTER TABLE encuentro ADD CONSTRAINT encuentro_pk PRIMARY KEY ( id_encuentro );
ALTER TABLE entrenador ADD CONSTRAINT entrenador_pk PRIMARY KEY ( id_entrenador );
ALTER TABLE grupo ADD CONSTRAINT grupo_pk PRIMARY KEY ( id_grupo );
ALTER TABLE infraccion ADD CONSTRAINT infraccion_pk PRIMARY KEY ( id_infraccion );
ALTER TABLE jugador ADD CONSTRAINT jugador_pk PRIMARY KEY ( id_jugador );
ALTER TABLE plantel ADD CONSTRAINT plantel_pk PRIMARY KEY ( id_plantel );
ALTER TABLE posicion ADD CONSTRAINT posicion_pk PRIMARY KEY ( id_posicion );
ALTER TABLE ranking_jugador ADD CONSTRAINT ranking_jugador_pk PRIMARY KEY ( id_ranking_jugador );
ALTER TABLE ronda ADD CONSTRAINT ronda_pk PRIMARY KEY ( id_ronda );
ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_pk PRIMARY KEY ( id_seleccionado );

ALTER TABLE anotacion ADD CONSTRAINT anotacion_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro ) REFERENCES encuentro ( id_encuentro );
ALTER TABLE anotacion ADD CONSTRAINT anotacion_jugador_fk FOREIGN KEY ( jugador_id_jugador ) REFERENCES jugador ( id_jugador );
ALTER TABLE cambio ADD CONSTRAINT cambio_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro ) REFERENCES encuentro ( id_encuentro );
ALTER TABLE cambio ADD CONSTRAINT cambio_jugador_fk FOREIGN KEY ( jugador_id_jugador ) REFERENCES jugador ( id_jugador );
ALTER TABLE cambio ADD CONSTRAINT cambio_jugador_fkv2 FOREIGN KEY ( jugador_id_jugador1 ) REFERENCES jugador ( id_jugador );
ALTER TABLE encuentro ADD CONSTRAINT encuentro_arbitro_fk FOREIGN KEY ( arbitro_id_arbitro ) REFERENCES arbitro ( id_arbitro );
ALTER TABLE encuentro ADD CONSTRAINT encuentro_plantel_fk FOREIGN KEY ( plantel_id_plantel ) REFERENCES plantel ( id_plantel );
ALTER TABLE encuentro ADD CONSTRAINT encuentro_plantel_fkv2 FOREIGN KEY ( plantel_id_plantel1 ) REFERENCES plantel ( id_plantel );
ALTER TABLE encuentro ADD CONSTRAINT encuentro_ronda_fk FOREIGN KEY ( ronda_id_ronda ) REFERENCES ronda ( id_ronda );
ALTER TABLE infraccion ADD CONSTRAINT infraccion_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro ) REFERENCES encuentro ( id_encuentro );
ALTER TABLE infraccion ADD CONSTRAINT infraccion_jugador_fk FOREIGN KEY ( jugador_id_jugador ) REFERENCES jugador ( id_jugador );
ALTER TABLE plantel ADD CONSTRAINT plantel_entrenador_fk FOREIGN KEY ( entrenador_id_entrenador ) REFERENCES entrenador ( id_entrenador );
ALTER TABLE plantel ADD CONSTRAINT plantel_grupo_fk FOREIGN KEY ( grupo_id_grupo ) REFERENCES grupo ( id_grupo );
ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_encuentro_fk FOREIGN KEY ( encuentro_id_encuentro ) REFERENCES encuentro ( id_encuentro );
ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_jugador_fk FOREIGN KEY ( jugador_id_jugador ) REFERENCES jugador ( id_jugador );
ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_plantel_fk FOREIGN KEY ( plantel_id_plantel ) REFERENCES plantel ( id_plantel );
ALTER TABLE seleccionado ADD CONSTRAINT seleccionado_posicion_fk FOREIGN KEY ( posicion_id_posicion ) REFERENCES posicion ( id_posicion );
