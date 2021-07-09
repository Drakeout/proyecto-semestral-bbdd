--2.2.2.	DETALLE DE POSTULANTES A LA BECA
SELECT 
    (SUBSTR(run,1,2 )||extract(day FROM fecha_nacimiento )||SUBSTR(run,3,6 )|| to_char(fecha_nacimiento, 'mon')||'-'||SUBSTR(run, 9,9 )||SUBSTR(extract(year FROM fecha_nacimiento ), 4,4)) AS "RUN POSTULANTE",
    primer_nombre||' '||apellido_paterno||' '||apellido_materno AS "NOMBRE POSTULANTE",
    fecha_postulacion "FECHA POSTULACI�N", 
    estado_civil.estado_civil AS "ESTADO CIVIL", 
    direccion.direccion ||' '|| direccion.comuna||' '||region.region "DIRECCI�N",
    subespecialidad.nombre AS "SUBESPECILIDAD a LA QUE POSTULA", 
    institucion.institucion, 
    'ciudad' AS CIUDAD, 
    institucion.pais
FROM postulante 
INNER JOIN direccion ON direccion.postulante_cod_postulante = postulante.cod_postulante
INNER JOIN region ON region.cod_region = direccion.cod_region
INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
INNER JOIN estado_civil ON estado_civil.cod_estado = complementaria.estado_civil
INNER JOIN institucion ON institucion.postulante_cod_postulante =postulante.cod_postulante
INNER JOIN subarea ON institucion.cod_institucion = subarea.institucion_cod_institucion 
inner join subespecialidad on subarea.cod_subarea = subespecialidad.subarea_cod_subarea;

--2.2.3.	PUNTAJES OBTENIDOS POR CADA POSTULANTE A LA BECA
CREATE OR REPLACE VIEW puntajes_objetenidos AS
    SELECT run AS "RUN POSTULANTE",
                    PRIMER_NOMBRE ||' '|| SEGUNDO_NOMBRE ||' '||  APELLIDO_PATERNO ||' '|| APELLIDO_MATERNO AS "NOMBRE POSTULANTE", 
                    TRUNC((months_between(TRUNC(sysdate),to_date(fecha_nacimiento))/12)) AS EDAD,
                    puntaje.ptje_edad AS "PTJE. EDAD",
                    estado_civil.estado_civil AS "Estado Civil",
                    puntaje.ptje_es_civil AS "PTJE. EST.CIVIL",
                    (CASE WHEN complementaria.pueblo_indigena = 1 THEN 'SI' ELSE 'NO' END) AS "PUEBLO IND.ORIG.",
                    puntaje.ptje_pueblo_indigena AS "PTJE. PUEBLO IND.ORIG.",
                    puntaje.ptje_zona_extrema AS "PTJE. ZONA EXTREMA",
                    puntaje.ptje_antec_acad AS "PTJE. ANTEC. ACAD",
                    puntaje.ptje_trayec AS "PTJE. TRAYEC./EXP.LABORAL",
                    puntaje.ptje_docencia AS "PTJE. DOCENCIA/INVEST",
                    puntaje.ptje_estudio AS "PTJE. OBJETIVO ESTUDIO",
                    puntaje.ptje_intereses AS "PTJE. INTERESES",
                    puntaje.ptje_retrib AS "PTJE. RETRIB",
                    puntaje.ptje_ranking AS "PTJE. RANKING INT.EDUC.EXTRANJERA",
                    puntaje.ptje_total AS "PTJE. TOTAL"
        FROM postulante
            INNER JOIN puntaje ON puntaje.postulante_cod_postulante = postulante.cod_postulante
            INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
            INNER JOIN estado_civil ON estado_civil.cod_estado = complementaria.estado_civil
        ORDER BY postulante.apellido_paterno DESC;
