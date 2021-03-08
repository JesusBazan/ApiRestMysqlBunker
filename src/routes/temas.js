const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all temas
router.get('/temas', (req, res) => {
  mysqlConnection.query('SELECT * FROM tema', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An tema
router.get('/buscarTema/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM tema WHERE id_tema = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An tema
router.delete('/eliminarTema/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM tema WHERE id_tema = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'tema Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An tema
router.post('/insertarTema', (req, res) => {
  const {id, nombre, descripcion, fk_materia} = req.body;
  console.log(id, nombre, descripcion, fk_materia);
  const query = `
    SET @id = ?;
    SET @nombre = ?;
    SET @descripcion = ?;
    SET @fk_materia = ?;
    CALL AddOrEditTema(@id, @nombre, @descripcion, @fk_materia);
  `;
  mysqlConnection.query(query, [id, nombre, descripcion, fk_materia], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'tema Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An tema
router.put('/actualizarTema/:id', (req, res) => {
  const { nombre, descripcion, fk_materia } = req.body;
  const { id } = req.params;
  const query = `
    SET @id = ?;
    SET @nombre = ?;
    SET @descripcion = ?;
    SET @fk_materia = ?;
    CALL AddOrEditTema(@id, @nombre, @descripcion, @fk_materia);
  `;
  mysqlConnection.query(query, [id, nombre, descripcion, fk_materia], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'tema Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;