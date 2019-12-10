DROP DATABASE IF EXISTS COSECHANDO;
CREATE DATABASE IF NOT EXISTS COSECHANDO;
USE COSECHANDO;




DROP TABLE IF EXISTS USUARIO;
CREATE TABLE IF NOT EXISTS USUARIO(
USUARIO_ID	VARCHAR(8)	PRIMARY KEY,
NOMBRE_U	VARCHAR(50)	NOT NULL,
APELLIDO_U	VARCHAR(50)	NOT NULL,
CORREO_U	VARCHAR(70)	NOT NULL UNIQUE,
PASSWORD_U	VARCHAR(50) NOT NULL,
FECHA_NAC	DATE,
CUENTA_ACCESO_U	TINYINT,
NIVEL_ID	CHAR(8),
TIPOUSUARIO_ID CHAR(8)
);


DROP TABLE IF EXISTS TIPOUSUARIO;
CREATE TABLE IF NOT EXISTS TIPOUSUARIO(
TIPOUSUARIO_ID	CHAR(8)	PRIMARY KEY,
TIPO	VARCHAR(50)	NOT NULL,
DESCRIPCION	VARCHAR(100)
);


DROP TABLE IF EXISTS TERRENO;
CREATE TABLE IF NOT EXISTS TERRENO(
TERRENO_ID	CHAR(8)	PRIMARY KEY,
COORDENADAS	VARCHAR(50) NOT NULL,
TAMANIO_T	VARCHAR(20),
USUARIO_ID	CHAR(8),
REGION_ID	CHAR(8),
DIRECCION_ID CHAR(8)
);

DROP TABLE IF EXISTS DIRECCION;
CREATE TABLE DIRECCION(
DIRECCION_ID	CHAR(8) PRIMARY KEY,
CALLE	VARCHAR(30),
NUMERO	VARCHAR(6),
COLONIA	VARCHAR(30));

DROP TABLE IF EXISTS REGION;
CREATE TABLE IF NOT EXISTS REGION(
REGION_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_RE	VARCHAR(50)	NOT NULL,
MUNICIPIO_ID	VARCHAR(50),
TIPOSUELO_ID	CHAR(8)
);


DROP TABLE IF EXISTS TIPOSUELO;
CREATE TABLE IF NOT EXISTS TIPOSUELO(
TIPOSUELO_ID	CHAR(8)	PRIMARY KEY,
NOMBRE	VARCHAR(100)	NOT NULL,
REGION_ID	CHAR(8)
);


DROP TABLE IF EXISTS NIVEL;
CREATE TABLE IF NOT EXISTS NIVEL(
NIVEL_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_N	VARCHAR(30)	NOT NULL,
DESCRIPCION_N	VARCHAR(100)
);


DROP TABLE IF EXISTS RECOMPENSA;
CREATE TABLE IF NOT EXISTS RECOMPENSA(
RECOMPENSA_ID	CHAR(8)	PRIMARY KEY,
RECOMPENSA_R	VARCHAR(30)	NOT NULL,
DESCRIPCION_R	VARCHAR(100)	NOT NULL,
PROMOTOR_ID	CHAR(8)
);


DROP TABLE IF EXISTS NIVEL_RECOMPENSA;
CREATE TABLE IF NOT EXISTS NIVEL_RECOMPENSA(
NIVEL_ID	CHAR(8),
RECOMPENSA_ID	CHAR(8)
);


DROP TABLE IF EXISTS PLANTA;
CREATE TABLE IF NOT EXISTS PLANTA(
PLANTA_ID	INT(8) AUTO_INCREMENT	PRIMARY KEY,
NOMBRE_P  VARCHAR(50)   NOT NULL,
TAMANO_P	VARCHAR(10),
TIPO	VARCHAR(50)	NOT NULL,
DESCRIPCION_P    TEXT    NOT NULL
);


DROP TABLE IF EXISTS CUIDADOS;
CREATE TABLE IF NOT EXISTS CUIDADOS(
CUIDADO_ID	CHAR(8)	PRIMARY KEY,
TIEMPOEJECUCION_CU	TIME,
FECHAAPLICACION_CU	DATE	NOT NULL,
RECURSOS_CU	VARCHAR(255)	NOT NULL
);


DROP TABLE IF EXISTS CUIDADOS_PLANTA;
CREATE TABLE IF NOT EXISTS CUIDADOS_PLANTA(
PLANTA_ID	INT(8),
CUIDADO_ID	CHAR(8)
);


DROP TABLE IF EXISTS REGIONPLANTA;
CREATE TABLE IF NOT EXISTS REGIONPLANTA(
REGION_ID	CHAR(8),
PLANTA_ID	INT(8)
);


DROP TABLE IF EXISTS MUNICIPIO;
CREATE TABLE IF NOT EXISTS MUNICIPIO(
MUNICIPIO_ID	CHAR(8)	PRIMARY KEY,
NOMBRE_M	VARCHAR(100)	NOT NULL,
ESTADO_M	VARCHAR(100)	NOT NULL
);