--3.2 
-->3.2.1.UN PACKAGE que contenga como mínimo 4 funciones públicas y 4 variables públicas:
--->FUNCIONES
    --3.2.1.1 nombre de la institución de educación extranjera elegida por el postulante
        CREATE OR REPLACE FUNCTION institucion_nombre
                (id_postu postulante.cod_postulante%TYPE) 
            RETURN VARCHAR 
            IS
                nombre_institucion VARCHAR(60) := '';
            BEGIN
                SELECT 
                    INSTITUCION
                INTO
                    nombre_institucion
                FROM INSTITUCION 
                    INNER JOIN postulante ON institucion.postulante_cod_postulante = postulante.cod_postulante
                WHERE postulante.cod_postulante = id_postu;
                IF nombre_institucion is NULL 
                    THEN nombre_institucion := 'Ninguno';
                END IF;
                RETURN nombre_institucion;
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    nombre_institucion:= 'Ninguno';
                    RETURN nombre_institucion;

            END institucion_nombre;
    --3.2.1.2. descripción del estado civil del postulante. 
        CREATE OR REPLACE FUNCTION desc_estado_civil
                (id_postu postulante.cod_postulante%TYPE) 
            RETURN VARCHAR 
            IS
                desc_estado VARCHAR(70) := '';
            BEGIN
                SELECT 
                    estado_civil.estado_civil
                INTO
                    desc_estado
                FROM postulante 
                    INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
                    INNER JOIN estado_civil ON estado_civil.cod_estado = complementaria.estado_civil
                WHERE postulante.cod_postulante = id_postu;
                RETURN desc_estado;
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    desc_estado:= 'Ninguno';
                    RETURN desc_estado;

            END desc_estado_civil;
    --3.2.1.3. pueblo indígena u originario al que pertenece el postulante.
        CREATE OR REPLACE FUNCTION pueblo_orig
                (id_postu postulante.cod_postulante%TYPE) 
            RETURN VARCHAR 
            IS
                pueblo_ori VARCHAR(70) := '';
            BEGIN
                SELECT 
                    PUEBLO_DESC
                INTO
                    pueblo_ori
                FROM postulante 
                    INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
                WHERE postulante.cod_postulante = id_postu;
                IF pueblo_ori is NULL 
                    THEN pueblo_ori := 'Ninguno';
                END IF;
                RETURN pueblo_ori;
            EXCEPTION 
                WHEN NO_DATA_FOUND THEN
                    pueblo_ori:= 'Ninguno';
                    RETURN pueblo_ori;

            END pueblo_orig;
    --3.2.1.4. zona extrema en la que vive el postulante.
        CREATE OR REPLACE FUNCTION zona_extrema
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    zona_extr VARCHAR(70) := '';
                    
                BEGIN
                    --TODO: hacer la seleccion de regiones según documento
                    SELECT 
                        region
                    INTO
                        zona_extr
                    FROM region 
                        INNER JOIN direccion ON direccion.cod_region = region.cod_region
                        INNER JOIN postulante ON direccion.postulante_cod_postulante = postulante.cod_postulante                    
                    WHERE postulante.cod_postulante = id_postu;

                    IF zona_extr NOT IN ('Tarapaca', 'Arica', 'Aysem', 'Magallanes')
                        THEN zona_extr := 'Ninguno';
                    END IF;
                    RETURN zona_extr;

                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        zona_extr:= 'Ninguno';
                        RETURN zona_extr;

                END zona_extrema;


    --3.2.2.	TRES FUNCIONES ALMACENADAS:
        -- 3.2.2.1.	Una función almacenada que permita obtener el puntaje por la institución de educación extranjera elegida por el postulante.
        CREATE OR REPLACE FUNCTION puntaje_institucion 
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    ptje_institucion NUMBER := 0;
                    
                BEGIN
                    --TODO: hacer la seleccion de regiones según documento
                    SELECT 
                        ranking
                    INTO
                        ptje_institucion
                    FROM institucion 
                        INNER JOIN postulante ON institucion.postulante_cod_postulante = postulante.cod_postulante    
                    WHERE postulante.cod_postulante = id_postu;

                    IF ptje_institucion BETWEEN 1 AND 10
                        THEN ptje_institucion := 5;
                    ELSIF ptje_institucion BETWEEN 11 AND 20
                        THEN ptje_institucion := 4;
                    ELSIF ptje_institucion BETWEEN 21 AND 30
                        THEN ptje_institucion := 3;
                    ELSIF ptje_institucion BETWEEN 31 AND 50
                        THEN ptje_institucion := 2;
                    ELSIF ptje_institucion BETWEEN 51 AND 100
                        THEN ptje_institucion := 1;
                    ELSE 
                        ptje_institucion:= 0;
                    END IF;
                    RETURN ptje_institucion;
                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        ptje_institucion:= 0;
                        RETURN ptje_institucion;

                END puntaje_institucion;

        -- 3.2.2.2.	Una función almacenada que permita obtener el puntaje por la edad del postulante.
        CREATE OR REPLACE FUNCTION puntaje_edad
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    ptje_edad NUMBER := 0;
                    
                BEGIN
                    --TODO: hacer la seleccion de regiones según documento
                    SELECT 
                        TRUNC((months_between(TRUNC(sysdate),to_date(fecha_nacimiento))/12))
                    INTO
                        ptje_edad
                    FROM postulante 
                    WHERE postulante.cod_postulante = id_postu;

                    IF ptje_edad > 40 
                        THEN ptje_edad := 1;
                    ELSIF ptje_edad BETWEEN 30 AND 40
                        THEN ptje_edad := 3;
                    ELSIF ptje_edad < 30
                        THEN ptje_edad  := 5;
                    ELSE ptje_edad := 0;
                    END IF;

                    RETURN ptje_edad;

                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        ptje_edad:= 0;
                        RETURN ptje_edad;

                END puntaje_edad;
        -- 3.2.2.3.	Una función almacenada que permita obtener el puntaje por trayectoria y experiencia laboral del postulante
        CREATE OR REPLACE FUNCTION puntaje_trayectoria
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    ptje_trayec NUMBER := 0;
                    
                BEGIN
                    --TODO: hacer la seleccion de regiones según documento
                    SELECT 
                        TRUNC((months_between(TRUNC(FECHA_TERMINO),to_date(FECHA_INICIO))/12))
                    INTO
                        ptje_trayec
                    FROM EXPERIENCIA_LABORAL
                        INNER JOIN postulante ON postulante.COD_POSTULANTE = EXPERIENCIA_LABORAL.POSTULANTE_COD_POSTULANTE
                    WHERE postulante.cod_postulante = id_postu;

                    IF ptje_trayec > 5 
                        THEN ptje_trayec := 5;
                    ELSIF ptje_trayec = 5
                        THEN ptje_trayec := 4;
                    ELSIF ptje_trayec = 4
                        THEN ptje_trayec  := 3;
                    ELSIF ptje_trayec = 3
                        THEN ptje_trayec  := 2;
                    ELSIF ptje_trayec = 2
                        THEN ptje_trayec  := 1;
                    ELSE ptje_trayec := 0;
                    END IF;

                    RETURN ptje_trayec;

                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        ptje_trayec:= 0;
                        RETURN ptje_trayec;

                END puntaje_trayectoria;
        --antecedentes academicos
        CREATE OR REPLACE FUNCTION antecedentes_academicos
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    ptje_antecedentes NUMBER := 0;
                    
                BEGIN
                    SELECT 
                        PROMEDIO_NOTA
                    INTO
                        ptje_antecedentes
                    FROM estudios
                        INNER JOIN postulante ON postulante.COD_POSTULANTE = estudios.POSTULANTE_COD_POSTULANTE
                    WHERE postulante.cod_postulante = id_postu;

                    IF ptje_antecedentes BETWEEN 66 AND 70 
                        THEN ptje_antecedentes := 5;
                    ELSIF ptje_antecedentes BETWEEN 60 AND 65
                        THEN ptje_antecedentes := 4;
                    ELSIF ptje_antecedentes BETWEEN 55 AND 59
                        THEN ptje_antecedentes := 3;
                    ELSIF ptje_antecedentes BETWEEN 52 AND 54
                        THEN ptje_antecedentes := 2;
                    ELSIF ptje_antecedentes BETWEEN 50 AND 51
                        THEN ptje_antecedentes := 1;
                    ELSE ptje_antecedentes := 0;
                    END IF;

                    RETURN ptje_antecedentes;

                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        ptje_antecedentes:= 0;
                        RETURN ptje_antecedentes;

                END antecedentes_academicos;
        --docencencia
        CREATE OR REPLACE FUNCTION docencencia_invest_puntaje
                    (id_postu postulante.cod_postulante%TYPE) 
                RETURN VARCHAR 
                IS
                    ptje_docencencia NUMBER := 0;
                    
                BEGIN
                    SELECT 
                        (
                            (SELECT count(*) FROM EXPERIENCIA_LABORAL
                                INNER JOIN postulante ON postulante.COD_POSTULANTE = EXPERIENCIA_LABORAL.POSTULANTE_COD_POSTULANTE
                                WHERE TIPO_EXPERENCIA = 'ACADEMICA' 
                                AND postulante.cod_postulante = id_postu)
                                +
                            (SELECT count(*) FROM LINEA_INVESTIGACION
                                INNER JOIN postulante ON postulante.COD_POSTULANTE = LINEA_INVESTIGACION.POSTULANTE_COD_POSTULANTE)
                        )       
                    INTO
                        ptje_docencencia
                    FROM EXPERIENCIA_LABORAL
                        INNER JOIN postulante ON postulante.COD_POSTULANTE = EXPERIENCIA_LABORAL.POSTULANTE_COD_POSTULANTE
                    WHERE postulante.cod_postulante = id_postu;

                    IF ptje_docencencia > 5
                        THEN ptje_docencencia := 5;
                    ELSIF ptje_docencencia = 5 
                        THEN ptje_docencencia := 3;
                    ELSIF ptje_docencencia < 5 
                        THEN ptje_docencencia := 2;
                    ELSE ptje_docencencia := 0;
                    END IF;

                    RETURN ptje_docencencia;

                EXCEPTION 
                    WHEN NO_DATA_FOUND THEN
                        ptje_docencencia:= 0;
                        RETURN ptje_docencencia;

                END docencencia_puntaje;

