/*CREACIÓN DE TABLAS*/
/* Avatar, Login, Rol.*/

DROP DATABASE IF EXISTS `SUBASTA`;
CREATE DATABASE `SUBASTA` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
--
-- SELECCIONAMOS PARA USAR
--
USE `SUBASTA`;
--
-- DAMOS PERMISO USO Y BORRAMOS EL USUARIO QUE QUEREMOS CREAR POR SI EXISTE
--
GRANT USAGE ON * . * TO `SUBASTA`@`localhost`;
	DROP USER `SUBASTA`@`localhost`;

--
-- CREAMOS EL USUARIO Y LE DAMOS PASSWORD,DAMOS PERMISO DE USO Y DAMOS PERMISOS SOBRE LA BASE DE DATOS.
--
CREATE USER IF NOT EXISTS `SUBASTA`@`localhost` IDENTIFIED BY 'pass2018';
GRANT USAGE ON *.* TO `SUBASTA`@`localhost` REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;
GRANT ALL PRIVILEGES ON `SUBASTA`.* TO `SUBASTA`@`localhost` WITH GRANT OPTION;
--
-- Estructura de tabla para la tabla `datos`
--

CREATE TABLE IF NOT EXISTS USUARIO(
	LOGIN VARCHAR(15) NOT NULL,
	PASSWORD VARCHAR(128) NOT NULL,
	EMAIL VARCHAR(60) NOT NULL,
	DNI VARCHAR(9) NOT NULL,
	NOMBRE VARCHAR(30) NOT NULL,
	DIRECCION VARCHAR(60) NOT NULL,
	APELLIDOS VARCHAR(50) NOT NULL,
	AVATAR VARCHAR(60) NOT NULL,
	ROL ENUM('ADMINISTRADOR','PUJADOR','SUBASTADOR') NOT NULL,
	ESTADO ENUM('PENDIENTE','CREADO') NOT NULL,
	LOGIN_ADMIN VARCHAR(15),
	CONSTRAINT PK_USUARIO PRIMARY KEY(LOGIN)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
ALTER TABLE USUARIO ADD FOREIGN KEY(LOGIN_ADMIN) REFERENCES USUARIO(LOGIN);

INSERT INTO USUARIO VALUES('admin','admin','','','','','','','ADMINISTRADOR','CREADO',NULL);

CREATE TABLE IF NOT EXISTS SUBASTA(

	ID INT AUTO_INCREMENT NOT NULL,
	TIPO ENUM('CIEGA','NO CIEGA') NOT NULL,
	INFORMACION TEXT NOT NULL,
	INCREMENTO INT(10) NOT NULL,
	FECH_INICIO DATE NOT NULL,
	FECH_FIN DATE NOT NULL,
	ESTADO ENUM('PENDIENTE','APROBADA','INICIADA','FINALIZADA') NOT NULL,
	LOGIN_SUBASTADOR VARCHAR(15) NOT NULL,
	LOGIN_ADMIN VARCHAR(15) NOT NULL,

	CONSTRAINT FK_LOGIN_SUBASTADOR FOREIGN KEY(LOGIN_SUBASTADOR) REFERENCES USUARIO(LOGIN),
    CONSTRAINT FK_LOGIN_ADMIN FOREIGN KEY(LOGIN_ADMIN) REFERENCES USUARIO(LOGIN),
	CONSTRAINT PK_SUBASTA PRIMARY KEY(ID)

)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;


CREATE TABLE IF NOT EXISTS PUJA(
	ID INT AUTO_INCREMENT NOT NULL,
	DINERO INT NOT NULL,
	LOGIN_PUJADOR VARCHAR(15) NOT NULL,
	ID_SUBASTA INT NOT NULL,
	CONSTRAINT FK_LOGIN_PUJADOR FOREIGN KEY(LOGIN_PUJADOR) REFERENCES USUARIO(LOGIN),
	CONSTRAINT FK_ID_SUBASTA FOREIGN KEY(ID_SUBASTA) REFERENCES SUBASTA(ID),
	CONSTRAINT PK_PUJA PRIMARY KEY(ID)
)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*
CREATE TABLE IF NOT EXISTS NOTIFICACION(
	ESTADO VARCHAR(15) NOT NULL,
	LOGIN_SUBASTADOR VARCHAR(15) NOT NULL,
	ID_SUBASTA INT NOT NULL,
	FOREIGN KEY(ID_SUBASTA) REFERENCES SUBASTA(ID),
	CONSTRAINT FK_LOGIN_SUBASTADOR FOREIGN KEY(LOGIN_SUBASTADOR) REFERENCES SUBASTA(LOGIN_SUBASTADOR),
	CONSTRAINT PK_NOTIFICACION PRIMARY KEY(LOGIN_SUBASTADOR,ID_SUBASTA,ESTADO)

)ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
*/