/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_ASIG_X_COORD                                               
 * OBJETIVO  : Lista asignaturas aperturadas de acuerdo al periodo actual              
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------                                
 *     INFORMACI?:                                                          
 *     AUTOR: TAKESHI FARRO HINOSHITA                                 
 *---------------------------------------------------------------------------*/
create or replace package PAC_CURSOR is
  --Creating REF CURSOR type
  type g_cursor is ref cursor;

  --Procedure that return the cursor
  procedure LISTAR_ASIG_X_COORD(
    p_IDCoordinador     in     docente.id_usuario%type,
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor); -- Our cursor

end PAC_CURSOR;
/
create or replace package body PAC_CURSOR is
  procedure LISTAR_ASIG_X_COORD(
    p_IDCoordinador     in     docente.id_usuario%type,
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor) is

       begin
        --Opening the cursor to return matched rows
        open o_cursor for
          select asignatura_aperturada.id_asig_aperturada, asignatura.nombre as asig_nombre, plan_de_estudio.nombre as plan_nombre,
		  syllabus.estado as estado_syllabus
          from asignatura_aperturada
          JOIN dbsegsyl.asignatura ON ( asignatura.ID_ASIGNATURA = asignatura_aperturada.ID_ASIGNATURA)
          JOIN dbsegsyl.plan_de_estudio ON ( plan_de_estudio.ID_PLAN_ESTUDIO = asignatura.ID_PLAN_ESTUDIO)
		  JOIN dbsegsyl.syllabus ON (syllabus.id_asig_aperturada = asignatura_aperturada.id_asig_aperturada)
     WHERE id_coordinador = p_idcoordinador
       AND id_periodo     = p_idperiodo
       ORDER BY asignatura.codigo; 

  end LISTAR_ASIG_X_COORD;
end PAC_CURSOR;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : Listar_Grupos                                             
 * OBJETIVO  : Lista grupos del periodo actual              
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------                                
 *     INFORMACI?:                                                          
 *     AUTOR: TAKESHI FARRO HINOSHITA                                 
 *---------------------------------------------------------------------------*/
create or replace package PAC_CURSOR_LISTAR_GRUPOS is
  --Creating REF CURSOR type
  type g_cursor is ref cursor;

  --Procedure that return the cursor
  procedure LISTAR_GRUPOS(
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor); -- Our cursor

end PAC_CURSOR_LISTAR_GRUPOS;
/
create or replace package body PAC_CURSOR_LISTAR_GRUPOS is
  procedure LISTAR_GRUPOS(
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor) is

       begin
        --Opening the cursor to return matched rows
        open o_cursor for
          select grupo.id_grupo as id_grupo, grupo.numero as grupo_numero, asignatura.nombre as asig_nombre
          from grupo
          JOIN dbsegsyl.asignatura_aperturada ON ( asignatura_aperturada.ID_ASIG_APERTURADA = grupo.ID_ASIG_APERTURADA)
          JOIN dbsegsyl.asignatura ON ( asignatura.ID_ASIGNATURA = asignatura_aperturada.ID_ASIGNATURA)
     WHERE id_periodo     = p_idperiodo;

  end LISTAR_GRUPOS;
end PAC_CURSOR_LISTAR_GRUPOS;
/

/*--------------------------------------------------------------------------*/
/* NOMBRE    : DEVUELVE_NOMBRE_ASIG_APER                                            	*/
/* OBJETIVO  : RETORNA EL NOMBRE DE UNA ASIGNATURA POR SU ID      */
/* FECHA MODIFICACION : 11/11/2016 7:30pm
/*--------------------------------------------------------------------------*/                                
/*     INFORMACION:                                                          */
/*     AUTOR: TAKESHI FARRO HINOSHITA                                 */
/*---------------------------------------------------------------------------*/
CREATE OR REPLACE FUNCTION DBSEGSYL.DEVUELVE_NOMBRE_ASIG_APER(
	COD 	IN VARCHAR2
)
RETURN VARCHAR2 IS VNOMBRE VARCHAR2(200);
BEGIN
		SELECT ASIG.NOMBRE
		  INTO VNOMBRE
		  FROM ASIGNATURA_APERTURADA ASIG_APERTURADA
		  JOIN ASIGNATURA ASIG ON (ASIG_APERTURADA.ID_ASIGNATURA = ASIG.ID_ASIGNATURA)
		 WHERE ID_ASIG_APERTURADA = TO_NUMBER(COD);  

	RETURN VNOMBRE;
EXCEPTION 
	WHEN OTHERS THEN 
		RETURN NULL;
END;
/

