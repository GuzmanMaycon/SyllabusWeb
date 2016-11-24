/*--------------------------------------------------------------------------*/
/* NOMBRE    : VALIDA_ALUMNO_X_GRUPO                                        */
/* OBJETIVO  : RETORNA SI UN ALUMNO PERTENECE A UN GRUPO                    */
/* FECHA     : 20/11/2016 9:22pm
/*---------------------------------------------------------------------------*/
/*     INFORMACION:                                                          */
/*     AUTOR: LUCERO LIZA PUICAN                                             */
/*---------------------------------------------------------------------------*/
CREATE OR REPLACE FUNCTION DBSEGSYL.VALIDA_ALUMNO_X_GRUPO(
	p_IDAlumno 	IN alumno.id_usuario%TYPE,
  p_IDGrupo   IN grupo.id_grupo%TYPE
)
RETURN NUMBER
IS pertenece NUMBER;
BEGIN
    SELECT 1
      INTO pertenece
      FROM dbsegsyl.matricula m
     WHERE m.id_grupo = p_IDGrupo
       AND m.id_alumno = p_IDAlumno;

	RETURN pertenece;
EXCEPTION
	WHEN OTHERS THEN
		RETURN NULL;
END;
/

/*--------------------------------------------------------------------------*/
/* NOMBRE    : DEVUELVE_NOMBRE_ASIG_X_GRUPO                                 */
/* OBJETIVO  : RETORNA EL NOMBRE DE UNA ASIGNATURA POR ID_GRUPO             */
/* FECHA MODIFICACION : 18/11/2016 7:00pm
/*---------------------------------------------------------------------------*/
/*     INFORMACION:                                                          */
/*     AUTOR: LUCERO LIZA PUICAN                                             */
/*---------------------------------------------------------------------------*/
CREATE OR REPLACE FUNCTION DBSEGSYL.DEVUELVE_NOMBRE_ASIG_X_GRUPO(
	COD 	IN VARCHAR2
)
RETURN VARCHAR2 IS vnombre VARCHAR2(200);
BEGIN
		SELECT A.NOMBRE AS asig_nombre
      into vnombre
      FROM dbsegsyl.grupo g
      JOIN dbsegsyl.asignatura_aperturada ap ON (ap.ID_ASIG_APERTURADA = g.ID_ASIG_APERTURADA)
      JOIN dbsegsyl.asignatura A ON (A.ID_ASIGNATURA = ap.ID_ASIGNATURA)
     WHERE g.ID_GRUPO = cod;

	RETURN vnombre;
EXCEPTION
	WHEN OTHERS THEN
		RETURN NULL;
END;
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

/*--------------------------------------------------------------------------
 * NOMBRE    : Eliminar_Bibliografia
 * OBJETIVO  : Eliminar referencias bibliograficas
 * FECHA MOD : 08/11/2016 8:50am
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN
 *---------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE dbsegsyl.Eliminar_Bibliografia(
    p_IDReferencia       IN dbsegsyl.referencia_bibliografica.id_referencia%TYPE
)
AUTHID CURRENT_USER
AS
BEGIN
       DELETE FROM dbsegsyl.referencia_bibliografica
             WHERE id_referencia = p_IDReferencia;

END Eliminar_Bibliografia;
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

/*---------------------------------------------------------------------------*/
/* Nombre    : REG_TEMA       		                             */
/* Objetivo  : Inserta un registro en la tabla TEMA      */
/*---------------------------------------------------------------------------*/
/*     Informacion:                                                          */
/*     Autor: Thalia Quiroz Guzman                                           */
/*---------------------------------------------------------------------------*/
create or replace PROCEDURE REG_TEMA
   (DESCRIPCION		TEMA.DESCRIPCION%TYPE,
    UNIDAD			TEMA.UNIDAD%TYPE,
    SEMANA			TEMA.SEMANA%TYPE,
    ID_TIPO     TEMA.ID_TIPO%TYPE,
    ID_SYLLABUS		TEMA.ID_SYLLABUS%TYPE) AUTHID CURRENT_USER AS

