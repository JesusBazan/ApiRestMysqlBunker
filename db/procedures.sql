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

-- PROCEDIMIENTO AGREGAR O ACTUALIZAR UN TEMAS

DELIMITER $$

CREATE PROCEDURE `AddOrEditTema` (
  IN _id INT,
  IN _nombre VARCHAR(45),
  IN _descripcion VARCHAR(300),
  IN _fk_materia INT
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO tema (nombre, descripcion, fk_materia)
    VALUES (_nombre, _descripcion, _fk_materia);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE tema
    SET
    nombre = _nombre,
    descripcion = _descripcion,
    fk_materia = _fk_materia
    WHERE id_tema = _id;
  END IF;

  SELECT _id AS 'id';
END

$$


-- PRECEDIMIENTO AGREGAR O EDITAR REPORTE

DELIMITER $$

CREATE PROCEDURE `AddOrEditReporte` (
  IN _id INT,
  IN _fk_usuario INT,
  IN _created_at TIMESTAMP,
  IN _herramienta VARCHAR(50),
  IN _accion VARCHAR(50)
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO reportes (fk_usuario, herramienta, accion)
    VALUES (_fk_usuario, _herramienta, _accion);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE reportes
    SET
    fk_usuario = _fk_usuario,
    created_at = _created_at,
    herramienta = _herramienta,
    accion = _accion
    WHERE id = _id;
  END IF;

  SELECT _id AS 'id';
END

$$

-- PRECEDIMIENTO AGREGAR O EDITAR SESIONES

DELIMITER $$

CREATE PROCEDURE `AddOrEditSesion` (
  IN _id INT,
  IN _fk_usuario INT,
  IN _created_at TIMESTAMP
)
BEGIN 
  IF _id = 0 THEN
    INSERT INTO sesion (fk_usuario)
    VALUES (_fk_usuario);

    SET _id = LAST_INSERT_ID();
  ELSE
    UPDATE sesion
    SET
    fk_usuario = _fk_usuario,
    created_at = _created_at
    WHERE id = _id;
  END IF;

  SELECT _id AS 'id';
END

$$

-- PRECEDIMIENTO PARA TRAER LA VISTA DE REPORTES

DELIMITER $$

CREATE PROCEDURE `GetTableReportes` (IN _rol INT)
BEGIN
	SET @posicion = 0;
    IF _rol = 0 THEN
		SELECT @posicion:=@posicion+1 as 'No.', usu.username, usu.nombres, usu.apellidos, usu.rol, rep.herramienta, rep.accion, rep.created_at
		from reportes as rep
		inner join usuario as usu
		ON rep.fk_usuario = usu.id_usuario
        WHERE usu.rol = 'alumno';
    ELSE
		SELECT @posicion:=@posicion+1 as 'No.', usu.username, usu.nombres, usu.apellidos, usu.rol, rep.herramienta, rep.accion, rep.created_at
		from reportes as rep
		inner join usuario as usu
		ON rep.fk_usuario = usu.id_usuario;
	END IF;
END

$$

-- PRECEDIMIENTO PARA OBTENER LA VISTA DE LOS USUARIOS

DELIMITER $$

CREATE PROCEDURE `GetTableUsuarios` (IN _rol INT)
BEGIN
	SET @posicion = 0;
    IF _rol = 0 THEN
		SELECT @posicion:=@posicion+1 as 'posicion', username, nombres, apellidos, correo, rol
		from usuario
		WHERE rol = 'alumno';
    ELSE
		SELECT @posicion:=@posicion+1 as 'posicion', username, nombres, apellidos, correo, rol
		from usuario;
	END IF;
END

$$

call GetTableUsuarios (0);

-- PRECEDIMIENTO PARA OBTENER USUARIO ACTUAL

DELIMITER $$

CREATE PROCEDURE `GetUsuarioActual` (
	IN _username VARCHAR(45),
    IN _contrasenia VARCHAR(45)
    )
BEGIN
		SELECT *
		from usuario
		WHERE username = _username and contrasenia = _contrasenia;
END

$$

call GetUsuarioActual ('conniel99','12345');
