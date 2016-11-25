create or replace PACKAGE          PAC_CURSOR is
  --Creating REF CURSOR type
  type g_cursor is ref cursor;

  --Procedure that return the cursor
  /*--------------------------------------------------------------------------
   * NOMBRE    : LISTAR_ASIG_X_COORD
   * OBJETIVO  : Lista asignaturas aperturadas de acuerdo al periodo actual
   * FECHA MOD : 11/11/2016 2:53pm
   *--------------------------------------------------------------------------
   *     INFORMACI?:
   *     AUTOR: TAKESHI FARRO HINOSHITA
   *---------------------------------------------------------------------------*/
  procedure LISTAR_ASIG_X_COORD(
    p_IDCoordinador     in     docente.id_usuario%type,
    p_IDPeriodo in periodo.id_periodo%type,
    o_cursor in out g_cursor); -- Our cursor

/*--------------------------------------------------------------------------
   * NOMBRE    : LISTAR_TEMAS_X_ASIG_APER
   * OBJETIVO  : Lista temas por asignatura aperturada
   * FECHA MOD : 13/11/2016 10:30pm
   *--------------------------------------------------------------------------
   *     INFORMACI?:
   *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
   *---------------------------------------------------------------------------*/

  procedure LISTAR_TEMAS_X_ASIG_APER(
    ASIG_APER_ID     in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
    SEM              in TEMA.SEMANA%TYPE,
    O_CURSOR         in out g_cursor
  );

/*--------------------------------------------------------------------------
   * NOMBRE    : RET_ASIG_X_ASIG_APER
   * OBJETIVO  : Retorna el ID y nombre de la Asignatura aperturada
   * FECHA MOD : 13/11/2016 10:30pm
   *--------------------------------------------------------------------------
   *     INFORMACI?:
   *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
   *---------------------------------------------------------------------------*/

  procedure RET_ASIG_X_ASIG_APER(
    ASIG_APER_ID in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
    O_CURSOR         in out g_cursor
  );

 /*--------------------------------------------------------------------------
   * NOMBRE    : LISTAR_ASIG_AP_X_ALUMNO
   * OBJETIVO  : Retorna las asignaturas aperturadas en las que se encuentra
                 matriculado el alumno
   * FECHA MOD : 13/11/2016 10:30pm
   *--------------------------------------------------------------------------
   *     INFORMACI?:
   *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
   *---------------------------------------------------------------------------*/

  procedure LISTAR_ASIG_AP_X_ALUMNO(
    ID_ALUM  IN     ALUMNO.ID_USUARIO%TYPE,
    PERIOD   IN     PERIODO.ID_PERIODO%TYPE,
    O_CURSOR IN OUT G_CURSOR
  );

/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_GRUPOS
 * OBJETIVO  : Lista grupos del periodo actual
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: TAKESHI FARRO HINOSHITA
 *---------------------------------------------------------------------------*/

  procedure LISTAR_GRUPOS(
     p_IDPeriodo IN periodo.id_periodo%TYPE,
     o_cursor    IN OUT g_cursor
  );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_USUARIO_X_EMAIL
 * OBJETIVO  : Retorna la informacion del Usuario de acuerdo a su email
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
 *---------------------------------------------------------------------------*/

  procedure RET_USUARIO_X_EMAIL(
    EMAIL    IN     USUARIO.CORREO%TYPE,
    O_CURSOR IN OUT G_CURSOR
  );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_TEMAS_X_SYLLABUS
 * OBJETIVO  : Retorna los temas del syllabus
 * FECHA MOD : 18/11/2016 4:30pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: TAKESHI FARRO HINOSHITA
 *---------------------------------------------------------------------------*/
   procedure RET_TEMAS_X_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      O_CURSOR      IN OUT G_CURSOR
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_GRUPOS_X_ALUMNO
 * OBJETIVO  : Lista los grupos en los que se encuentra matriculado el alumno
 * FECHA MOD : 11/11/2016 2:53pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
 *---------------------------------------------------------------------------*/
   procedure LISTAR_GRUPOS_X_ALUMNO(
      p_IDPeriodo in periodo.id_periodo%type,
      cod         in matricula.id_alumno%type,
      o_cursor    in out g_cursor
	);

