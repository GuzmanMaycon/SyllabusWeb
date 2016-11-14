--TABLA PERIODO
INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (1,2015,0,TO_DATE('07/01/2016','DD/MM/YYYY'),TO_DATE('03/03/2016','DD/MM/YYYY'));

INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (2,2015,1,TO_DATE('23/03/2016','DD/MM/YYYY'),TO_DATE('17/07/2016','DD/MM/YYYY'));

INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (3,2015,2,TO_DATE('17/08/2016','DD/MM/YYYY'),TO_DATE('11/12/2016','DD/MM/YYYY'));

INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (4,2016,0,TO_DATE('07/01/2016','DD/MM/YYYY'),TO_DATE('03/03/2016','DD/MM/YYYY'));

INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (5,2016,1,TO_DATE('21/03/2016','DD/MM/YYYY'),TO_DATE('15/07/2016','DD/MM/YYYY'));

INSERT INTO DBSEGSYL.PERIODO(ID_PERIODO,ANIO,SEMESTRE,FECHA_INICIO,FECHA_FIN)
			VALUES (6,2016,2,TO_DATE('15/08/2016','DD/MM/YYYY'),TO_DATE('09/12/2016','DD/MM/YYYY'));

--TABLA EAP
INSERT INTO DBSEGSYL.EAP(ID_EAP, CODIGO_EAP, NOMBRE)
			VALUES (1, 201, 'E.A.P INGENIERIA DE SISTEMAS');

INSERT INTO DBSEGSYL.EAP(ID_EAP, CODIGO_EAP, NOMBRE)
			VALUES (2, 202, 'E.A.P INGENIERIA DE SOFTWARE');

--TABLA PLAN_DE_ESTUDIO
INSERT INTO DBSEGSYL.PLAN_DE_ESTUDIO(ID_PLAN_ESTUDIO, NOMBRE, ESTA_VIGENTE, ANIO_DE_PUBLICACION, ID_EAP)
			VALUES (1, 'PLAN DE ESTUDIO 2009', 'S', '2009', 1);

INSERT INTO DBSEGSYL.PLAN_DE_ESTUDIO(ID_PLAN_ESTUDIO, NOMBRE, ESTA_VIGENTE, ANIO_DE_PUBLICACION, ID_EAP)
			VALUES (2, 'PLAN DE ESTUDIO 2014', 'S', '2009', 1);

INSERT INTO DBSEGSYL.PLAN_DE_ESTUDIO(ID_PLAN_ESTUDIO, NOMBRE, ESTA_VIGENTE, ANIO_DE_PUBLICACION, ID_EAP)
			VALUES (3, 'PLAN DE ESTUDIO 2009', 'S', '2009', 2);

INSERT INTO DBSEGSYL.PLAN_DE_ESTUDIO(ID_PLAN_ESTUDIO, NOMBRE, ESTA_VIGENTE, ANIO_DE_PUBLICACION, ID_EAP)
			VALUES (4, 'PLAN DE ESTUDIO 2015', 'S', '2015', 2);

--TABLA REGIMEN
INSERT INTO DBSEGSYL.REGIMEN(ID_REGIMEN, DESCRIPCION)
			VALUES (1,'OBLIGATORIO');

INSERT INTO DBSEGSYL.REGIMEN (ID_REGIMEN, DESCRIPCION)
			VALUES (2, 'ELECTIVO');

