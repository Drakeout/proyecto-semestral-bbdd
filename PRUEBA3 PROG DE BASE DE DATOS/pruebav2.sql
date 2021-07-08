--Encontrar los encuentros de cada jugador
select encuentro.id_encuentro from encuentro
join seleccionado on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
join jugador on jugador.id_jugador = seleccionado.jugador_id_jugador
where jugador.id_jugador = 1;
--Encontrar los equipo por cada encuentro del jugador
select encuentro.plantel_id_plantel, encuentro.plantel_id_plantel1  from encuentro
where encuentro.id_encuentro = 2; --LOOP POR CADA FECHA DE ENCUENTRO
--Buscar los goles de cada equipo del cada encuentro del jugador
--primer equipo LOOP POR CADA EQUIPO DE ARRIBA -> GUARDA EN ARRAY
select count(*) from anotacion
join jugador on jugador. id_jugador = anotacion.jugador_id_jugador
join seleccionado on seleccionado.jugador_id_jugador = jugador.id_jugador
join encuentro on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
join plantel on plantel.id_palntel = encuentro.plantel_id_palntel
where plantel.id_palntel = 1 --AQUI IRIA EL PRIMER EQUIPO
and encuentro.fecha_encuentro = '04/07/21';
--segundo equipo
select count(*) from anotacion
join jugador on jugador. id_jugador = anotacion.jugador_id_jugador
join seleccionado on seleccionado.jugador_id_jugador = jugador.id_jugador
join encuentro on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
join plantel on plantel.id_palntel = encuentro.plantel_id_palntel
where plantel.id_palntel = 4 --AQUI IRIA EL SEGUNDO EQUIPO
and encuentro.fecha_encuentro = '04/07/21';
--===========================================================
declare
    cursor jugadores is 
        select * from jugador;
        
     TYPE tipo_id_encuentros IS TABLE OF 
        encuentro.id_encuentro%type INDEX BY PLS_INTEGER;
        
    tabla_encuentros tipo_id_encuentros;
begin
    for jugador in jugadores
    loop
        select encuentro.id_encuentro 
        BULK COLLECT INTO tabla_encuentros
        from encuentro
        join seleccionado on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
        join jugador on jugador.id_jugador = seleccionado.jugador_id_jugador
        where jugador.id_jugador = jugador.id_jugador;
        
        DBMS_OUTPUT.PUT_LINE('Jugador id: '||jugador.id_jugador);
        
    end loop;
end;
--===========================================================
--TODO:
-- >CALCULAR QUE EQUIPO TIENE MAS GOLES Y VER SI ESE EQUIPO ES DEL JUGADOR
--  >HACER DE ESO UN PROCEDIMIENTO, SOLO PUEDE VOLVER 1 NUMERO
--===========================================================
--Encontrar los encuentros de cada jugador
select encuentro.id_encuentro from encuentro
join seleccionado on encuentro.id_encuentro = seleccionado.encuentro_id_encuentro
join jugador on jugador.id_jugador = seleccionado.jugador_id_jugador
where jugador.id_jugador = 5;

select plantel_id_plantel, plantel_id_plantel1 from encuentro
where id_encuentro = 1 and estado_encuentro = 'JUGADO';
