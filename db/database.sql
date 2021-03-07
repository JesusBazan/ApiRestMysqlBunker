CREATE DATABASE IF NOT EXISTS company;

USE company;

-- TABLA EMPLEADOS

CREATE TABLE employee (
  id INT(11) NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) DEFAULT NULL,
  salary INT(11) DEFAULT NULL, 
  PRIMARY KEY(id)
);

DESCRIBE employee;

INSERT INTO employee values 
  (1, 'Ryan Ray', 20000),
  (2, 'Joe McMillan', 40000),
  (3, 'John Carter', 50000);

SELECT * FROM employee;

-- TABLA USUARIO

CREATE TABLE usuario (
  id_usuario INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) DEFAULT NULL,
  nombres VARCHAR(45) DEFAULT NULL,
  apellidos VARCHAR(45) DEFAULT NULL,
  correo VARCHAR(45) DEFAULT NULL,
  rol VARCHAR(45) DEFAULT NULL,
  contrasenia VARCHAR(300) DEFAULT NULL,
  foto VARCHAR(300) DEFAULT NULL,
  PRIMARY KEY(id_usuario)
);

SELECT * FROM usuario;

-- TABLA ANUNCIOS

CREATE TABLE anuncio (
  id_anuncio INT(11) NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) DEFAULT NULL,
  autor VARCHAR(45) DEFAULT NULL,
  descripccion VARCHAR(45) DEFAULT NULL,
  imagen VARCHAR(300) DEFAULT NULL,
  PRIMARY KEY(id_anuncio)
);

SELECT * FROM anuncio;

-- TABLA MATERIAS

CREATE TABLE materia (
  id_materia INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) DEFAULT NULL,
  descripccion VARCHAR(45) DEFAULT NULL,
  imagen VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY(id_materia)
);

SELECT * FROM materia;

-- TABLA LIBRO

CREATE TABLE libro (
  id_libro INT(11) NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(45) DEFAULT NULL,
  autor VARCHAR(45) DEFAULT NULL,
  imagen VARCHAR(45) DEFAULT NULL,
  fk_materia INT(11) DEFAULT NULL,
  CONSTRAINT fkmateria FOREIGN KEY (fk_materia) REFERENCES materia (id_materia),
  PRIMARY KEY(id_libro)
);

SELECT * FROM materia;

-- TABLA TEMA

CREATE TABLE tema (
  id_tema INT(11) NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45) DEFAULT NULL,
  descripcion VARCHAR(45) DEFAULT NULL,
  fk_materia INT(11) DEFAULT NULL,
  CONSTRAINT fk_materia_tma FOREIGN KEY (fk_materia) REFERENCES materia (id_materia),
  PRIMARY KEY(id_tema)
);

SELECT * FROM tema;


