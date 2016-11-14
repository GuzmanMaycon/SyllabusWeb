/* Version Actualizada al 13/11/2016 6:43PM
    --LPLP
*/
CREATE INDEX DBSEGSYL.IDXPERIODO ON DBSEGSYL.PERIODO
(ID_PERIODO)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.PERIODO ADD (
  CONSTRAINT XPKPERIODO
  PRIMARY KEY
  (ID_PERIODO)
  USING INDEX DBSEGSYL.IDXPERIODO
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXASIGNATURA ON DBSEGSYL.ASIGNATURA
(ID_ASIGNATURA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ASIGNATURA ADD (
  CONSTRAINT XPKASIGNATURA
  PRIMARY KEY
  (ID_ASIGNATURA)
  USING INDEX DBSEGSYL.IDXASIGNATURA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXASIGAPERTURADA ON DBSEGSYL.ASIGNATURA_APERTURADA
(ID_ASIG_APERTURADA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ASIGNATURA_APERTURADA ADD (
  CONSTRAINT XPKASIG_APERTURADA
  PRIMARY KEY
  (ID_ASIG_APERTURADA)
  USING INDEX DBSEGSYL.IDXASIGAPERTURADA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXGRUPO ON DBSEGSYL.GRUPO
(ID_GRUPO)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.GRUPO ADD (
  CONSTRAINT XPKGRUPO
  PRIMARY KEY
  (ID_GRUPO)
  USING INDEX DBSEGSYL.IDXGRUPO
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXESTADO_SYLLABUS ON DBSEGSYL.ESTADO_SYLLABUS
(ID_ESTADO_SYLLABUS)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ESTADO_SYLLABUS ADD (
  CONSTRAINT XPKESTADO_SYLLABUS
  PRIMARY KEY
  (ID_ESTADO_SYLLABUS)
  USING INDEX DBSEGSYL.IDXESTADO_SYLLABUS
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXSYLLABUS ON DBSEGSYL.SYLLABUS
(ID_SYLLABUS)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.SYLLABUS ADD (
  CONSTRAINT XPKSYLLABUS
  PRIMARY KEY
  (ID_SYLLABUS)
  USING INDEX DBSEGSYL.IDXSYLLABUS
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXREGIMEN ON DBSEGSYL.REGIMEN
(ID_REGIMEN)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.REGIMEN ADD (
  CONSTRAINT XPKREGIMEN
  PRIMARY KEY
  (ID_REGIMEN)
  USING INDEX DBSEGSYL.IDXREGIMEN
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXCLASE ON DBSEGSYL.CLASE
(ID_CLASE)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.CLASE ADD (
  CONSTRAINT XPKCLASE
  PRIMARY KEY
  (ID_CLASE)
  USING INDEX DBSEGSYL.IDXCLASE
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXTIPO_CLASE ON DBSEGSYL.TIPO_CLASE
(ID_TIPO_CLASE)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.TIPO_CLASE ADD (
  CONSTRAINT XPKTIPO_CLASE
  PRIMARY KEY
  (ID_TIPO_CLASE)
  USING INDEX DBSEGSYL.IDXTIPO_CLASE
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXPLAN_ESTUDIO ON DBSEGSYL.PLAN_DE_ESTUDIO
(ID_PLAN_ESTUDIO)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.PLAN_DE_ESTUDIO ADD (
  CONSTRAINT XPKPLAN_DE_ESTUDIO
  PRIMARY KEY
  (ID_PLAN_ESTUDIO)
  USING INDEX DBSEGSYL.IDXPLAN_ESTUDIO
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXEAP ON DBSEGSYL.EAP
(ID_EAP)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.EAP ADD (
  CONSTRAINT XPKEAP
  PRIMARY KEY
  (ID_EAP)
  USING INDEX DBSEGSYL.IDXEAP
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXMATRICULA ON DBSEGSYL.MATRICULA
(ID_MATRICULA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.MATRICULA ADD (
  CONSTRAINT XPKMATRICULA
  PRIMARY KEY
  (ID_MATRICULA)
  USING INDEX DBSEGSYL.IDXMATRICULA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXUSUARIO ON DBSEGSYL.USUARIO
(ID_USUARIO)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.USUARIO ADD (
  CONSTRAINT XPKUSUARIO
  PRIMARY KEY
  (ID_USUARIO)
  USING INDEX DBSEGSYL.IDXUSUARIO
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXSESION ON DBSEGSYL.SESION
(ID_SESION)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.SESION ADD (
  CONSTRAINT XPKSESION
  PRIMARY KEY
  (ID_SESION)
  USING INDEX DBSEGSYL.IDXSESION
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXASISTENCIA ON DBSEGSYL.ASISTENCIA
(ID_ASISTENCIA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ASISTENCIA ADD (
  CONSTRAINT XPKASISTENCIA
  PRIMARY KEY
  (ID_ASISTENCIA)
  USING INDEX DBSEGSYL.IDXASISTENCIA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXTEMA ON DBSEGSYL.TEMA
(ID_TEMA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.TEMA ADD (
  CONSTRAINT XPKTEMA
  PRIMARY KEY
  (ID_TEMA)
  USING INDEX DBSEGSYL.IDXTEMA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXREFERENCIA ON DBSEGSYL.REFERENCIA_BIBLIOGRAFICA
(ID_REFERENCIA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.REFERENCIA_BIBLIOGRAFICA ADD (
  CONSTRAINT XPKREFERENCIA_BIBLIOGRAFICA
  PRIMARY KEY
  (ID_REFERENCIA)
  USING INDEX DBSEGSYL.IDXREFERENCIA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXTEMA_X_SESION ON DBSEGSYL.TEMA_X_SESION
(ID_TEMA_X_SESION)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.TEMA_X_SESION ADD (
  CONSTRAINT XPKTEMA_X_SESION
  PRIMARY KEY
  (ID_TEMA_X_SESION)
  USING INDEX DBSEGSYL.IDXTEMA_X_SESION
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXROL ON DBSEGSYL.ROL
(ID_ROL)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ROL ADD (
  CONSTRAINT XPKROL
  PRIMARY KEY
  (ID_ROL)
  USING INDEX DBSEGSYL.IDXROL
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXDIA ON DBSEGSYL.DIA
(ID_DIA)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.DIA ADD (
  CONSTRAINT XPKDIA
  PRIMARY KEY
  (ID_DIA)
  USING INDEX DBSEGSYL.IDXDIA
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXTEMA_ADICIONAL ON DBSEGSYL.TEMA_ADICIONAL
(ID_TEMA_ADICIONAL)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;


ALTER TABLE DBSEGSYL.TEMA_ADICIONAL ADD (
  CONSTRAINT XPKTEMA_ADICIONAL
  PRIMARY KEY
  (ID_TEMA_ADICIONAL)
  USING INDEX DBSEGSYL.IDXTEMA_ADICIONAL
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXVALIDACION_ALUMNO ON DBSEGSYL.VALIDACION_ALUMNO
(ID_VALIDACION)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.VALIDACION_ALUMNO ADD (
  CONSTRAINT XPKVALIDACION_ALUMNO
  PRIMARY KEY
  (ID_VALIDACION)
  USING INDEX DBSEGSYL.IDXVALIDACION_ALUMNO
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXCOD_GRAL_DET ON DBSEGSYL.CODIGO_GENERAL_DET
(ID_CODIGO_GENERAL)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.CODIGO_GENERAL_DET ADD (
  CONSTRAINT XPKCOD_GRAL_DET
  PRIMARY KEY
  (ID_CODIGO_GENERAL)
  USING INDEX DBSEGSYL.IDXCOD_GRAL_DET
  ENABLE VALIDATE);

CREATE INDEX DBSEGSYL.IDXROL_X_USUARIO ON DBSEGSYL.ROL_X_USUARIO
(ID_ROL_X_USUARIO)
LOGGING
TABLESPACE TS_SEGSYL
PCTFREE    10
INITRANS   2
MAXTRANS   255
STORAGE    (
            INITIAL          64K
            NEXT             1M
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
            FLASH_CACHE      DEFAULT
            CELL_FLASH_CACHE DEFAULT
           )
NOPARALLEL;

ALTER TABLE DBSEGSYL.ROL_X_USUARIO ADD (
  CONSTRAINT XPKROL_X_USUARIO
  PRIMARY KEY
  (ID_ROL_X_USUARIO)
  USING INDEX DBSEGSYL.IDXROL_X_USUARIO
  ENABLE VALIDATE);

ALTER TABLE DBSEGSYL.DOCENTE ADD( 
  CONSTRAINT XPKDOCENTE PRIMARY KEY
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.ALUMNO ADD( 
  CONSTRAINT XPKALUMNO PRIMARY KEY
  (ID_USUARIO)
);

/*============================
          FOREIGN KEYS 
==============================*/

ALTER TABLE DBSEGSYL.CLASE ADD (
  CONSTRAINT CLASE_TIPO_CLASE_FK FOREIGN KEY
  (ID_TIPO)
  REFERENCES DBSEGSYL.TIPO_CLASE
  (ID_TIPO_CLASE)
);

ALTER TABLE DBSEGSYL.CLASE ADD (
  CONSTRAINT CLASE_GRUPO_FK FOREIGN KEY
  (ID_GRUPO)
  REFERENCES DBSEGSYL.GRUPO
  (ID_GRUPO)
);

ALTER TABLE DBSEGSYL.CLASE ADD (
  CONSTRAINT CLASE_DIA_FK FOREIGN KEY
  (ID_DIA)
  REFERENCES DBSEGSYL.DIA
  (ID_DIA)
);

ALTER TABLE DBSEGSYL.CLASE ADD( 
  CONSTRAINT CLASE_DOCENTE_FK FOREIGN KEY
  (ID_DOCENTE)
  REFERENCES DBSEGSYL.DOCENTE
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.PLAN_DE_ESTUDIO ADD(
  CONSTRAINT PLAN_DE_ESTUDIO_EAP_FK FOREIGN KEY
  (ID_EAP)
  REFERENCES DBSEGSYL.EAP
  (ID_EAP)
);

ALTER TABLE DBSEGSYL.MATRICULA ADD(
  CONSTRAINT MATRICULA_ALUMNO_FK FOREIGN KEY
  (ID_ALUMNO)
  REFERENCES DBSEGSYL.ALUMNO
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.MATRICULA ADD(
  CONSTRAINT MATRICULA_GRUPO_FK FOREIGN KEY
  (ID_GRUPO)
  REFERENCES DBSEGSYL.GRUPO
  (ID_GRUPO)
);

ALTER TABLE DBSEGSYL.ALUMNO ADD( 
  CONSTRAINT ALUMNO_EAP_FK FOREIGN KEY
  (ID_EAP)
  REFERENCES DBSEGSYL.EAP
  (ID_EAP)
);

ALTER TABLE DBSEGSYL.ALUMNO ADD(
  CONSTRAINT ALUMNO_USUARIO_FK FOREIGN KEY
  (ID_USUARIO)
  REFERENCES DBSEGSYL.USUARIO
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.DOCENTE ADD(
  CONSTRAINT DOCENTE_USUARIO_FK FOREIGN KEY
  (ID_USUARIO)
  REFERENCES DBSEGSYL.USUARIO
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.SESION ADD(
  CONSTRAINT SESION_CLASE_FK FOREIGN KEY
  (ID_CLASE)
  REFERENCES DBSEGSYL.CLASE
  (ID_CLASE)
);

ALTER TABLE DBSEGSYL.ASISTENCIA ADD(
  CONSTRAINT ASISTENCIA_SESION_FK FOREIGN KEY
  (ID_SESION)
  REFERENCES DBSEGSYL.SESION
  (ID_SESION)
);

ALTER TABLE DBSEGSYL.ASISTENCIA ADD(
  CONSTRAINT ASISTENCIA_USUARIO_FK FOREIGN KEY
  (ID_USUARIO)
  REFERENCES DBSEGSYL.USUARIO
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.TEMA ADD(
  CONSTRAINT TEMA_SYLLABUS_FK FOREIGN KEY
  (ID_SYLLABUS)
  REFERENCES DBSEGSYL.SYLLABUS
  (ID_SYLLABUS)
);

ALTER TABLE DBSEGSYL.REFERENCIA_BIBLIOGRAFICA ADD(
  CONSTRAINT REFERENCIA_SYLLABUS_FK FOREIGN KEY
  (ID_SYLLABUS)
  REFERENCES DBSEGSYL.SYLLABUS
  (ID_SYLLABUS)
);

ALTER TABLE DBSEGSYL.TEMA_X_SESION ADD(
  CONSTRAINT TEMA_X_SESION_TEMA_FK FOREIGN KEY
  (ID_TEMA)
  REFERENCES DBSEGSYL.TEMA
  (ID_TEMA)
);

ALTER TABLE DBSEGSYL.TEMA_X_SESION ADD(
  CONSTRAINT TEMA_X_SESION_SESION_FK FOREIGN KEY
  (ID_SESION)
  REFERENCES DBSEGSYL.SESION
  (ID_SESION)
);  

--01/11/2016
ALTER TABLE DBSEGSYL.ASIGNATURA ADD(
  CONSTRAINT ASIGNATURA_PLAN_ESTUDIO_FK FOREIGN KEY
  (ID_PLAN_ESTUDIO)
  REFERENCES DBSEGSYL.PLAN_DE_ESTUDIO
  (ID_PLAN_ESTUDIO)
);

ALTER TABLE DBSEGSYL.ASIGNATURA ADD(
  CONSTRAINT ASIGNATURA_REGIMEN_FK FOREIGN KEY
  (ID_REGIMEN)
  REFERENCES DBSEGSYL.REGIMEN
  (ID_REGIMEN)
);

---ASIGNATURA APERTURADA

ALTER TABLE DBSEGSYL.ASIGNATURA_APERTURADA ADD(
  CONSTRAINT ASIG_APERTURADA_PERIODO_FK FOREIGN KEY
  (ID_PERIODO)
  REFERENCES DBSEGSYL.PERIODO
  (ID_PERIODO)
);

ALTER TABLE DBSEGSYL.ASIGNATURA_APERTURADA ADD(
  CONSTRAINT ASIG_APERTURADA_ASIGNATURA_FK FOREIGN KEY
  (ID_ASIGNATURA)
  REFERENCES DBSEGSYL.ASIGNATURA
  (ID_ASIGNATURA)
);

ALTER TABLE DBSEGSYL.ASIGNATURA_APERTURADA ADD(
  CONSTRAINT ASIG_APERTURADA_COORDINADOR_FK FOREIGN KEY
  (ID_COORDINADOR)
  REFERENCES DBSEGSYL.DOCENTE
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.GRUPO ADD(
  CONSTRAINT GRUPO_ASIG_APERTURADA_FK FOREIGN KEY
  (ID_ASIG_APERTURADA)
  REFERENCES DBSEGSYL.ASIGNATURA_APERTURADA
  (ID_ASIG_APERTURADA)
);

ALTER TABLE DBSEGSYL.SYLLABUS ADD(
  CONSTRAINT SYLL_ASIG_APERTURADA_FK FOREIGN KEY
  (ID_ASIG_APERTURADA)
  REFERENCES DBSEGSYL.ASIGNATURA_APERTURADA
  (ID_ASIG_APERTURADA)
);

--10/11/2016
ALTER TABLE DBSEGSYL.VALIDACION_ALUMNO ADD(
  CONSTRAINT VAL_ALUMNO_TEMA_X_SESION_FK FOREIGN KEY
  (ID_TEMA_X_SESION)
  REFERENCES DBSEGSYL.TEMA_X_SESION
  (ID_TEMA_X_SESION)
);

ALTER TABLE DBSEGSYL.VALIDACION_ALUMNO ADD(
  CONSTRAINT VAL_ALUMNO_ALUMNO_FK FOREIGN KEY
  (ID_ALUMNO)
  REFERENCES DBSEGSYL.ALUMNO
  (ID_USUARIO)
);

ALTER TABLE DBSEGSYL.TEMA_ADICIONAL ADD(
  CONSTRAINT TEMA_ADICIONAL_SESION_FK FOREIGN KEY
  (ID_SESION)
  REFERENCES DBSEGSYL.SESION
  (ID_SESION)
);

ALTER TABLE DBSEGSYL.TEMA ADD(
  CONSTRAINT TEMA_TIPO_CLASE_FK FOREIGN KEY
  (ID_TIPO)
  REFERENCES DBSEGSYL.TIPO_CLASE
  (ID_TIPO_CLASE)
);

ALTER TABLE DBSEGSYL.SYLLABUS ADD(
  CONSTRAINT SYLLABUS_ESTADO_SYLLABUS_FK FOREIGN KEY
  (ID_ESTADO)
  REFERENCES DBSEGSYL.ESTADO_SYLLABUS
  (ID_ESTADO_SYLLABUS)
);

ALTER TABLE DBSEGSYL.ROL_X_USUARIO ADD(
  CONSTRAINT ROL_X_USUARIO_ROL_FK FOREIGN KEY
  (ID_ROL)
  REFERENCES DBSEGSYL.ROL
  (ID_ROL)
);

ALTER TABLE DBSEGSYL.ROL_X_USUARIO ADD(
  CONSTRAINT ROL_X_USUARIO_USUARIO_FK FOREIGN KEY
  (ID_USUARIO)
  REFERENCES DBSEGSYL.USUARIO
  (ID_USUARIO)
);