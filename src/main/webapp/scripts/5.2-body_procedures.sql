create or replace PACKAGE BODY PAC_CURSOR IS
  PROCEDURE LISTAR_ASIG_X_COORD(
    p_IDCoordinador IN docente.id_usuario%TYPE,
    p_IDPeriodo     IN periodo.id_periodo%TYPE,
    o_cursor        IN OUT g_cursor) IS

    BEGIN
      --Opening the cursor to return matched rows
      OPEN o_cursor FOR
        SELECT asignatura_aperturada.id_asig_aperturada,
               asignatura.nombre AS asig_nombre,
               plan_de_estudio.nombre AS plan_nombre,
               NVL(estado_syllabus.descripcion, 'NO ENTREGADO') AS estado_syllabus,
			   syllabus.id_syllabus AS id_syllabus
        FROM asignatura_aperturada
        JOIN dbsegsyl.asignatura ON ( asignatura.ID_ASIGNATURA = asignatura_aperturada.ID_ASIGNATURA)
        JOIN dbsegsyl.plan_de_estudio ON ( plan_de_estudio.ID_PLAN_ESTUDIO = asignatura.ID_PLAN_ESTUDIO)
        LEFT JOIN dbsegsyl.syllabus ON (syllabus.id_asig_aperturada = asignatura_aperturada.id_asig_aperturada)
        LEFT JOIN dbsegsyl.estado_syllabus ON (estado_syllabus.id_estado_syllabus = syllabus.id_estado)
        WHERE id_coordinador = p_idcoordinador
        AND id_periodo     = p_idperiodo
        ORDER BY asignatura.codigo;

  END LISTAR_ASIG_X_COORD;

  PROCEDURE LISTAR_TEMAS_X_ASIG_APER(
    ASIG_APER_ID     in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
    SEM              in TEMA.SEMANA%TYPE,
    O_CURSOR         in out g_cursor) IS

  BEGIN
    OPEN o_cursor FOR
      SELECT TEMA.ID_TEMA, TEMA.DESCRIPCION
      FROM TEMA
      JOIN SYLLABUS ON TEMA.ID_SYLLABUS = SYLLABUS.ID_SYLLABUS
      WHERE SYLLABUS.ID_ASIG_APERTURADA = ASIG_APER_ID
      AND TEMA.SEMANA = SEM;

  END LISTAR_TEMAS_X_ASIG_APER;

  PROCEDURE RET_ASIG_X_ASIG_APER(
    ASIG_APER_ID     in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
    O_CURSOR         in out g_cursor) IS
  BEGIN
    OPEN o_cursor FOR
      SELECT ASIGNATURA.ID_ASIGNATURA, ASIGNATURA.NOMBRE
      FROM ASIGNATURA
      JOIN ASIGNATURA_APERTURADA ON ASIGNATURA.ID_ASIGNATURA = ASIGNATURA_APERTURADA.ID_ASIGNATURA
      WHERE ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA = ASIG_APER_ID;
  END RET_ASIG_X_ASIG_APER;

  procedure LISTAR_ASIG_AP_X_ALUMNO(
    ID_ALUM  IN     ALUMNO.ID_USUARIO%TYPE,
    PERIOD   IN     PERIODO.ID_PERIODO%TYPE,
    O_CURSOR IN OUT G_CURSOR) IS
  BEGIN
    OPEN O_CURSOR FOR
      SELECT ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA, ASIGNATURA.NOMBRE AS ASIG_NOMBRE
      FROM ASIGNATURA_APERTURADA
      JOIN ASIGNATURA ON ASIGNATURA.ID_ASIGNATURA = ASIGNATURA_APERTURADA.ID_ASIGNATURA
      JOIN GRUPO ON GRUPO.ID_ASIG_APERTURADA = ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA
      JOIN MATRICULA ON GRUPO.ID_GRUPO = MATRICULA.ID_GRUPO
      WHERE MATRICULA.ID_ALUMNO = ID_ALUM AND ASIGNATURA_APERTURADA.ID_PERIODO = PERIOD;
  END LISTAR_ASIG_AP_X_ALUMNO;

  procedure LISTAR_GRUPOS(
     p_IDPeriodo IN periodo.id_periodo%TYPE,
     o_cursor IN OUT g_cursor) IS
     BEGIN
        OPEN o_cursor FOR
        SELECT grupo.id_grupo AS id_grupo, grupo.numero AS grupo_numero, asignatura.nombre AS asig_nombre
        FROM grupo
        JOIN dbsegsyl.asignatura_aperturada ON ( asignatura_aperturada.ID_ASIG_APERTURADA = grupo.ID_ASIG_APERTURADA)
        JOIN dbsegsyl.asignatura ON ( asignatura.ID_ASIGNATURA = asignatura_aperturada.ID_ASIGNATURA)
        WHERE id_periodo = p_idperiodo;

    END LISTAR_GRUPOS;

  PROCEDURE LISTAR_TEMAS_A_VALIDAR_X_GRUPO(
     p_id_grupo IN grupo.id_grupo%TYPE,
     p_id_usuario IN alumno.id_usuario%TYPE,
     O_CURSOR IN OUT G_CURSOR) IS
     BEGIN
        OPEN O_CURSOR FOR
      SELECT t.id_tema, t.unidad, t.semana, t.descripcion, t.id_tipo, t.id_syllabus
        FROM dbsegsyl.grupo g
        JOIN dbsegsyl.clase c  ON (c.id_grupo = g.id_grupo)
        JOIN dbsegsyl.sesion s ON (s.id_clase = c.id_clase)
        JOIN dbsegsyl.tema_x_sesion ts ON (ts.id_sesion = s.id_sesion
                                       AND ts.cumplido  IN ('S'))
        JOIN dbsegsyl.asistencia asist ON (asist.id_sesion = ts.id_sesion
                                      AND  asist.id_usuario = p_id_usuario
                                      AND  asist.verificacion IN ('A'))
        JOIN dbsegsyl.tema t ON (t.id_tema = ts.id_tema)
       where g.id_grupo = p_id_grupo;

    END LISTAR_TEMAS_A_VALIDAR_X_GRUPO;

   procedure RET_USUARIO_X_EMAIL(
      EMAIL    IN     USUARIO.CORREO%TYPE,
      O_CURSOR IN OUT G_CURSOR) IS
      BEGIN
         OPEN O_CURSOR FOR
         SELECT * FROM USUARIO WHERE USUARIO.CORREO = EMAIL;
   END RET_USUARIO_X_EMAIL;

   procedure RET_TEMAS_X_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      O_CURSOR      IN OUT G_CURSOR) IS
      BEGIN
         OPEN O_CURSOR FOR
         SELECT *
         FROM tema
         WHERE tema.id_syllabus = p_id_syllabus;
   END RET_TEMAS_X_SYLLABUS;

   procedure LISTAR_GRUPOS_X_ALUMNO(
      p_IDPeriodo in periodo.id_periodo%type,
      cod      in matricula.id_alumno%type,
      o_cursor in out g_cursor) is
      begin
         OPEN O_CURSOR FOR
         SELECT GRUPO.ID_GRUPO AS ID_GRUPO, GRUPO.NUMERO AS GRUPO_NUMERO, ASIGNATURA.NOMBRE AS ASIG_NOMBRE
         FROM GRUPO
         JOIN ASIGNATURA_APERTURADA ON ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA = GRUPO.ID_ASIG_APERTURADA
         JOIN ASIGNATURA ON ASIGNATURA.ID_ASIGNATURA = ASIGNATURA_APERTURADA.ID_ASIGNATURA
         JOIN MATRICULA ON MATRICULA.ID_GRUPO = GRUPO.ID_GRUPO
         WHERE ASIGNATURA_APERTURADA.ID_PERIODO = p_IDPeriodo AND MATRICULA.ID_ALUMNO = cod;

   END LISTAR_GRUPOS_X_ALUMNO;

   procedure LISTAR_GRUPOS_X_DOCENTE(
      p_IDPeriodo in periodo.id_periodo%type,
      cod         in docente.id_usuario%type,
      o_cursor    in out g_cursor) is
      begin
         OPEN O_CURSOR FOR
         SELECT DISTINCT GRUPO.ID_GRUPO AS ID_GRUPO, GRUPO.NUMERO AS GRUPO_NUMERO, ASIGNATURA.NOMBRE AS ASIG_NOMBRE
           FROM DBSEGSYL.GRUPO
           JOIN DBSEGSYL.ASIGNATURA_APERTURADA ON ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA = GRUPO.ID_ASIG_APERTURADA
           JOIN DBSEGSYL.ASIGNATURA ON ASIGNATURA.ID_ASIGNATURA = ASIGNATURA_APERTURADA.ID_ASIGNATURA
           JOIN DBSEGSYL.CLASE ON CLASE.ID_GRUPO = GRUPO.ID_GRUPO
           JOIN DBSEGSYL.DOCENTE ON DOCENTE.ID_USUARIO = CLASE.ID_DOCENTE
          WHERE DOCENTE.ID_USUARIO = cod
            AND ASIGNATURA_APERTURADA.ID_PERIODO = p_IDPeriodo;

   END LISTAR_GRUPOS_X_DOCENTE;

   PROCEDURE RET_ROLES_X_USUARIO(
      p_id_usuario IN usuario.id_usuario%TYPE,
      o_cursor IN OUT g_cursor) IS
   BEGIN
      OPEN O_CURSOR FOR
      SELECT ROL_X_USUARIO.ID_ROL AS ID_ROL, ROL.NOMBRE AS NOMBRE_ROL
      FROM ROL_X_USUARIO
      JOIN ROL ON ROL.ID_ROL = ROL_X_USUARIO.ID_ROL
      WHERE ROL_X_USUARIO.ID_USUARIO = p_id_usuario;
   END RET_ROLES_X_USUARIO;

   PROCEDURE RET_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      o_cursor IN OUT g_cursor) IS
      BEGIN
         OPEN O_CURSOR FOR
         SELECT SYLLABUS.FECHA_ENTREGA AS FECHA_ENTREGA,
                SYLLABUS.FECHA_APROBACION AS FECHA_APROBACION,
                SYLLABUS.ID_ASIG_APERTURADA AS ID_ASIG_APERTURADA,
                NVL(ESTADO_SYLLABUS.DESCRIPCION, 'NO ENTREGADO') AS ESTADO_SYLLABUS
         FROM SYLLABUS
         JOIN ESTADO_SYLLABUS ON ESTADO_SYLLABUS.ID_ESTADO_SYLLABUS = SYLLABUS.ID_ESTADO
        WHERE SYLLABUS.ID_SYLLABUS = p_id_syllabus;
   END RET_SYLLABUS;

   procedure RET_BIBLIOGRAFIA_X_SYLLABUS(
      p_id_syllabus IN syllabus.id_syllabus%TYPE,
      O_CURSOR      IN OUT G_CURSOR) IS
      BEGIN
         OPEN O_CURSOR FOR
         SELECT *
           FROM dbsegsyl.referencia_bibliografica
          WHERE referencia_bibliografica.id_syllabus = p_id_syllabus;
   END RET_BIBLIOGRAFIA_X_SYLLABUS;

   PROCEDURE TEMAS_ASIGNA_APER_x_SEMANA(
      p_id_asignatura_aperturada IN asignatura_aperturada.id_asig_aperturada%TYPE,
      p_numero_semana IN tema.semana%TYPE,
      o_cursor IN OUT g_cursor) IS
      BEGIN
         OPEN o_cursor FOR
         SELECT tema.*
         FROM dbsegsyl.tema
         JOIN dbsegsyl.syllabus ON dbsegsyl.tema.id_syllabus = dbsegsyl.syllabus.id_syllabus
         JOIN dbsegsyl.asignatura_aperturada ON dbsegsyl.syllabus.id_asig_aperturada = dbsegsyl.asignatura_aperturada.id_asig_aperturada
         JOIN dbsegsyl.asignatura ON dbsegsyl.asignatura_aperturada.id_asignatura = dbsegsyl.asignatura.id_asignatura
         WHERE asignatura_aperturada.id_asig_aperturada = p_id_asignatura_aperturada and tema.semana = p_numero_semana;

   END TEMAS_ASIGNA_APER_x_SEMANA;

   PROCEDURE RET_PERIODO_ACTUAL(
      o_cursor IN OUT g_cursor
   ) IS
      vFechaActual DATE;
      BEGIN
         vFechaActual := SYSDATE;
         OPEN o_cursor FOR
         SELECT periodo.*
           FROM dbsegsyl.periodo
          WHERE anio = TO_NUMBER( TO_CHAR(SYSDATE, 'YYYY'))
            AND fecha_inicio <= vFechaActual
            AND fecha_fin >= vFechaActual;

   END RET_PERIODO_ACTUAL;

   PROCEDURE RET_TEMAS_AVANZADOS_x_SESION(
       p_IDSesion IN sesion.id_sesion%TYPE,
       o_cursor   IN OUT g_cursor
   ) IS
      BEGIN
         OPEN o_cursor FOR
         SELECT tema.*, tema_x_sesion.id_tema_x_sesion
           FROM dbsegsyl.tema
           JOIN tema_x_sesion ON tema_x_sesion.id_tema = tema.id_tema
          WHERE tema_x_sesion.id_sesion = p_IDSesion
          AND tema_x_sesion.cumplido = 'S';

   END RET_TEMAS_AVANZADOS_x_SESION;

   PROCEDURE RET_CLASES_X_GRUPO(
      p_id_grupo IN GRUPO.ID_GRUPO%TYPE,
      p_id_docente IN DOCENTE.ID_USUARIO%TYPE,
      o_cursor IN OUT g_cursor
   ) IS
      BEGIN
         OPEN o_cursor FOR
         SELECT SESION.*, TIPO_CLASE.DESCRIPCION, TIPO_CLASE.ID_TIPO_CLASE
           FROM SESION
           JOIN CLASE ON SESION.ID_CLASE = CLASE.ID_CLASE
           JOIN TIPO_CLASE ON CLASE.ID_TIPO = TIPO_CLASE.ID_TIPO_CLASE
          WHERE CLASE.ID_GRUPO = p_id_grupo
            AND CLASE.ID_DOCENTE = p_id_docente;
   END RET_CLASES_X_GRUPO;

   PROCEDURE LISTAR_TEMAS_X_GRUPO(
      GRUPO_ID     in GRUPO.ID_GRUPO%TYPE,
      O_CURSOR     in out g_cursor,
      p_sem_inicio in TEMA.SEMANA%TYPE,
      p_sem_fin    in TEMA.SEMANA%TYPE
   ) IS
  BEGIN
      OPEN o_cursor FOR
      SELECT TEMA.ID_TEMA, TEMA.DESCRIPCION, TEMA.UNIDAD, TEMA.ID_TIPO, TEMA.SEMANA
        FROM TEMA
        JOIN SYLLABUS ON TEMA.ID_SYLLABUS = SYLLABUS.ID_SYLLABUS
        JOIN ASIGNATURA_APERTURADA ON SYLLABUS.ID_ASIG_APERTURADA = ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA
        JOIN GRUPO ON GRUPO.ID_ASIG_APERTURADA = ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA
       WHERE GRUPO.ID_GRUPO = GRUPO_ID AND TEMA.SEMANA >= p_sem_inicio AND TEMA.SEMANA <= p_sem_fin;

  END LISTAR_TEMAS_X_GRUPO;

   PROCEDURE RET_DOCENTES_X_ASIG_APERTURADA(
      p_id_asig_aperturda in ASIGNATURA_APERTURADA.ID_ASIG_APERTURADA%TYPE,
      o_cursor            in out g_cursor
   ) IS
      BEGIN
         OPEN o_cursor FOR
         SELECT docente.id_usuario AS id_docente,
                docente.grado AS grado_docente,
                usuario.nombre AS nombre_docente,
                usuario.apellido AS apellido_docente
           FROM dbsegsyl.docente
           JOIN usuario ON usuario.id_usuario = docente.id_usuario
           JOIN clase ON clase.id_docente = docente.id_usuario
           JOIN grupo ON grupo.id_grupo = clase.id_grupo
           JOIN asignatura_aperturada ON asignatura_aperturada.id_asig_aperturada = grupo.id_asig_aperturada
          WHERE asignatura_aperturada.id_asig_aperturada = p_id_asig_aperturda;

   END RET_DOCENTES_X_ASIG_APERTURADA;

   PROCEDURE CLASES_DEL_ALUMNO(
      p_id_grupo IN GRUPO.ID_GRUPO%TYPE,
      p_id_alumno IN ALUMNO.ID_USUARIO%TYPE,
      o_cursor IN OUT g_cursor
   ) IS
   BEGIN
      OPEN o_cursor FOR
      SELECT SESION.*, TIPO_CLASE.DESCRIPCION, TIPO_CLASE.ID_TIPO_CLASE
        FROM GRUPO
        JOIN MATRICULA ON MATRICULA.ID_GRUPO = GRUPO.ID_GRUPO
        JOIN CLASE ON CLASE.ID_GRUPO = GRUPO.ID_GRUPO
        JOIN SESION ON SESION.ID_CLASE = CLASE.ID_CLASE
        JOIN TIPO_CLASE ON CLASE.ID_TIPO = TIPO_CLASE.ID_TIPO_CLASE
       WHERE MATRICULA.ID_ALUMNO = p_id_alumno
         AND MATRICULA.ID_GRUPO = p_id_grupo;
   END CLASES_DEL_ALUMNO;

END PAC_CURSOR;