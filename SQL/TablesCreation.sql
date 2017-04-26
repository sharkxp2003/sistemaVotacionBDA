IF OBJECT_ID('Candidato_Puesto','U') IS NOT NULL DROP TABLE Candidato_Puesto;
IF OBJECT_ID('Candidato_Elecciones','U') IS NOT NULL DROP TABLE Candidato_Elecciones;
IF OBJECT_ID('Voto','U') IS NOT NULL DROP TABLE Voto;
IF OBJECT_ID('Telefono','U') IS NOT NULL DROP TABLE Telefono;
IF OBJECT_ID('Candidato','U') IS NOT NULL DROP TABLE Candidato;
IF OBJECT_ID('Eleccion','U') IS NOT NULL DROP TABLE Eleccion;
IF OBJECT_ID('Puesto','U') IS NOT NULL DROP TABLE Puesto;
IF OBJECT_ID('Votante','U') IS NOT NULL DROP TABLE Votante;


CREATE TABLE Votante (
	id_CURP Varchar(18) NOT NULL,
	nombre Varchar(20) NOT NULL,
	apellido1 Varchar(20) NOT NULL,
	apellido2 Varchar(20) NOT NULL,
	f_nac date NOT NULL,
	calle Varchar(20) NOT NULL,
	delegacion Varchar(20) NOT NULL,
	ciudad Varchar(20) NOT NULL,
	cp Varchar(10) NOT NULL,
	CONSTRAINT VotantePK PRIMARY KEY(id_CURP));

CREATE TABLE Telefono (
	id_CURP Varchar(18) NOT NULL,
	telefono1 Varchar(20) NOT NULL,
	telefono2 Varchar(20),
	CONSTRAINT TelefonoPK PRIMARY KEY(id_CURP),
	CONSTRAINT TelefonoVotanteFK FOREIGN KEY(id_CURP) REFERENCES Votante(id_CURP) ON DELETE CASCADE
	);

CREATE TABLE Candidato (
	id_candidato BIGINT NOT NULL IDENTITY(1,1),
	id_CURP Varchar(18) NOT NULL,
	CONSTRAINT CandidatoPK PRIMARY KEY(id_candidato),
	CONSTRAINT CandidatoVotanteFK FOREIGN KEY(id_CURP) REFERENCES Votante(id_CURP) ON DELETE CASCADE
	);

CREATE TABLE Eleccion (
	id_eleccion BIGINT NOT NULL IDENTITY(1,1),
	nombre Varchar(18) NOT NULL
	CONSTRAINT EleccionPK PRIMARY KEY(id_eleccion)
	);

CREATE TABLE Puesto (
	id_puesto BIGINT NOT NULL IDENTITY(1,1),
	nombre Varchar(18) NOT NULL
	CONSTRAINT PuestoPK PRIMARY KEY(id_puesto)
	);

CREATE TABLE Voto (
	id_voto BIGINT NOT NULL IDENTITY(1,1),
	id_CURP Varchar(18) NOT NULL,
	id_candidato BIGINT NOT NULL,
	id_eleccion BIGINT NOT NULL,
	id_puesto BIGINT NOT NULL,
	CONSTRAINT VotoPK PRIMARY KEY(id_voto),
	CONSTRAINT VotoVotanteFK FOREIGN KEY(id_CURP) REFERENCES Votante(id_CURP),
	CONSTRAINT VotoCandidatoFK FOREIGN KEY(id_candidato) REFERENCES Candidato(id_candidato),
	CONSTRAINT VotoPuestoFK FOREIGN KEY(id_puesto) REFERENCES Puesto(id_puesto),
	CONSTRAINT VotoEleccion FOREIGN KEY(id_eleccion) REFERENCES Eleccion(id_eleccion)
	);

CREATE TABLE Candidato_Elecciones (
	id_candidato BIGINT NOT NULL,
	id_eleccion BIGINT NOT NULL,
	CONSTRAINT Candidato_Elecciones_PK PRIMARY KEY (id_candidato,id_eleccion),
	CONSTRAINT Candidato_EleccionesCandidato_FK FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
	CONSTRAINT Candidato_EleccionesEleccion_FK FOREIGN KEY (id_eleccion) REFERENCES Eleccion(id_eleccion)
	);

CREATE TABLE Candidato_Puesto (
	id_candidato BIGINT NOT NULL,
	id_puesto BIGINT NOT NULL,
	CONSTRAINT Candidato_Puesto_PK PRIMARY KEY (id_candidato, id_puesto),
	CONSTRAINT Candidato_Puesto_CandidatoFK FOREIGN KEY (id_candidato) REFERENCES Candidato(id_candidato),
	CONSTRAINT Candidato_Puesto_PuestoFK FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto)
	);
	
INSERT INTO Eleccion (nombre) VALUES ('Ayuntamiento');
INSERT INTO Eleccion (nombre) VALUES ('Estatal');
INSERT INTO Eleccion (nombre) VALUES ('Nacional');

INSERT INTO Puesto (nombre) VALUES ('Alcalde');
INSERT INTO Puesto (nombre) VALUES ('Diputado local');
INSERT INTO Puesto (nombre) VALUES ('Diputado Federal');
INSERT INTO Puesto (nombre) VALUES ('Senador');
INSERT INTO Puesto (nombre) VALUES ('Gobernador');
INSERT INTO Puesto (nombre) VALUES ('Presidente');



