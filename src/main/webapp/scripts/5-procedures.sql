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
          select asignatura_aperturada.id_asig_aperturada, asignatura.nombre as asig_nombre, plan_de_estudio.nombre as plan_nombre
          from asignatura_aperturada
          JOIN dbsegsyl.asignatura ON ( asignatura.ID_ASIGNATURA = asignatura_aperturada.ID_ASIGNATURA)
          JOIN dbsegsyl.plan_de_estudio ON ( plan_de_estudio.ID_PLAN_ESTUDIO = asignatura.ID_PLAN_ESTUDIO)
     WHERE id_coordinador = p_idcoordinador
       AND id_periodo     = p_idperiodo
       ORDER BY asignatura.codigo; 

  end LISTAR_ASIG_X_COORD;
end PAC_CURSOR;

/*--------------------------------------------------------------------------
 * NOMBRE    : Listar_Grupos                                             
 * OBJETIVO  : Lista grupos del periodo actual              
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------                                
 *     INFORMACI?:                                                          
 *     AUTOR: TAKESHI FARRO HINOSHITA                                 
 *---------------------------------------------------------------------------*/
create or replace package PAC_CURSOR is
  --Creating REF CURSOR type
  type g_cursor is ref cursor;

  --Procedure that return the cursor
  procedure LISTAR_GRUPOS(
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor); -- Our cursor

end PAC_CURSOR;
/
create or replace package body PAC_CURSOR is
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
end PAC_CURSOR;

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