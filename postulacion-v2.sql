
select (SUBSTR(run,1,2 )||extract(day from fecha_nacimiento )||SUBSTR(run,3,6 )|| to_char(fecha_nacimiento, 'mon')||'-'||SUBSTR(run, 9,9 )||SUBSTR(extract(year from fecha_nacimiento ), 4,4)) as "Run Postulante",
primer_nombre||' '||apellido_paterno||' '||apellido_materno as "Nombre Postulante",
fecha_postulacion "Fecha Postulación", estado_civil.estado_civil as "Estado Civil", direccion.direccion ||' '|| direccion.comuna||' '||region.region "Dirección",
subespecialidad.nombre as "Subespecilidad a la que Postula", institucion.institucion, 'ciudad' as Ciudad, institucion.pais
from postulante 
inner join direccion on direccion.postulante_cod_postulante = postulante.cod_postulante
inner join region on region.cod_region = direccion.cod_region
inner join complementaria on complementaria.postulante_cod_postulante = postulante.cod_postulante
inner join estado_civil on estado_civil.cod_estado = complementaria.estado_civil
inner join institucion on institucion.postulante_cod_postulante =postulante.cod_postulante
inner join subarea on institucion.cod_institucion = subarea.institucion_cod_institucion 
inner join subespecialidad on subarea.cod_subarea = subespecialidad.subarea_cod_subarea;