DROP TABLE IF EXISTS PROMOTORES;
CREATE TABLE IF NOT EXISTS PROMOTORES(
PROMOTOR_ID CHAR(8)	PRIMARY KEY,
NOMBRE_PR	VARCHAR(25)	NOT NULL,
DESCRIPCION_PR	VARCHAR(255),
NUMCONVENIO_PR	CHAR(7) NOT NULL
);


ALTER TABLE USUARIO ADD FOREIGN KEY (NIVEL_ID) REFERENCES NIVEL(NIVEL_ID);
ALTER TABLE USUARIO ADD FOREIGN KEY (TIPOUSUARIO_ID) REFERENCES TIPOUSUARIO(TIPOUSUARIO_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (USUARIO_ID) REFERENCES USUARIO(USUARIO_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (REGION_ID) REFERENCES REGION(REGION_ID);
ALTER TABLE TERRENO ADD FOREIGN KEY (DIRECCION_ID) REFERENCES DIRECCION(DIRECCION_ID);
ALTER TABLE NIVEL_RECOMPENSA ADD FOREIGN KEY (NIVEL_ID) REFERENCES NIVEL(NIVEL_ID);
ALTER TABLE NIVEL_RECOMPENSA ADD FOREIGN KEY (RECOMPENSA_ID) REFERENCES RECOMPENSA(RECOMPENSA_ID);
ALTER TABLE CUIDADOS_PLANTA ADD FOREIGN KEY (CUIDADO_ID) REFERENCES CUIDADOS(CUIDADO_ID);
ALTER TABLE CUIDADOS_PLANTA ADD FOREIGN KEY (PLANTA_ID) REFERENCES PLANTA(PLANTA_ID);
ALTER TABLE RECOMPENSA ADD FOREIGN KEY (PROMOTOR_ID) REFERENCES PROMOTORES(PROMOTOR_ID);
ALTER TABLE REGIONPLANTA ADD FOREIGN KEY(REGION_ID) REFERENCES REGION(REGION_ID);
ALTER TABLE REGIONPLANTA ADD FOREIGN KEY(PLANTA_ID) REFERENCES PLANTA(PLANTA_ID);
ALTER TABLE REGION ADD FOREIGN KEY(MUNICIPIO_ID) REFERENCES MUNICIPIO(MUNICIPIO_ID);
ALTER TABLE REGION ADD FOREIGN KEY(TIPOSUELO_ID) REFERENCES TIPOSUELO(TIPOSUELO_ID);


INSERT INTO PROMOTORES(PROMOTOR_ID, NOMBRE_PR, DESCRIPCION_PR, NUMCONVENIO_PR) VALUES
('PROMO001','SAGARPA','SECRETARIA DE AGRICULTURA Y DESARROLLO RURAL','0000001'),
('PROMO002','DDRT','DISTRITO DE DESARROLLO RURAL DE TULANCINGO','0000002'),
('PROMO003','CADER','CENTRO DE APOYO AL DESARROLLO RURAL','0000003');

INSERT INTO MUNICIPIO(MUNICIPIO_ID, NOMBRE_M, ESTADO_M)VALUES
('MUNIC001', 'TULANCINGO DE BRAVO', 'HIDALGO'),
('MUNIC002', 'CUAUTEPEC DE HINOJOSA','HIDALGO'),
('MUNIC003', 'SANTIAGO TULANTEPEC DE LUGO GUERRERO', 'HIDALGO');

INSERT INTO NIVEL(NIVEL_ID, NOMBRE_N, DESCRIPCION_N) VALUES
('NIVEL001','INICIAL','NIVEL DE INICIO PARA LOS USUARIOS'),
('NIVEL002','PRINCIPIANTE','EL SEGUNDO NIVEL ALCANZADO POR UN USUARIO'),
('NIVEL003','INTERMEDIO','EL NIVEL MEDIO PARA CADA UNO DE LOS USUARIOS'),
('NIVEL004','AVANZADO 1', 'EL ULTIMO NIVEL DE UN USUARIO'),
('NIVEL005','AVANZADO 2', 'NIVEL OTORGADO A LOS USUARIOS MAS ANTIGUOS');

INSERT INTO TIPOUSUARIO(TIPOUSUARIO_ID,TIPO,DESCRIPCION) VALUES
('TUSER001','ADMINISTRADOR','USUARIO CAPAZ DE MODIFICAR ARTICULOS'),
('TUSER002','PROMOTOR','USUARIO CAPAZ DE PUBLICAR INFORMACION'),
('TUSER003','ORDINARIO','USUARIO PROMEDIO');

INSERT INTO TIPOSUELO(TIPOSUELO_ID,NOMBRE,REGION_ID) VALUES
('SUELO001','ANDOSOL','REGION_ID'),
('SUELO002','LUBISOL','REGION_ID'),
('SUELO003','PAHEOZEM','REGION_ID'),
('SUELO004','REGOSOL','REGION_ID'),
('SUELO005','VERTISOL','REGION_ID');


INSERT INTO PLANTA (NOMBRE_P, TAMANO_P,TIPO, DESCRIPCION_P) VALUES
('ENCINO', 'GRANDE', 'MADEDERO', 'UN ARBOL QUE PUEDE PRACTICAMENTE EN CUALQUIER PARTE'),
('PINO','MED-GDE','MADEDERO','ESTE ARBOL SE DESARROLLA DE MEJOR MANERA DENTRO DEL SUELO LUVISOL'),
('OYAMEL','MED-GDE','ARBOL','UN TIPO DE ARBOL MUY COMUN DE VER CERCA DE SUELO VOLCANICO'),
('PALO ZOPILOTE','GRANDE','MEDICINAL','LA SEMILLA DE ESTE ARBOL SE UTILIZA PARA EL TRATAMIENTO CONTRA LA DIABETES'),
('OCOTE','GRANDE','ARBOL','ESTE ARBOL SE DESARROLLA DE MEJOR MANERA DENTRO DEL SUELO LUVISOL'),
('JUNIPERUS','PEQUEÑO','ARBUSTO','UNA SUB-ESPECIE DE PINO QUE PODEMOS VER EN CALLES Y CARRETERAS'),
('AYACAHUITE','GRANDE','MADEDERO','SUB-ESPECIE DEL PINO QUE CRECE EN SUELO LUVISOL'),
('PINO CHIMONQUE','MEDIANO','MEDICINAL','CRECE EN SUELO LUVISOL, SE PUEDE HACER TE CON SU CORTEZA PARA LA TOS'),
('OOCARPA','MED-GDE','ARBOL','CRECE CERCA DE RIOS EN SUELO REGOSOL, SE CREE QUE ES UNA ESPECIE MADRE'),
('MAGUEY','MED','COSECHA/EXTRACCION','CRECE EN EL SUELO REGOZOL, EN TEMPORADA SE EXTRAEN LOS GUSANOS DE MAGUEY Y EL AGAVE'),
('NOPAL','MEDIANO','COSECHA/COMESTIBLE','CRECE EN SUELO REGOZOL, DE EL SE EXTRAEN LAS TUNAS, Y TAMBIEN SON COMESTIBLES'),
('MEZQUITE','CH-MED','MEDICINAL-MADERERO','FACIL DE ENCONTRAR EN SUELO REGOZOL, SU MADERA SE UTILIZA PARA HACER MUEBLES Y SUS HOJAS SIRVEN PARA EL TRATAMIENTO DE ENFERMEDADES OCULARES'),
('CARDON','MEDIANO','CACTUS','SE PUEDE ENCONTRAR EN CUALQUIER TIPO DE SUELO'),
('PIRUL','CH-MED','MEDICINAL','ESTA PLANTA SE UTILIZA COMO CICATRIZANTE NATURAL, FACIL DE ENCONTRAR EN SUELO LUVISOL');


#Procedimiento que crea el identidicador de la tabla usuario automáticamente
DROP PROCEDURE IF EXISTS Creacion_id_terreno;

DELIMITER //
CREATE PROCEDURE Creacion_id_terreno(
	IN PRO_COORDENADAS	VARCHAR(50),
    IN PRO_TAMANIO_T	VARCHAR(20),
    IN PRO_CORREO	VARCHAR(70))
    BEGIN
    
		SET @CONTADOR = (SELECT COUNT(*) FROM TERRENO);
		SET @YUKO = (SELECT(CONCAT('TERR',@CONTADOR)));
        SET @USUARIO = (SELECT USUARIO_ID FROM USUARIO WHERE CORREO_U = PRO_CORREO);
		INSERT INTO TERRENO(TERRENO_ID,COORDENADAS,TAMANIO_T,USUARIO_ID) 
        VALUES (@YUKO,PRO_COORDENADAS,PRO_TAMANIO_T,@USUARIO);    
        
    END //
DELIMITER ;

SELECT * FROM TERRENO;

#Procedimiento que crea el identidicador de la tabla usuario automáticamente
DROP PROCEDURE IF EXISTS Creacion_id_usuario;

DELIMITER //
CREATE PROCEDURE Creacion_id_usuario(
	IN PRO_NOMBRE_U	VARCHAR(50),
    IN PRO_APELLIDO_U	VARCHAR(50),
    IN PRO_CORREO_U	VARCHAR(70),
    IN PRO_PASSWORD_U VARCHAR(50),
    IN PRO_FECHA_NAC DATE)
    BEGIN
    
		SET @CONTADOR = (SELECT COUNT(*) FROM USUARIO);
		SET @YUKO = (SELECT(CONCAT('USER',@CONTADOR)));
		INSERT INTO USUARIO(USUARIO_ID,NOMBRE_U,APELLIDO_U,CORREO_U,PASSWORD_U,FECHA_NAC)
        VALUES (@YUKO,PRO_NOMBRE_U,PRO_APELLIDO_U,PRO_CORREO_U,PRO_PASSWORD_U,PRO_FECHA_NAC);    
        
    END //
DELIMITER ;

SELECT * FROM USUARIO;

select database();