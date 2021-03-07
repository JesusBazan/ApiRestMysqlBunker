USE company;

DELIMITER $$
USE `company`$$

CREATE PROCEDURE `employeeAddOrEdit` (
  IN _id INT,
  IN _name VARCHAR(45),
  IN _salary INT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO employee (name, salary)
    VALUES (_name, _salary);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE employee
    SET
    name = _name,
    salary = _salary
    WHERE id = _id;
  END IF;

  SELECT _id AS 'id';
END

-- PRECEDIMIENTO AGREGAR O EDITAR USUARIO

DELIMITER $$

CREATE PROCEDURE `AddOrEditUsuario` (
  IN _id INT,
  IN _username VARCHAR(45),
  IN _nombres VARCHAR(45),
  IN _apellidos VARCHAR(45),
  IN _correo VARCHAR(45),
  IN _rol VARCHAR(45),
  IN _contrasenia VARCHAR(300),
  IN _foto VARCHAR(300)
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO usuario (username, nombres, apellidos, correo, rol, contrasenia, foto)
    VALUES (_username, _nombres, _apellidos, _correo, _rol, _contrasenia, _foto);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE usuario
    SET
    username = _username,
    nombres = _nombres,
    apellidos = _apellidos,
    correo = _correo,
    rol = _rol,
    contrasenia = _contrasenia,
    foto = _foto
    WHERE id_usuario = _id;
  END IF;

  SELECT _id AS 'id';
END

$$

-- PROCEDIMINETO AGREGAR O EDITAR ANUNCIO

DELIMITER $$

CREATE PROCEDURE `AddOrEditAnuncio` (
  IN _id INT,
  IN _titulo VARCHAR(45),
  IN _autor VARCHAR(45),
  IN _descripccion VARCHAR(45),
  IN _imagen VARCHAR(300)
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO anuncio (titulo, autor, descripccion, imagen)
    VALUES (_titulo, _autor, _descripccion, _imagen);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE anuncio
    SET
    titulo = _titulo,
    autor = _autor,
    descripccion = _descripccion,
    imagen = _imagen
    WHERE id_anuncio = _id;
  END IF;

  SELECT _id AS 'id';
END

$$

-- PROCEDIMIENTO AGREGAR O ACTUALIZAR UNA MATERIA

DELIMITER $$

CREATE PROCEDURE `AddOrEditMateria` (
  IN _id INT,
  IN _nombre VARCHAR(45),
  IN _descripccion VARCHAR(300),
  IN _imagen VARCHAR(300)
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO materia (nombre, descripccion, imagen)
    VALUES (_nombre, _descripccion, _imagen);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE materia
    SET
    nombre = _nombre,
    descripccion = _descripccion,
    imagen = _imagen
    WHERE id_materia = _id;
  END IF;

  SELECT _id AS 'id';
END

$$

-- PROCEDIMIENTO AGREGAR O ACTUALIZAR UN LIBRO

DELIMITER $$

CREATE PROCEDURE `AddOrEditLibro` (
  IN _id INT,
  IN _titulo VARCHAR(45),
  IN _autor VARCHAR(45),
  IN _imagen VARCHAR(300),
  IN _fk_materia INT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO libro (titulo, autor, imagen, fk_materia)
    VALUES (_titulo, _autor, _imagen, _fk_materia);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE libro
    SET
    titulo = _titulo,
    autor = _autor,
    imagen = _imagen,
    fk_materia = _fk_materia
    WHERE id_libro = _id;
  END IF;

  SELECT _id AS 'id';
END

$$
