CREATE TABLE empresas(
id_empresa INT AUTO_INCREMENT UNIQUE,
nombreUsuario VARCHAR(45) NOT NULL UNIQUE,
claveUsuario VARCHAR(45) NOT NULL,
nombrePersona VARCHAR(45) NOT NULL,
apellidoPersona VARCHAR(45) NOT NULL,
perfilCreado TINYINT(1) DEFAULT 0,
PRIMARY KEY(id_empresa)
);

CREATE TABLE perfilEmpresa(
id_perfilEmpresa INT AUTO_INCREMENT UNIQUE,
nombreEmpresa VARCHAR(100) NOT NULL,
esloganEmpresa VARCHAR(200),
descripcionEmpresa TEXT NOT NULL,
direccionEmpresa VARCHAR(200) NOT NULL,
telefonoEmpresa VARCHAR(20) NOT NULL,
promedioCalificaciones DECIMAL(3,2) DEFAULT 0.00,
contadorComentarios INT DEFAULT 0,
contadorVisitasInvitado INT DEFAULT 0,
contadorVisitasEvaluador INT DEFAULT 0,
logoEmpresa VARCHAR(255) NOT NULL,
id_empresa INT,
CONSTRAINT fk_empresa FOREIGN KEY (id_empresa)
	REFERENCES empresas(id_empresa),
PRIMARY KEY (id_perfilEmpresa)
);

CREATE TABLE redesSocialesEmpresa(
id_redesSocialesEmpresa INT AUTO_INCREMENT UNIQUE,
correoEmpresa VARCHAR (150),
paginaWebEmpresa VARCHAR(255),
instagramEmpresa VARCHAR(30),
facebookEmpresa VARCHAR(50),
whatsappEmpresa VARCHAR(255),
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_redesSocialesEmpresa)
);

CREATE TABLE horariosEmpresa(
id_horarioEmpresa INT AUTO_INCREMENT UNIQUE,
descripcionHorario VARCHAR(60) NOT NULL,
horarioApertura TIME NOT NULL,
horarioCierre TIME NOT NULL,
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_horarioEmpresa)
);

CREATE TABLE productosEmpresa(
id_productosEmpresa INT AUTO_INCREMENT UNIQUE,
productoEmpresa VARCHAR(60),
descripcionProducto VARCHAR(255),
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_productosEmpresa)
);

CREATE TABLE serviciosEmpresa(
id_serviciosEmpresa INT AUTO_INCREMENT UNIQUE,
nombreServicio VARCHAR (100) NOT NULL,
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_serviciosEmpresa)
);

CREATE TABLE galeriaEmpresa(
id_galeriaEmpresa INT AUTO_INCREMENT UNIQUE,
imagen1 VARCHAR(255) NOT NULL,
imagen2 VARCHAR(255) NOT NULL,
imagen3 VARCHAR(255) NOT NULL,
imagen4 VARCHAR(255) NOT NULL,
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_galeriaEmpresa)
);

CREATE TABLE fichaEstadisticasEmpresa(
id_fichaEstadisticasEmpresa INT AUTO_INCREMENT UNIQUE,
datosFicha VARCHAR(255),
id_perfilEmpresa INT,
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_fichaEstadisticasEmpresa)
);

CREATE TABLE evaluador(
id_evaluador INT AUTO_INCREMENT UNIQUE,
nombreUsuario VARCHAR(45) NOT NULL,
claveUsuario VARCHAR(45) NOT NULL,
nombrePersona VARCHAR(45) NOT NULL,
apellidoPersona VARCHAR(45) NOT NULL,
iconoEvaluador VARCHAR(255),
PRIMARY KEY(id_evaluador)
);

CREATE TABLE evaluacionesEmpresa(
id_evaluacionesEmpresa INT AUTO_INCREMENT UNIQUE,
comentarioEvaluador TEXT,
puntuacionServicio INT NOT NULL CHECK (puntuacionServicio BETWEEN 1 AND 5),
puntuacionProducto INT NOT NULL CHECK (puntuacionProducto BETWEEN 1 AND 5),
fechaEvaluacion DATE NOT NULL,
id_perfilEmpresa INT,
id_evaluador INT,
CONSTRAINT fk_evaluador FOREIGN KEY (id_evaluador)
	REFERENCES evaluador(id_evaluador),
CONSTRAINT fk_perfilEmpresa FOREIGN KEY (id_perfilEmpresa)
	REFERENCES perfilEmpresa(id_perfilEmpresa),
PRIMARY KEY (id_evaluacionesEmpresa)
);