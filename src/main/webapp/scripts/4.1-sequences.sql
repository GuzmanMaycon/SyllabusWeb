--FECHA ULTIMA MODIFICACION     11/11/2016 15:15PM
/*CREACION DE SECUENCIAS PARA LAS TABLAS */

--Secuencia para la referencia bibliografica
CREATE SEQUENCE DBSEGSYL.SQ_REFERENCIA 
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
       
--Secuencia para asignatura
CREATE SEQUENCE DBSEGSYL.SQ_ASIGNATURA 
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_ASIG_APERTURADA 
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_SYLLABUS
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para usuario
CREATE SEQUENCE DBSEGSYL.SQ_USUARIO 
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para tema
CREATE SEQUENCE DBSEGSYL.SQ_TEMA 
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para tema
CREATE SEQUENCE DBSEGSYL.SQ_TEMA_ADICIONAL
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
 
--Secuencia para tema
CREATE SEQUENCE DBSEGSYL.SQ_TEMA_X_SESION
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
       
--Secuencia para tema
CREATE SEQUENCE DBSEGSYL.SQ_VAL_ALUMNO
       START WITH 10
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
             
/***********************************************************/
--Secuencia para la referencia bibliografica
/*
CREATE SEQUENCE DBSEGSYL.SQ_REFERENCIA 
       START WITH ( SELECT MAX(ID_REFERENCIA) 
                      FROM DBSEGSYL.REFERENCIA_BIBLIOGRAFICA;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:
       
--Secuencia para asignatura
CREATE SEQUENCE DBSEGSYL.SQ_ASIGNATURA 
       START WITH ( SELECT MAX(ID_ASIGNATURA) 
                      FROM DBSEGSYL.ASIGNATURA;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_ASIG_APERTURADA 
       START WITH ( SELECT MAX(ID_ASIG_APERTURADA) 
                      FROM DBSEGSYL.ASIG_APERTURADA;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_SYLLABUS
       START WITH ( SELECT MAX(ID_SYLLABUS) 
                      FROM DBSEGSYL.SYLLABUS;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:

--Secuencia para usuario
CREATE SEQUENCE DBSEGSYL.SQ_USUARIO 
       START WITH ( SELECT MAX(ID_USUARIO) 
                      FROM DBSEGSYL.USUARIO;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:

--Secuencia para tema
CREATE SEQUENCE DBSEGSYL.SQ_TEMA 
       START WITH ( SELECT MAX(ID_TEMA) 
                      FROM DBSEGSYL.TEMA;) 
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE:
*/