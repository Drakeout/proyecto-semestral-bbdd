CREATE OR REPLACE PROCEDURE partidos_ganados 
(id_jugador in jugador.id_jugador%type,
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
    join jugador on jugador.id_jugador = seleccionado.jugador_id_jugador
    where jugador.id_jugador =id_jugador;

    if tabla_encuentros.COUNT >= 1 THEN
        FOR indx IN 1 .. tabla_encuentros.COUNT
        --se podría descartar antes del for a los jugadores que no tengan partidos
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
                    where jugador.id_jugador = id_jugador
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