/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_GRUPOS_X_DOCENTE
 * OBJETIVO  : Lista los grupos asignados al docente
 * FECHA MOD : 18/11/2016 5:55pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO LIZA PUICAN
 *---------------------------------------------------------------------------*/
   procedure LISTAR_GRUPOS_X_DOCENTE(
      p_IDPeriodo in periodo.id_periodo%type,
      cod         in docente.id_usuario%type,
      o_cursor    in out g_cursor
	);

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_ROLES_X_USUARIO
 * OBJETIVO  : Retornar roles del usuario
 * FECHA MOD : 18/11/2016 6:07pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
 *---------------------------------------------------------------------------*/
   procedure RET_ROLES_X_USUARIO(
      p_id_usuario IN usuario.id_usuario%TYPE,
       o_cursor    in out g_cursor
   );

   PROCEDURE RET_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      o_cursor IN OUT g_cursor
   );

   procedure RET_BIBLIOGRAFIA_X_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      O_CURSOR      IN OUT G_CURSOR
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_TEMAS_A_VALIDAR_X_GRUPO
 * OBJETIVO  : Lista los temas a validar del grupo en el que esta matriculado el alumno
 * FECHA MOD : 19/11/2016 5:12am
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: Lucero Liza Puican
 *---------------------------------------------------------------------------*/
   PROCEDURE LISTAR_TEMAS_A_VALIDAR_X_GRUPO(
      p_id_grupo  IN grupo.id_grupo%TYPE,
      p_id_usuario IN alumno.id_usuario%TYPE,
      O_CURSOR    IN out G_CURSOR
   );

   PROCEDURE TEMAS_ASIGNA_APER_x_SEMANA(
      p_id_asignatura_aperturada IN asignatura_aperturada.id_asig_aperturada%TYPE,
      p_numero_semana IN tema.semana%TYPE,
      o_cursor IN OUT g_cursor
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_PERIODO_ACTUAL
 * OBJETIVO  : Retorna los datos del periodo actual
 * FECHA MOD : 02/11/2016 2:12pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: LUCERO DEL PILAR LIZA PUICAN
 *--------------------------------------------------------------------------*/
   PROCEDURE RET_PERIODO_ACTUAL(
      o_cursor IN OUT g_cursor
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_TEMAS_AVANZADOS_x_SESION
 * OBJETIVO  : Retorna los datos de los temas que el profesor ha registrado
               como "avanzados" en el sistema.
 * FECHA MOD : 23/11/2016 2:55pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: TAKESHI FARRO HINOSHITA
 *--------------------------------------------------------------------------*/
   PROCEDURE RET_TEMAS_AVANZADOS_x_SESION(
      p_IDSesion IN sesion.id_sesion%TYPE,
      o_cursor   IN OUT g_cursor
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_CLASES_X_GRUPO
 * OBJETIVO  : Retorna las clases del grupo
 * FECHA MOD : 23/11/2016 8:00pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
 *--------------------------------------------------------------------------*/
   PROCEDURE RET_CLASES_X_GRUPO(
      p_id_grupo IN GRUPO.ID_GRUPO%TYPE,
      p_id_docente IN DOCENTE.ID_USUARIO%TYPE,
      o_cursor IN OUT g_cursor
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : LISTAR_TEMAS_X_GRUPO
 * OBJETIVO  : Retorna los temas del grupo
 * FECHA MOD : 23/11/2016 8:00pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: GIANCARLOS CLAUDIO ZAVALETA
 *--------------------------------------------------------------------------*/
   PROCEDURE LISTAR_TEMAS_X_GRUPO(
      GRUPO_ID     in GRUPO.ID_GRUPO%TYPE,
      O_CURSOR     in out g_cursor,
      p_sem_inicio in TEMA.SEMANA%TYPE,
      p_sem_fin    in TEMA.SEMANA%TYPE
   );

/*--------------------------------------------------------------------------
 * NOMBRE    : RET_DOCENTES_X_ASIG_APERTURADA
 * OBJETIVO  : Retorna los docentes que dictan una asignatura aperturada
 * FECHA MOD : 23/11/2016 8:00pm
 *--------------------------------------------------------------------------
 *     INFORMACI?:
 *     AUTOR: TAKESHI FARRO HINOSHITA
 *--------------------------------------------------------------------------*/
   PROCEDURE RET_DOCENTES_X_ASIG_APERTURADA(
      p_id_asig_aperturda in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
      o_cursor            in out g_cursor
   );

end PAC_CURSOR;