--TABLA ASIGNATURA
--Cursos de Primer Ciclo de Ingenieria de Software del Plan de Estudio 2009
INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES 	(1, 'MATEMATICA BASICA I',2020104,4,1,3,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (2, 'INTRODUCCION A LA TEORIA GENERAL DE SISTEMAS',2020101,3,1,3,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (3, 'IDIOMA EXTRANJERO I',2020106,3,1,3,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (4, 'COMUNICACION Y DINAMICA DE GRUPO',2020105,2,1,3,1);

--Cursos de Primer Ciclo de Ingenieria de Software del Plan de Estudio 2015
INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (5, 'ESTRATEGIAS DE APRENDIZAJE E INVESTIGACION',2010107,2,1,4,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (6, 'ETICA DE LA PROFESION',2010106,2,1,4,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (7, 'INTRODUCCION A LA COMPUTACION E INGENIERIA DE SOFTWARE',2020102,4,1,4,1);

INSERT INTO DBSEGSYL.ASIGNATURA(ID_ASIGNATURA, NOMBRE, CODIGO, CREDITAJE, CICLO, ID_PLAN_ESTUDIO, ID_REGIMEN)
			VALUES (8, 'CALCULO I',2020103,4,1,4,1);

--TABLA ROL
INSERT INTO DBSEGSYL.ROL(ID_ROL, NOMBRE, DESCRIPCION)
			VALUES (1, 'ALUMNO', 'ESTUDIANTE DE LA FACULTAD DE INGENIERIA DE SISTEMAS E INFORMATICA');

INSERT INTO DBSEGSYL.ROL(ID_ROL, NOMBRE, DESCRIPCION)
			VALUES (2, 'DOCENTE', 'DOCENTE DE LA FACULTAD DE INGENIERIA DE SISTEMAS E INFORMATICA');

INSERT INTO DBSEGSYL.ROL(ID_ROL, NOMBRE, DESCRIPCION)
			VALUES (3, 'COORDINADOR', 'RESPONSABLE DE GESTIONAR LA ASIGNATURA');

INSERT INTO DBSEGSYL.ROL(ID_ROL, NOMBRE, DESCRIPCION)
			VALUES (4, 'DIRECTOR', 'DIRECTOR DE EAP - FISI ');

INSERT INTO DBSEGSYL.ROL(ID_ROL, NOMBRE, DESCRIPCION)
			VALUES (5, 'DECANO', 'DECANO DE LA FACULTAD DE INGENIERIA DE SISTEMAS E INFORMATICA');

--TABLA USUARIO
INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (1, 'LUCERO DEL PILAR','LIZA PUICAN', 'lliza0796@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (2, 'MAYCON','GUZMAN OSCATEGUI', 'mayconguzman@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (3, 'TAKESHI','FARRO', 'takeshifarro@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (4, 'LUIS','ALARCON', 'lalarcon@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (5, 'BRUNO','FRANCESCOLI', 'brunofrancescoli@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (6, 'DIRECTOR EAP','SW', 'directorsw@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (7, 'DIRECTOR EAP','SISTEMAS', 'directorsistemas@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (8, 'JUEVESAN CARLOS','GONZALES SUAREZ', 'juangonzales@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

INSERT INTO DBSEGSYL.USUARIO (ID_USUARIO, NOMBRE, APELLIDO, CORREO, PASSWORD, TELEFONO, DIRECCION)
			VALUES (9, 'CARLOS','YAÑEZ DURANTE', 'carlosyañes@gmail.com', '1234', 999999999, 'Mz. Q Lote...');

--TABLA DOCENTE
INSERT INTO DBSEGSYL.DOCENTE (ID_USUARIO, GRADO)
			VALUES (4,'POR REGISTRAR');

INSERT INTO DBSEGSYL.DOCENTE (ID_USUARIO, GRADO)
			VALUES (5,'POR REGISTRAR');

INSERT INTO DBSEGSYL.DOCENTE (ID_USUARIO, GRADO)
			VALUES (9,'MAGISTER');

/********************************************************/

--TABLA ASIG_APERTURADA
INSERT INTO DBSEGSYL.ASIGNATURA_APERTURADA (ID_ASIG_APERTURADA, ID_PERIODO, ID_ASIGNATURA, ID_COORDINADOR)
			VALUES (1, 6, 2, 4);

INSERT INTO DBSEGSYL.ASIGNATURA_APERTURADA (ID_ASIG_APERTURADA, ID_PERIODO, ID_ASIGNATURA, ID_COORDINADOR)
			VALUES (2, 6, 6, 5);

INSERT INTO DBSEGSYL.ASIGNATURA_APERTURADA (ID_ASIG_APERTURADA, ID_PERIODO, ID_ASIGNATURA, ID_COORDINADOR)
			VALUES (3, 6, 7, 9);

INSERT INTO DBSEGSYL.ASIGNATURA_APERTURADA (ID_ASIG_APERTURADA, ID_PERIODO, ID_ASIGNATURA, ID_COORDINADOR)
			VALUES (4, 6, 2, 9);

INSERT INTO DBSEGSYL.ASIGNATURA_APERTURADA (ID_ASIG_APERTURADA, ID_PERIODO, ID_ASIGNATURA, ID_COORDINADOR)
			VALUES (5, 6, 6, 4);


/********************************************************/
--TABLA GRUPO
INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(1,1,4);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(2,1,5);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(3,2,5);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(4,1,3);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(5,2,3);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
	    	VALUES(6,3,3);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(7,4,3);

INSERT INTO DBSEGSYL.GRUPO (ID_GRUPO, NUMERO, ID_ASIG_APERTURADA)
			VALUES(8,1,2);

/********************************************************/
--TABLA ESTADO_SYLLABUS 
INSERT INTO DBSEGSYL.ESTADO_SYLLABUS (ID_ESTADO_SYLLABUS, DESCRIPCION)
			VALUES(1, 'EN ESPERA');

INSERT INTO DBSEGSYL.ESTADO_SYLLABUS (ID_ESTADO_SYLLABUS, DESCRIPCION)
			VALUES(2, 'ACEPTADO');

INSERT INTO DBSEGSYL.ESTADO_SYLLABUS (ID_ESTADO_SYLLABUS, DESCRIPCION)
			VALUES(3, 'RECHAZADO');

/********************************************************/
--TABLA SYLLABUS  
INSERT INTO DBSEGSYL.SYLLABUS (ID_SYLLABUS, ID_ESTADO, FECHA_ENTREGA, FECHA_APROBACION, ID_ASIG_APERTURADA)
			VALUES(1, NULL, TO_DATE('15/08/2016','DD/MM/YYYY'), TO_DATE('25/08/2016','DD/MM/YYYY'), 1);

INSERT INTO DBSEGSYL.SYLLABUS (ID_SYLLABUS, ID_ESTADO, FECHA_ENTREGA, FECHA_APROBACION, ID_ASIG_APERTURADA)
			VALUES(2, 2, TO_DATE('15/08/2016','DD/MM/YYYY'), TO_DATE('25/08/2016','DD/MM/YYYY'), 4);

INSERT INTO DBSEGSYL.SYLLABUS (ID_SYLLABUS, ID_ESTADO, FECHA_ENTREGA, FECHA_APROBACION, ID_ASIG_APERTURADA)
			VALUES(3, 3, TO_DATE('15/08/2016','DD/MM/YYYY'), TO_DATE('25/08/2016','DD/MM/YYYY'), 3);

INSERT INTO DBSEGSYL.SYLLABUS (ID_SYLLABUS, ID_ESTADO, FECHA_ENTREGA, FECHA_APROBACION, ID_ASIG_APERTURADA)
			VALUES(4, 2, TO_DATE('15/08/2016','DD/MM/YYYY'), TO_DATE('25/08/2016','DD/MM/YYYY'), 2);

INSERT INTO DBSEGSYL.SYLLABUS (ID_SYLLABUS, ID_ESTADO, FECHA_ENTREGA, FECHA_APROBACION, ID_ASIG_APERTURADA)
			VALUES(5, 1, TO_DATE('15/08/2016','DD/MM/YYYY'), TO_DATE('25/08/2016','DD/MM/YYYY'), 5);

/********************************************************/
--TABLA DIA
INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(1, 'LUNES');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(2, 'MARTES');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(3, 'MIERCOLES');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(4, 'JUEVES');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(5, 'VIERNES');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(6, 'SABADO');

INSERT INTO DBSEGSYL.DIA (ID_DIA, DESCRIPCION)
			VALUES(7, 'DOMINGO');

/********************************************************/
--TABLA TIPO_CLASE
INSERT INTO DBSEGSYL.TIPO_CLASE (ID_TIPO_CLASE, DESCRIPCION)
			VALUES(1, 'TEORIA');

INSERT INTO DBSEGSYL.TIPO_CLASE (ID_TIPO_CLASE, DESCRIPCION)
			VALUES(2, 'PRACTICA');

INSERT INTO DBSEGSYL.TIPO_CLASE (ID_TIPO_CLASE, DESCRIPCION)
			VALUES(3, 'LABORATORIO');

INSERT INTO DBSEGSYL.TIPO_CLASE (ID_TIPO_CLASE, DESCRIPCION)
			VALUES(4, 'OTRO');

/********************************************************/
--TABLA CLASE
INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(1, TO_TIMESTAMP('08:00:00','HH24:MI:SS'), TO_TIMESTAMP('10:00:00','HH24:MI:SS'), 5, 1, 1, 9);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(2, TO_TIMESTAMP('08:00:00','HH24:MI:SS'), TO_TIMESTAMP('10:00:00','HH24:MI:SS'), 1, 1, 1, 4);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(3, TO_TIMESTAMP('10:00:00','HH24:MI:SS'), TO_TIMESTAMP('12:00:00','HH24:MI:SS'), 3, 1, 2, 4);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(4, TO_TIMESTAMP('08:00:00','HH24:MI:SS'), TO_TIMESTAMP('10:00:00','HH24:MI:SS'), 2, 1, 1, 9);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(5, TO_TIMESTAMP('10:00:00','HH24:MI:SS'), TO_TIMESTAMP('12:00:00','HH24:MI:SS'), 2, 2, 2, 9);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(6, TO_TIMESTAMP('08:00:00','HH24:MI:SS'), TO_TIMESTAMP('10:00:00','HH24:MI:SS'), 4, 3, 3, 9);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(7, TO_TIMESTAMP('10:00:00','HH24:MI:SS'), TO_TIMESTAMP('12:00:00','HH24:MI:SS'), 4, 2, 4, 9);

INSERT INTO DBSEGSYL.CLASE (ID_CLASE, HORA_INICIO, HORA_FIN, ID_DIA, ID_TIPO, ID_GRUPO, ID_DOCENTE)
			VALUES(8, TO_TIMESTAMP('10:00:00','HH24:MI:SS'), TO_TIMESTAMP('12:00:00','HH24:MI:SS'), 2, 1, 1, 5);

/********************************************************/
--TABLA ALUMNO
INSERT INTO DBSEGSYL.ALUMNO (ID_EAP, ID_USUARIO, SITUACION)
		 	VALUES(1, 2, 'R');

INSERT INTO DBSEGSYL.ALUMNO (ID_EAP, ID_USUARIO, SITUACION)
		 	VALUES(2, 1, 'R');

INSERT INTO DBSEGSYL.ALUMNO (ID_EAP, ID_USUARIO, SITUACION)
		 	VALUES(1, 3, 'O');


/********************************************************/
--TABLA MATRICULA

INSERT INTO DBSEGSYL.MATRICULA (ID_MATRICULA, ID_ALUMNO, ID_GRUPO)
			VALUES(1, 3, 3);

INSERT INTO DBSEGSYL.MATRICULA (ID_MATRICULA, ID_ALUMNO, ID_GRUPO)
			VALUES(2, 1, 4);

INSERT INTO DBSEGSYL.MATRICULA (ID_MATRICULA, ID_ALUMNO, ID_GRUPO)
			VALUES(3, 3, 1);

/********************************************************/
--TABLA SESION
	--ESTADO EN CODIGO_GENERAL_DET
INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(1, 'I', TO_DATE('11/11/2016','DD/MM/YYYY'), 2);

INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(2, 'T', TO_DATE('12/01/2016','DD/MM/YYYY'), 4);

INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(3, 'P', TO_DATE('17/08/2016','DD/MM/YYYY'), 5);

INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(4, 'C', TO_DATE('17/08/2016','DD/MM/YYYY'), 8);

INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(5, 'C', TO_DATE('17/08/2016','DD/MM/YYYY'), 3);

INSERT INTO DBSEGSYL.SESION (ID_SESION, ESTADO, FECHA, ID_CLASE)
			VALUES(6, 'T', TO_DATE('17/08/2016','DD/MM/YYYY'), 1);

/********************************************************/
--TABLA ASISTENCIA
	--VERIFICACION EN CODIGO_GENERAL_DET
INSERT INTO DBSEGSYL.ASISTENCIA (ID_ASISTENCIA, VERIFICACION, ID_SESION, ID_USUARIO)
			VALUES(1, 'A', 1, 1);

INSERT INTO DBSEGSYL.ASISTENCIA (ID_ASISTENCIA, VERIFICACION, ID_SESION, ID_USUARIO)
			VALUES(2, 'F', 2, 2);

INSERT INTO DBSEGSYL.ASISTENCIA (ID_ASISTENCIA, VERIFICACION, ID_SESION, ID_USUARIO)
			VALUES(3, 'A', 4, 3);

/********************************************************/
--TABLA TEMA

INSERT INTO DBSEGSYL.TEMA (ID_TEMA, DESCRIPCION, UNIDAD, SEMANA, ID_SYLLABUS, ID_TIPO)
			VALUES(1, 'CLASE INTRODUCTORIA', 1, 1, 1, 1);

INSERT INTO DBSEGSYL.TEMA (ID_TEMA, DESCRIPCION, UNIDAD, SEMANA, ID_SYLLABUS, ID_TIPO)
			VALUES(2, 'ASDTX	ASDASD', 3, 2, 2, 2);

INSERT INTO DBSEGSYL.TEMA (ID_TEMA, DESCRIPCION, UNIDAD, SEMANA, ID_SYLLABUS, ID_TIPO)
			VALUES(3, 'GRAFOOOOOOS', 2, 4, 2, 1);

INSERT INTO DBSEGSYL.TEMA (ID_TEMA, DESCRIPCION, UNIDAD, SEMANA, ID_SYLLABUS, ID_TIPO)
			VALUES(4, 'YYYYYYYYYYYYYYYYY', 5, 3, 1, 3);

INSERT INTO DBSEGSYL.TEMA (ID_TEMA, DESCRIPCION, UNIDAD, SEMANA, ID_SYLLABUS, ID_TIPO)
			VALUES(5, 'REEEEEEEEEEEEEEEES', 4, 7, 2, 2);


/********************************************************/
--TABLA REFERENCIA_BIBLIOGRAFICA

INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('EL LIBRO2', 'ANONIMO', 1950, 'LIMA', 'EDITORIAL KASD', 1, 2, '1536738191');

INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('INGENIERIA DE SOFTWARE', 'FEDOR MAUS', 1920, 'MADRID', 'EDITORIAL KYOMNG', 2, 2, '1283485910210');

INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('TEORIA DE ESTRUCTURAS', 'FRANZ LULT', 1960, 'MADRID', 'EDITORIAL KYOMNG', 3, 1, '1239503928');
      
INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('C++ PARA GENIOS', 'MATHEW PEARL', 1990, 'MADRID', 'EDITORIAL SANDERS', 4, 2, '1294388810122');

INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('SISTEMAS CERRADOS', 'MIKHAIL FEDORA', 1980, 'MADRID', 'EDITORIAL PETRO', 5, 1, '1249659174731');

INSERT INTO DBSEGSYL.REFERENCIA_BIBLIOGRAFICA (TITULO, AUTOR, ANIO_PUBLICACION, LUGAR_PUBLICACION, EDITORIAL, ID_REFERENCIA, ID_SYLLABUS, ISBN)
			VALUES('EL EFECTO ALGO QUE NO SE', 'REINALDO ROBLES', 1924, 'MADRID', 'TORIBIO ANYARIN', 6, 1, '1294959021');


/********************************************************/
--TABLA TEMA_X_SESION

INSERT INTO DBSEGSYL.TEMA_X_SESION (ID_TEMA_X_SESION, CUMPLIDO, ID_TEMA,	ID_SESION)
			VALUES(1, 'S', 1, 1);

INSERT INTO DBSEGSYL.TEMA_X_SESION (ID_TEMA_X_SESION, CUMPLIDO, ID_TEMA,	ID_SESION)
			VALUES(2, 'N', 2, 5);

INSERT INTO DBSEGSYL.TEMA_X_SESION (ID_TEMA_X_SESION, CUMPLIDO, ID_TEMA,	ID_SESION)
			VALUES(3, 'S', 4, 2);

INSERT INTO DBSEGSYL.TEMA_X_SESION (ID_TEMA_X_SESION, CUMPLIDO, ID_TEMA,	ID_SESION)
			VALUES(4, 'N', 5, 4);

/********************************************************/
--TABLA TEMA_ADICIONAL

INSERT INTO DBSEGSYL.TEMA_ADICIONAL (ID_TEMA_ADICIONAL, CUMPLIDO, DESCRIPCION, ID_SESION)
			VALUES(1, 'S', 'TEMA DE BASE DE DATOS ', 6);

/********************************************************/
--TABLA VALIDACION_ALUMNO
INSERT INTO DBSEGSYL.VALIDACION_ALUMNO (ID_VALIDACION, CUMPLIDO, COMENTARIO, ID_ALUMNO, ID_TEMA_X_SESION)
			VALUES (1, 1, 'SE CUMPLIO SOLA LA MITAD DEL TEMA', 1, 1);

INSERT INTO DBSEGSYL.VALIDACION_ALUMNO (ID_VALIDACION, CUMPLIDO, COMENTARIO, ID_ALUMNO, ID_TEMA_X_SESION)
			VALUES (2, 1, 'SE CUMPLIO SOLA LA TERCERA PARTE DEL TEMA',1,  2);

INSERT INTO DBSEGSYL.VALIDACION_ALUMNO (ID_VALIDACION, CUMPLIDO,COMENTARIO, ID_ALUMNO, ID_TEMA_X_SESION)
			VALUES (3, 1, 'SE CUMPLIO TODO EL TEMA', 3, 3);


--TABLA COD_GENERAL_DET 
--	(ESTADO -> INICIADA , TERMINADA, EN PROCESO, CANCELADA)
INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (1, 'ESTADO', 'I', 'INICIADA');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (2, 'ESTADO', 'T', 'TERMINADA');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (3, 'ESTADO', 'P', 'EN PROCESO');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (4, 'ESTADO', 'C', 'CANCELADA');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (5, 'VERIFICACION', 'A', 'ASISTIO');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (6, 'VERIFICACION', 'F', 'FALTA');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (7, 'VERIFICACION', 'T', 'TARDANZA');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (8, 'ESTADO_SYLLABUS', 'A', 'ACEPTADO');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (9, 'ESTADO_SYLLABUS', 'R', 'RECHAZADO');

INSERT INTO DBSEGSYL.CODIGO_GENERAL_DET (ID_CODIGO_GENERAL, CODIGO_GENERAL, CODIGO_GENERAL_DET, DESCRIPCION)
			VALUES (10, 'ESTADO_SYLLABUS', 'N', 'NO ENVIADO');

/********************************************************/
--TABLA ROL_X_USUARIO
INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (1, 1, 1);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (2, 2, 1);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (3, 3, 1);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (4, 4, 2);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (5, 4, 3);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (6, 5, 2);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (7, 6, 4);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (8, 7, 4);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (9, 8, 2);

INSERT INTO DBSEGSYL.ROL_X_USUARIO (ID_ROL_X_USUARIO, ID_USUARIO, ID_ROL)
			VALUES (10, 9, 3);