create or replace PROCEDURE REG_REF_BIBLIO
/*---------------------------------------------------------------------------*/
/* Nombre    : REG_REF_BIBLIO       		                             */
/* Objetivo  : Inserta un registro en la tabla REFERENCIA_BIBLIOGRAFICA      */
/*---------------------------------------------------------------------------*/                                
/*     Informacion:                                                          */
/*     Autor: Thalia Quiroz Guzman                                           */
/*---------------------------------------------------------------------------*/

   (TITULO		REFERENCIA_BIBLIOGRAFICA.TITULO%TYPE,
    AUTOR		REFERENCIA_BIBLIOGRAFICA.AUTOR%TYPE,
    ANIO_PUBLICACION	REFERENCIA_BIBLIOGRAFICA.ANIO_PUBLICACION%TYPE, 
    LUGAR_PUBLICACION	REFERENCIA_BIBLIOGRAFICA.LUGAR_PUBLICACION%TYPE,
    EDITORIAL		REFERENCIA_BIBLIOGRAFICA.EDITORIAL%TYPE,
    ISBN REFERENCIA_BIBLIOGRAFICA.ISBN%TYPE,
    ID_SYLLABUS		REFERENCIA_BIBLIOGRAFICA.ID_SYLLABUS%TYPE) AUTHID CURRENT_USER AS

BEGIN               
    INSERT INTO REFERENCIA_BIBLIOGRAFICA (ID_REFERENCIA,
	                TITULO, AUTOR, 
					ANIO_PUBLICACION, 
					LUGAR_PUBLICACION, 
					EDITORIAL, 
					ISBN,
					ID_SYLLABUS)                                                
      VALUES (sq_referencia.NEXTVAL,
	        REG_REF_BIBLIO.TITULO, 
			REG_REF_BIBLIO.AUTOR, 
			REG_REF_BIBLIO.ANIO_PUBLICACION, 
			REG_REF_BIBLIO.LUGAR_PUBLICACION,
			REG_REF_BIBLIO.EDITORIAL,
			REG_REF_BIBLIO.ISBN,  
			REG_REF_BIBLIO.ID_SYLLABUS);

END REG_REF_BIBLIO;
/

create or replace PROCEDURE REG_TEMA
/*---------------------------------------------------------------------------*/
/* Nombre    : REG_TEMA       		                             */
/* Objetivo  : Inserta un registro en la tabla TEMA      */
/*---------------------------------------------------------------------------*/                                
/*     Informacion:                                                          */
/*     Autor: Thalia Quiroz Guzman                                           */
/*---------------------------------------------------------------------------*/

   (DESCRIPCION		TEMA.DESCRIPCION%TYPE,
    UNIDAD			TEMA.UNIDAD%TYPE, 
    SEMANA			TEMA.SEMANA%TYPE,
    ID_SYLLABUS		TEMA.ID_SYLLABUS%TYPE) AUTHID CURRENT_USER AS

BEGIN               
    INSERT INTO TEMA (ID_TEMA,
	                DESCRIPCION, 
					UNIDAD, 
					SEMANA, 
					ID_SYLLABUS)                                                
      VALUES (sq_tema.nextval,
	        REG_TEMA.DESCRIPCION, 
			REG_TEMA.UNIDAD, 
			REG_TEMA.SEMANA,
			REG_TEMA.ID_SYLLABUS);

END REG_TEMA;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : Reg_Syllabus                                                
 * OBJETIVO  : Registrar syllabus en la base de datos                 
 * FECHA MOD : 03/11/2016 2:53pm
 *--------------------------------------------------------------------------                                
 *     INFORMACI?:                                                          
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN                                  
 *---------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE dbsegsyl.Reg_Syllabus(
    p_IDAsigAperturada      IN dbsegsyl.syllabus.id_asig_aperturada%TYPE, 
	p_ID out                dbsegsyl.syllabus.id_syllabus%TYPE
)
AUTHID CURRENT_USER
AS 
BEGIN 
       INSERT INTO dbsegsyl.syllabus(id_syllabus, estado, id_asig_aperturada)
                             VALUES (sq_syllabus.nextval, 'E', p_IDAsigAperturada)
		RETURNING id_syllabus into p_ID;
END Reg_Syllabus;
/

    --FECHA ULTIMA MODIFICACION: 11/11/2016 14:45PM
            -- Verificar procedures de LISTAR y BUSCAR 
            -- Definir parametros de salida de Listar_Syllabus_x_EAP
            -- Se agrego Registrar/Modificar/Eliminar Validacion_Alumno
            
/*--------------------------------------------------------------------------
 * NOMBRE    : Devuelve_IDPeriodo_Actual
 * OBJETIVO  : Retorna los datos del periodo actual         
 * FECHA MOD : 02/11/2016 2:12pm
 *--------------------------------------------------------------------------                                
 *     INFORMACI?:                                                          
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN                                  
 *--------------------------------------------------------------------------*/
CREATE OR REPLACE FUNCTION dbsegsyl.Devuelve_IDPeriodo_Actual
RETURN dbsegsyl.periodo.id_periodo%TYPE 
IS    vIDPeriodo INTEGER;
      vFechaActual DATE;
BEGIN
       vFechaActual := SYSDATE;
       
       SELECT id_periodo
         INTO vIDPeriodo      
         FROM dbsegsyl.periodo 
        WHERE anio = TO_NUMBER( TO_CHAR(SYSDATE, 'YYYY'))
          AND fecha_inicio <= vFechaActual 
          AND fecha_fin >= vFechaActual;
          
       RETURN vIDPeriodo;
END;
/