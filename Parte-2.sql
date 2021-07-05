--insert postulante
Insert into POSTULANTE (COD_POSTULANTE,APELLIDO_PATERNO,APELLIDO_MATERNO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,RUN,FECHA_NACIMIENTO,NACIONALIDAD,SEXO,PASAPORTE_VISA,FECHA_POSTULACION) 
values (1,'Soto','Tapía','Ignacio','Martin','124327893',to_date('10/10/90','DD/MM/RR'),'chilena','m','234432',to_date('10/10/20','DD/MM/RR'));

Insert into POSTULANTE (COD_POSTULANTE,APELLIDO_PATERNO,APELLIDO_MATERNO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,RUN,FECHA_NACIMIENTO,NACIONALIDAD,SEXO,PASAPORTE_VISA,FECHA_POSTULACION) 
values (2,'Fernandez','Muñoz','Clara','Javiera','134327893',to_date('10/09/93','DD/MM/RR'),'chilena','m','234132',to_date('10/11/20','DD/MM/RR'));

Insert into POSTULANTE (COD_POSTULANTE,APELLIDO_PATERNO,APELLIDO_MATERNO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,RUN,FECHA_NACIMIENTO,NACIONALIDAD,SEXO,PASAPORTE_VISA,FECHA_POSTULACION) 
values (3,'Tapias','Muñoz','Maria','Javiera','134327893',to_date('10/09/92','DD/MM/RR'),'chilena','m','234132',to_date('15/11/20','DD/MM/RR'));

Insert into POSTULANTE (COD_POSTULANTE,APELLIDO_PATERNO,APELLIDO_MATERNO,PRIMER_NOMBRE,SEGUNDO_NOMBRE,RUN,FECHA_NACIMIENTO,NACIONALIDAD,SEXO,PASAPORTE_VISA,FECHA_POSTULACION) 
values (4,'Erazo','Simpson','Michelle',null,'134327893',to_date('31/07/96','DD/MM/RR'),'chilena','m','124132',to_date('15/12/20','DD/MM/RR'));
--inser direccion
Insert into DIRECCION (COD_DIRECCION,COD_REGION,COMUNA,DIRECCION,POSTULANTE_COD_POSTULANTE) values (1,3,'comuna1','siempre viva 32',1);
Insert into DIRECCION (COD_DIRECCION,COD_REGION,COMUNA,DIRECCION,POSTULANTE_COD_POSTULANTE) values (2,1,'comuna2','nunca viva 32',2);
Insert into DIRECCION (COD_DIRECCION,COD_REGION,COMUNA,DIRECCION,POSTULANTE_COD_POSTULANTE) values (3,13,'comuna4','a veces viva 32',3);
Insert into DIRECCION (COD_DIRECCION,COD_REGION,COMUNA,DIRECCION,POSTULANTE_COD_POSTULANTE) values (4,6,'comuna3','regular viva 32',4);


--select sum(case when cod_region = 3 then 1 end),sum(case when cod_region = 11 then 1 end)  from direccion;

--Todas las regiones de chile
Insert into REGION (COD_REGION,REGION) values (1,'Tarapaca');
Insert into REGION (COD_REGION,REGION) values (2,'Antofagasta');
Insert into REGION (COD_REGION,REGION) values (3,'Atacama');
Insert into REGION (COD_REGION,REGION) values (4,'Coquimbo');
Insert into REGION (COD_REGION,REGION) values (5,'Valparaiso');
Insert into REGION (COD_REGION,REGION) values (6,'OHiggins');
Insert into REGION (COD_REGION,REGION) values (7,'Maule');
Insert into REGION (COD_REGION,REGION) values (8,'Biobio');
Insert into REGION (COD_REGION,REGION) values (9,'Araucania');
Insert into REGION (COD_REGION,REGION) values (10,'Lagos');
Insert into REGION (COD_REGION,REGION) values (11,'Aysen');
Insert into REGION (COD_REGION,REGION) values (12,'Magallanes');
Insert into REGION (COD_REGION,REGION) values (13,'Metropolitana');
Insert into REGION (COD_REGION,REGION) values (14,'Los rios');
Insert into REGION (COD_REGION,REGION) values (15,'Arica');
Insert into REGION (COD_REGION,REGION) values (16,'Nuble');


