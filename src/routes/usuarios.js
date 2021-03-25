const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all usuarios
router.get('/usuarios', (req, res) => {
  mysqlConnection.query('SELECT * FROM usuario', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An usuario
router.get('/buscarUsuario/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM usuario WHERE id_usuario = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An usuario
router.delete('/eliminarUsuario/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM usuario WHERE id_usuario = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Employee Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An usuario
router.post('/insertarUsuario', (req, res) => {
  const {id, username, nombres, apellidos, correo, rol, contrasenia, foto} = req.body;
  console.log(id, username, nombres, apellidos, correo, rol, contrasenia, foto);
  const query = `
    SET @id = ?;
    SET @username = ?;
    SET @nombres = ?;
    SET @apellidos = ?;
    SET @correo = ?;
    SET @rol = ?;
    SET @contrasenia = ?;
    SET @foto = ?;
    CALL AddOrEditUsuario(@id, @username, @nombres, @apellidos, @correo, @rol, @contrasenia, @foto);
  `;
  mysqlConnection.query(query, [id, username, nombres, apellidos, correo, rol, contrasenia, foto], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Usuario Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An usuario
router.put('/actualizarUsuario/:id', (req, res) => {
  const { username, nombres, apellidos, correo, rol, contrasenia, foto } = req.body;
  const { id } = req.params;
  const query = `
    SET @id = ?;
    SET @username = ?;
    SET @nombres = ?;
    SET @apellidos = ?;
    SET @correo = ?;
    SET @rol = ?;
    SET @contrasenia = ?;
    SET @foto = ?;
    CALL AddOrEditUsuario(@id, @username, @nombres, @apellidos, @correo, @rol, @contrasenia, @foto);
  `;
  mysqlConnection.query(query, [id, username, nombres, apellidos, correo, rol, contrasenia, foto], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Usuario Updated'});
    } else {
      console.log(err);
    }
  });
});


// LOGEARSE
router.post('/iniciarSesion', (req, res) => {
  const {username, contrasenia} = req.body;
  console.log(username, contrasenia);
  const query = `
  SET @username = ?;
  SET @contrasenia = ?;
  CALL IniciarSesion2(@username,@contrasenia);
  `;
  mysqlConnection.query(query, [username, contrasenia], (err, rows, fields) => {
    if(!err) {
      res.json(rows[2]);
    } else {
      console.log(err);
    }
  });
});

module.exports = router;