BEGIN
    INSERT INTO TEMA (ID_TEMA,
	                DESCRIPCION,
					UNIDAD,
					SEMANA,
                    ID_TIPO,
					ID_SYLLABUS)
    VALUES (sq_tema.nextval,
	        REG_TEMA.DESCRIPCION,
			REG_TEMA.UNIDAD,
			REG_TEMA.SEMANA,
            REG_TEMA.ID_TIPO,
			REG_TEMA.ID_SYLLABUS);

END REG_TEMA;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : Reg_Syllabus
 * OBJETIVO  : Registrar syllabus en la base de datos
 * FECHA MOD : 20/11/2016 11:04pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN
 *---------------------------------------------------------------------------*/
create or replace PROCEDURE Reg_Syllabus
   (p_IDAsigAperturada      IN dbsegsyl.syllabus.id_asig_aperturada%TYPE,
   p_ID out                dbsegsyl.syllabus.id_syllabus%TYPE) AUTHID CURRENT_USER AS

BEGIN
   INSERT INTO syllabus (
      id_syllabus,
      id_estado,
      fecha_entrega,
      id_asig_aperturada
   )
   VALUES (sq_syllabus.nextval, 1, SYSDATE, p_IDAsigAperturada)
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

create or replace FUNCTION RET_ESTADO_SYLLABUS_X_APER
(
  ASIG_APER_ID IN ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE
)
RETURN VARCHAR2 IS VESTADO VARCHAR2(200);
BEGIN
  SELECT ESTADO_SYLLABUS.DESCRIPCION
  INTO VESTADO
  FROM SYLLABUS
  JOIN ESTADO_SYLLABUS ON ESTADO_SYLLABUS.ID_ESTADO_SYLLABUS = SYLLABUS.ID_ESTADO
  WHERE SYLLABUS.ID_ASIG_APERTURADA = ASIG_APER_ID;

  RETURN VESTADO;
END RET_ESTADO_SYLLABUS_X_APER;
/

create or replace PROCEDURE EDITAR_REF_BIBLIO
/*---------------------------------------------------------------------------*/
/* Nombre    : EDITAR_REF_BIBLIO       		                             */
/* Objetivo  : Edita un registro de la tabla REFERENCIA_BIBLIOGRAFICA      */
/*---------------------------------------------------------------------------*/
/*     Informacion:                                                          */
/*     Autor: Lucero Liza Puican                                            */
/*---------------------------------------------------------------------------*/

   (p_IDReferencia      REFERENCIA_BIBLIOGRAFICA.id_referencia%type,
    p_Titulo		        REFERENCIA_BIBLIOGRAFICA.TITULO%TYPE,
    p_Autor		          REFERENCIA_BIBLIOGRAFICA.AUTOR%TYPE,
    p_AnioPublicacion	  REFERENCIA_BIBLIOGRAFICA.ANIO_PUBLICACION%TYPE,
    p_LugarPublicacion	REFERENCIA_BIBLIOGRAFICA.LUGAR_PUBLICACION%TYPE,
    p_Editorial		      REFERENCIA_BIBLIOGRAFICA.EDITORIAL%TYPE,
    p_ISBN              REFERENCIA_BIBLIOGRAFICA.ISBN%TYPE,
    p_IDSyllabus		    REFERENCIA_BIBLIOGRAFICA.ID_SYLLABUS%TYPE) AUTHID CURRENT_USER AS

BEGIN
    UPDATE dbsegsyl.referencia_bibliografica
       SET titulo = p_Titulo,
           autor = p_Autor,
           anio_publicacion = p_AnioPublicacion,
           lugar_publicacion = p_LugarPublicacion,
           editorial = p_Editorial,
           isbn = p_ISBN
		WHERE  id_referencia = p_IDReferencia
      AND  id_syllabus = p_IDSyllabus;

END EDITAR_REF_BIBLIO;
/

create or replace PROCEDURE EDITAR_TEMA
/*---------------------------------------------------------------------------*/
/* Nombre    : EDITAR_TEMA      		                                     */
/* Objetivo  : Edita un registro de la tabla TEMA  							 */
/*---------------------------------------------------------------------------*/
/*     Informacion:                                                          */
/*     Autor: Thalia Quiroz Guzman                                           */
/*---------------------------------------------------------------------------*/

   (p_IDTema		TEMA.ID_TEMA%TYPE,
    p_Descripcion	TEMA.DESCRIPCION%TYPE,
    p_Unidad		TEMA.UNIDAD%TYPE,
    p_Semana		TEMA.SEMANA%TYPE,
    p_IDTipo		TEMA.ID_TIPO%TYPE,
    P_IDSyllabus	TEMA.ID_SYLLABUS%TYPE) AUTHID CURRENT_USER AS