--DEBUG          
SET SERVEROUTPUT ON;
DECLARE
    cod_postu NUMBER :=2;

    c_nombre varchar(60) := 'nulin';
    c_estado varchar(70) := 'nulin';
    c_pueblo varchar(70) := 'nulin';
    c_region varchar(70) := 'nulin';
    ptje_institucion number;
    ptje_edad number;
    ptje_trayectoria number;
    ptje_antec_acad number;
    ptje_doc_inve number;

BEGIN
    c_nombre := institucion_nombre(cod_postu);
    c_estado := desc_estado_civil(cod_postu);
    c_pueblo := pueblo_orig(cod_postu);
    c_region := zona_extrema(cod_postu);
    ptje_institucion := puntaje_institucion(cod_postu);
    ptje_edad := puntaje_edad(cod_postu);
    ptje_trayectoria := puntaje_trayectoria(cod_postu);
    ptje_antec_acad := antecedentes_academicos(cod_postu);
    ptje_doc_inve := docencencia_invest_puntaje(cod_postu);
    DBMS_OUTPUT.PUT_LINE(c_nombre);
    DBMS_OUTPUT.PUT_LINE(c_estado);
    DBMS_OUTPUT.PUT_LINE(c_pueblo);
    DBMS_OUTPUT.PUT_LINE(c_region);
    DBMS_OUTPUT.PUT_LINE(ptje_institucion);
    DBMS_OUTPUT.PUT_LINE(ptje_edad);
    DBMS_OUTPUT.PUT_LINE(ptje_trayectoria);
    DBMS_OUTPUT.PUT_LINE(ptje_antec_acad);
    DBMS_OUTPUT.PUT_LINE(ptje_doc_inve);
END;


--============================================================
--++++                          PRUEBAS                   ++++
--============================================================

SELECT estado_civil.estado_civil FROM postulante     
INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
INNER JOIN estado_civil ON estado_civil.cod_estado = complementaria.estado_civil
WHERE postulante.cod_postulante = 1;

SELECT pueblo_indigena FROM postulante
INNER JOIN complementaria ON complementaria.postulante_cod_postulante = postulante.cod_postulante
WHERE postulante.cod_postulante = 2;
 
SELECT region FROM region
INNER JOIN direccion ON direccion.cod_region = region.cod_region
INNER JOIN postulante ON direccion.postulante_cod_postulante = postulante.cod_postulante
WHERE postulante.cod_postulante = 1;

SELECT ranking FROM institucion
INNER JOIN postulante ON institucion.postulante_cod_postulante = postulante.cod_postulante
WHERE postulante.cod_postulante = 1;

SELECT count(*) FROM EXPERIENCIA_LABORAL
INNER JOIN postulante ON postulante.COD_POSTULANTE = EXPERIENCIA_LABORAL.POSTULANTE_COD_POSTULANTE
WHERE postulante.cod_postulante = 1
AND TIPO_EXPERENCIA = 'ACADEMICA' ;
