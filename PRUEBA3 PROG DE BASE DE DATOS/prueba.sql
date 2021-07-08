--GOLES ANOTADO POR JUGADOR
create or replace FUNCTION goles_jugador
(id_jug jugador.id_jugador%TYPE) RETURN NUMBER IS
goles_anotados NUMBER :=0;
BEGIN
    SELECT COUNT(*) INTO goles_anotados FROM ANOTACION 
    JOIN jugador ON jugador.id_jugador = anotacion.jugador_id_jugador
    WHERE jugador.id_jugador = id_jug;
    RETURN goles_anotados;
END goles_jugador;

--INFRACIONES POR JUGADOR
CREATE OR REPLACE FUNCTION infracciones_jugador
(id_jug jugador.id_jugador%TYPE) RETURN NUMBER IS
cant_infraccion NUMBER :=0;
BEGIN
    SELECT COUNT(*) INTO cant_infraccion FROM INFRACCION
    JOIN JUGADOR ON jugador.id_jugador = infraccion.jugador_id_jugador
    WHERE jugador.id_jugador = id_jug;
    RETURN cant_infraccion;
END infracciones_jugador;


--CAMBIOS POR JUGADOR
SELECT COUNT(*) FROM CAMBIO
JOIN JUGADOR ON cambio.jugador_id_jugador = jugador.id_jugador
WHERE jugador.id_jugador = 8;

CREATE OR REPLACE FUNCTION cambios_jugador
(id_jug jugador.id_jugador%TYPE) RETURN NUMBER IS
cant_cambios NUMBER :=0;
BEGIN
    SELECT COUNT(*) INTO cant_cambios FROM CAMBIO
    JOIN JUGADOR ON cambio.jugador_id_jugador = jugador.id_jugador
    WHERE jugador.id_jugador = id_jug;
    RETURN cant_cambios;
END cambios_jugador;


--Procedimiento de ver cuantas veces el jugador fue seleccionado
CREATE OR REPLACE PROCEDURE veces_seleccionado 
(id_jugador in jugador.id_jugador%type,
cant_seleccionado out number) as    
begin 
    cant_seleccionado :=0;
    select count(*) into cant_seleccionado from seleccionado where jugador_id_jugador = id_jugador;
end;
--Procedimiento de ver cuanto partidos ganó el jugador
create or replace PROCEDURE partidos_ganados 
(id_jug in jugador.id_jugador%type,
cant_ganados out number
) is
    TYPE tipo_encuentros IS TABLE OF 
        encuentro.id_encuentro%TYPE
            INDEX BY PLS_INTEGER;

    tabla_encuentros tipo_encuentros;

    plantel_jugador NUMBER;

    equipo1 NUMBER;
    equipo2 NUMBER;
    goles_equipo1 NUMBER;
    goles_equipo2 NUMBER;
    equipo_ganador NUMBER;
BEGIN 
--Loop de todos los jugadores
    cant_ganados := 0;
    --guardar los id de encuentro en que estuvo
    select encuentro.id_encuentro BULK COLLECT INTO tabla_encuentros from encuentro
    join seleccionado on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
    join jugador  jd on jd.id_jugador = seleccionado.jugador_id_jugador
    where jd.id_jugador = id_jug;
    
    if tabla_encuentros.COUNT >= 1 THEN
        FOR indx IN 1 .. tabla_encuentros.COUNT
        --se podrÃ­a descartar antes del for a los jugadores que no tengan partidos
            LOOP
                    --ver los planteles del encuentro
                SELECT plantel_id_plantel, plantel_id_plantel1 INTO equipo1, equipo2 
                FROM encuentro where id_encuentro = tabla_encuentros(indx);
                --goles plantel 1 
                select count(*) INTO goles_equipo1 from anotacion 
                join encuentro on encuentro.id_encuentro = anotacion.encuentro_id_encuentro
                join plantel on encuentro.plantel_id_plantel = plantel.id_plantel
                where plantel.id_plantel = equipo1;
                -- goles plantel 2
                select count(*) INTO goles_equipo2 from anotacion 
                join encuentro on encuentro.id_encuentro = anotacion.encuentro_id_encuentro
                join plantel on encuentro.plantel_id_plantel = plantel.id_plantel
                where plantel.id_plantel = equipo2;
                --Ver equipo con mas goles y ganador
                IF goles_equipo1 > goles_equipo2 THEN 
                    equipo_ganador := equipo1;
                ELSIF goles_equipo1 < goles_equipo2 THEN
                    equipo_ganador := equipo2;
                END IF;
                --selecionar el plantel del jugador
                SELECT plantel.id_plantel INTO plantel_jugador FROM plantel
                    join seleccionado on seleccionado.plantel_id_plantel = plantel.id_plantel
                    join jugador on seleccionado.jugador_id_jugador = jugador.id_jugador
                    join encuentro on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
                    where jugador.id_jugador = id_jug
                    and encuentro.id_encuentro = tabla_encuentros(indx);
                --Ver si plantel del jugador es el ganador y anotar la victoria 
                IF plantel_jugador = equipo_ganador THEN
                    cant_ganados := cant_ganados + 1;
                END IF;
            END LOOP;
        ELSE
            cant_ganados :=0;
        END IF;
END;


--BLOQUE PRINCIPAL
SET SERVEROUTPUT ON;
declare
    CURSOR jugadores IS
        SELECT * FROM jugador;

    v_seleccionado number;
    c_ganados number;
    c_goles number;
    c_infracciones number;
    c_cambios number;
begin
    FOR jugador IN JUGADORES 
        LOOP
            partidos_ganados(jugador.id_jugador, c_ganados);
            VECES_SELECCIONADO(jugador.id_jugador, v_seleccionado);
            c_goles := goles_jugador(jugador.id_jugador);
            c_infracciones := infracciones_jugador(jugador.id_jugador);
            c_cambios := cambios_jugador(jugador.id_jugador);
            
                       
            DBMS_OUTPUT.PUT_LINE('Nombre: '||jugador.nombre_jugador||' '||jugador.apellido_jugador);
            DBMS_OUTPUT.PUT_LINE('N* veces seleccionado: ' ||v_seleccionado);
            DBMS_OUTPUT.PUT_LINE('N* partidos ganados: ' ||c_ganados);
            DBMS_OUTPUT.PUT_LINE('N* Goles: ' ||c_goles);
            DBMS_OUTPUT.PUT_LINE('N* infracciones: ' ||c_infracciones);
            DBMS_OUTPUT.PUT_LINE('N* cambios: ' ||c_cambios);
            DBMS_OUTPUT.PUT_LINE('===============');
        END LOOP;
end;