BEGIN
    UPDATE dbsegsyl.tema
       SET DESCRIPCION = p_Descripcion,
           UNIDAD = p_Unidad,
           SEMANA = p_Semana,
           ID_TIPO = p_IDTipo
		WHERE  ID_TEMA = p_IDTema
      AND  ID_SYLLABUS = p_IDSyllabus;

END EDITAR_TEMA;
/

create or replace PROCEDURE ELIMINAR_TEMA
/*---------------------------------------------------------------------------*/
/* Nombre    : ELIMINAR_TEMA      		                                     */
/* Objetivo  : Elimina un registro de la tabla TEMA  						 */
/*---------------------------------------------------------------------------*/
/*     Informacion:                                                          */
/*     Autor: Thalia Quiroz Guzman                                           */
/*---------------------------------------------------------------------------*/

   (p_IDTema		TEMA.ID_TEMA%TYPE) AUTHID CURRENT_USER AS

BEGIN
   DELETE FROM TEMA
   WHERE ID_TEMA = p_IDTema;
END ELIMINAR_TEMA;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : REG_VALIDACION_ALUMNO
 * OBJETIVO  : Registrar validacion del alumno correspondiente al syllabus
 * FECHA MOD : 11/11/2016 3:18pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN
 *---------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE REG_VALIDACION_ALUMNO(
   p_Cumplido         IN dbsegsyl.validacion_alumno.cumplido%TYPE,
   p_Comentario       IN dbsegsyl.validacion_alumno.comentario%TYPE,
   p_IDAlumno         IN dbsegsyl.validacion_alumno.id_alumno%TYPE,
   p_IDTema_x_Sesion  IN dbsegsyl.validacion_alumno.id_tema_x_sesion%TYPE
)
AUTHID CURRENT_USER
AS
BEGIN
      INSERT
      INTO dbsegsyl.validacion_alumno (id_validacion, cumplido, comentario, id_alumno, id_tema_x_sesion)
      VALUES (sq_val_alumno.NEXTVAL, p_Cumplido, p_Comentario, p_IDAlumno, p_IDTema_x_Sesion);
END REG_VALIDACION_ALUMNO;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : REG_TEMA_X_SESION
 * OBJETIVO  : Registrar el tema avanzado en clases
 * FECHA MOD : 07/11/2016 2:30pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN
 *---------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE dbsegsyl.REG_TEMA_X_SESION(
    p_IDTemaXSesion         IN dbsegsyl.tema_x_sesion.id_tema_x_sesion%TYPE,
    p_IDTema                IN dbsegsyl.tema_x_sesion.id_tema%TYPE,
    p_IDSesion              IN dbsegsyl.tema_x_sesion.id_sesion%TYPE
)
AUTHID CURRENT_USER
AS
BEGIN
       INSERT INTO dbsegsyl.tema_x_sesion(id_tema_x_sesion, cumplido, id_tema, id_sesion)
                             VALUES (p_IDTemaXSesion, 'N', p_IDTema, p_IDSesion);
END REG_TEMA_X_SESION;
/

/*--------------------------------------------------------------------------
 * NOMBRE    : REG_COORDINADOR_X_ASIG_APERTURADA
 * OBJETIVO  : Registrar un coordinador para una asignatura aperturada
 * FECHA MOD : 23/11/2016 2:30pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: TAKESHI FARRO HINOSHITA
 *---------------------------------------------------------------------------*/
CREATE OR REPLACE PROCEDURE dbsegsyl.REG_COORDINADOR_X_ASIG_APER(
    p_IDDocente        IN dbsegsyl.docente.id_usuario%TYPE,
    p_IDAsigAperturada IN dbsegsyl.asignatura_aperturada.id_asig_aperturada%TYPE
)
AUTHID CURRENT_USER
AS
BEGIN
      UPDATE dbsegsyl.asignatura_aperturada
      SET id_coordinador = p_IDDocente
      WHERE id_asig_aperturada = p_IDAsigAperturada;
END REG_COORDINADOR_X_ASIG_APER;
/