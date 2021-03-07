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