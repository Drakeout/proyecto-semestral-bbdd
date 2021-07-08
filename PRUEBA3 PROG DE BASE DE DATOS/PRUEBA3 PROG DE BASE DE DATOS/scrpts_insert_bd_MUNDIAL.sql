--
-- Volcado de datos para la tabla jugador
--
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (1, 'Ben', 'Bereton', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (2, 'Alexis', 'Sánchez', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (3, 'Arturo', 'Vidal', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (4, 'Eduardo', 'Vargas', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (5, 'Erick', 'Pulgar', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (6, 'Claudio', 'Bravo', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (7, 'Gary', 'Medel', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (8, 'Jean', 'Meneses', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (9, 'Carlos', 'Palacios Núñez', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (10, 'Guillermo', 'Maripán', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (11, 'Francisco', 'Sierralba', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (12, 'Clemente', 'Montes', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (13, 'Tomás', 'Alarcón', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (14, 'Luciano', 'Arriagada', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (15, 'Charles', 'Aránguiz', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (16, 'Eugenio', 'Mena', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (17, 'Sebastián', 'Vegas', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (18, 'César', 'Pinares', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (19, 'Mauricio', 'Isla', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (20, 'Pablo', 'Galdames', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (21, 'Enzo', 'Roco', 0);
INSERT INTO jugador (id_jugador, nombre_jugador, apellido_jugador, edad_jugador) VALUES (22, 'Luis', 'Antonio Jiménez', 0);

--
-- Volcado de datos para la tabla posicion
--
INSERT INTO posicion (id_posicion, nombre_posicion) VALUES (1, 'DELANTERO');
INSERT INTO posicion (id_posicion, nombre_posicion) VALUES (2, 'MEDIOCAMPISTA');
INSERT INTO posicion (id_posicion, nombre_posicion) VALUES (3, 'ARQUERO');
INSERT INTO posicion (id_posicion, nombre_posicion) VALUES (4, 'DEFENSA');

--
-- Volcado de datos para la tabla ronda
--
INSERT INTO ronda (id_ronda, nro_rona) VALUES (1, 'RONDA 1');
INSERT INTO ronda (id_ronda, nro_rona) VALUES (2, 'RONDA 2');

--
-- Volcado de datos para la tabla arbitro
--
INSERT INTO arbitro (id_arbitro, nombre_arbitro, apellido_arbitro) VALUES (1, 'WILMAR', 'ROLDAN');
INSERT INTO arbitro (id_arbitro, nombre_arbitro, apellido_arbitro) VALUES (2, 'NESTOR', 'PINTANA');
INSERT INTO arbitro (id_arbitro, nombre_arbitro, apellido_arbitro) VALUES (3, 'ROBERTO', 'TOBAR');
INSERT INTO arbitro (id_arbitro, nombre_arbitro, apellido_arbitro) VALUES (4, 'PATRICIO', 'LOUSTAU');

--
-- Volcado de datos para la tabla entrenador
--
INSERT INTO entrenador (id_entrenador, nombre_entrenador, apellido_entrenador) VALUES (1, 'Martín', 'Lasarte');
INSERT INTO entrenador (id_entrenador, nombre_entrenador, apellido_entrenador) VALUES (2, 'Lionel', 'Scaloni');
INSERT INTO entrenador (id_entrenador, nombre_entrenador, apellido_entrenador) VALUES (3, 'Tite', 'A');
INSERT INTO entrenador (id_entrenador, nombre_entrenador, apellido_entrenador) VALUES (4, 'José', 'Peseiro');

--
-- Volcado de datos para la tabla grupo
--
INSERT INTO grupo (id_grupo, nombre_grupo) VALUES (1, 'GRUPO A');
INSERT INTO grupo (id_grupo, nombre_grupo) VALUES (2, 'GRUPO B');

--
-- Volcado de datos para la tabla plantel
--
INSERT INTO plantel (id_plantel, pais_plantel, entrenador_id_entrenador, grupo_id_grupo) VALUES (1, 'CHILE', 1, 1);
INSERT INTO plantel (id_plantel, pais_plantel, entrenador_id_entrenador, grupo_id_grupo) VALUES (2, 'ARGEN', 2, 1) ;
INSERT INTO plantel (id_plantel, pais_plantel, entrenador_id_entrenador, grupo_id_grupo) VALUES (3, 'BRASI', 3, 2);
INSERT INTO plantel (id_plantel, pais_plantel, entrenador_id_entrenador, grupo_id_grupo) VALUES (4, 'VENEZ', 4, 2);

--
-- Volcado de datos para la tabla encuentro
--
INSERT INTO encuentro (id_encuentro, arbitro_id_arbitro, ronda_id_ronda, fecha_encuentro, hora_inicio_encuentro, hora_fin_encuentro, estado_encuentro, nombre_estadio, plantel_id_plantel, plantel_id_plantel1) VALUES (1, 1, 1, '30-06-2021', '30-06-2021', '30-06-2021', 'JUGADO', 'Maracaná', 1, 2);
INSERT INTO encuentro (id_encuentro, arbitro_id_arbitro, ronda_id_ronda, fecha_encuentro, hora_inicio_encuentro, hora_fin_encuentro, estado_encuentro, nombre_estadio, plantel_id_plantel, plantel_id_plantel1) VALUES (2, 2, 1, '30-06-2021', '30-06-2021', '30-06-2021', 'JUGADO', 'Maracaná', 3, 4);
INSERT INTO encuentro (id_encuentro, arbitro_id_arbitro, ronda_id_ronda, fecha_encuentro, hora_inicio_encuentro, hora_fin_encuentro, estado_encuentro, nombre_estadio, plantel_id_plantel, plantel_id_plantel1) VALUES (3, 3, 2, '30-07-2021', '30-06-2021', '30-06-2021', 'PENDIENTE', 'Maracaná', 1, 3);


--
-- Volcado de datos para la tabla seleccionado
--
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (1, 1, 1, 1, 10, 'ACTIVO', 1);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (2, 1, 2, 1, 11, 'ACTIVO', 1);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (3, 1, 3, 1, 12, 'ACTIVO', 2);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (4, 1, 4, 1, 13, 'ACTIVO', 2);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (5, 1, 5, 1, 14, 'ACTIVO', 2);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (6, 1, 6, 1, 15, 'ACTIVO', 3);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (7, 1, 7, 1, 16, 'ACTIVO', 1);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (8, 1, 8, 1, 17, 'ACTIVO', 1);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (9, 1, 9, 1, 18, 'ACTIVO', 2);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (10, 1, 10, 1, 19, 'ACTIVO', 2);
INSERT INTO seleccionado (id_seleccionado, plantel_id_plantel, jugador_id_jugador, encuentro_id_encuentro, nrojugador_seleccionado, estado_seleccionado, posicion_id_posicion) VALUES (11, 1, 11, 1, 20, 'ACTIVO', 2);


--
-- Volcado de datos para la tabla anotacion
--
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (1, 1, 1, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (2, 1, 1, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (3, 1, 1, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (4, 1, 2, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (5, 1, 2, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (6, 1, 3, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (7, 1, 4, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (8, 1, 4, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (9, 1, 4, '30-06-2021', '');
INSERT INTO anotacion (id_anotacion, encuentro_id_encuentro, jugador_id_jugador, hora_anotacion, descripcion_anotacion) VALUES (10, 1, 4, '30-06-2021', '');

--
-- Volcado de datos para la tabla cambio
--
INSERT INTO cambio (id_cambio, jugador_id_jugador, jugador_id_jugador1, hora_cambio, encuentro_id_encuentro) VALUES (1, 1, 12, '30-06-2021', 1);
INSERT INTO cambio (id_cambio, jugador_id_jugador, jugador_id_jugador1, hora_cambio, encuentro_id_encuentro) VALUES (2, 7, 13, '30-06-2021', 1);
INSERT INTO cambio (id_cambio, jugador_id_jugador, jugador_id_jugador1, hora_cambio, encuentro_id_encuentro) VALUES (3, 8, 14, '30-06-2021', 1);

--
-- Volcado de datos para la tabla infraccion
--
INSERT INTO infraccion (id_infraccion, jugador_id_jugador, encuentro_id_encuentro, tarjeta_infraccion, penal_infraccion, expulsion_infraccion, estado_infraccion, hora_infraccion) VALUES (1, 1, 1, 'AMARILLA', 'NO APLICA', 'NO APLICA', 'ACTIVA', '30-06-2021');
INSERT INTO infraccion (id_infraccion, jugador_id_jugador, encuentro_id_encuentro, tarjeta_infraccion, penal_infraccion, expulsion_infraccion, estado_infraccion, hora_infraccion) VALUES (2, 4, 1, 'AMARILLA', 'NO APLICA', 'NO APLICA', 'ACTIVA', '30-06-2021');
INSERT INTO infraccion (id_infraccion, jugador_id_jugador, encuentro_id_encuentro, tarjeta_infraccion, penal_infraccion, expulsion_infraccion, estado_infraccion, hora_infraccion) VALUES (3, 7, 1, 'AMARILLA', 'PENAL', 'NO APLICA', 'ACTIVA', '30-06-2021');
INSERT INTO infraccion (id_infraccion, jugador_id_jugador, encuentro_id_encuentro, tarjeta_infraccion, penal_infraccion, expulsion_infraccion, estado_infraccion, hora_infraccion) VALUES (4, 3, 1, 'AMARILLA', 'PENAL', 'NO APLICA', 'ACTIVA', '30-06-2021');
INSERT INTO infraccion (id_infraccion, jugador_id_jugador, encuentro_id_encuentro, tarjeta_infraccion, penal_infraccion, expulsion_infraccion, estado_infraccion, hora_infraccion) VALUES (5, 11, 1, 'ROJA', 'NO APLICA', 'EXPULSION', 'ACTIVA', '30-06-2021');