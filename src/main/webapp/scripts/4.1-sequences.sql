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

CREATE SEQUENCE DBSEGSYL.SQ_REFERENCIA 
       START WITH 7
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
       
--Secuencia para asignatura
CREATE SEQUENCE DBSEGSYL.SQ_ASIGNATURA 
       START WITH 12
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_ASIG_APERTURADA 
       START WITH 11
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;

--Secuencia para asignatura aperturada
CREATE SEQUENCE DBSEGSYL.SQ_SYLLABUS
       START WITH 5 
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
       START WITH 6
       INCREMENT BY 1 
       NOCACHE
       NOCYCLE;
