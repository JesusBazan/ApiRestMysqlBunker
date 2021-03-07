const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all materias
router.get('/materias', (req, res) => {
  mysqlConnection.query('SELECT * FROM materia', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An materia
router.get('/buscarMateria/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM materia WHERE id_materia = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An materia
router.delete('/eliminarMateria/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM materia WHERE id_materia = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'materia Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An materia
router.post('/insertarMateria', (req, res) => {
  const {id, nombre, descripccion, imagen} = req.body;
  console.log(id, nombre, descripccion, imagen);
  const query = `
    SET @id = ?;
    SET @nombre = ?;
    SET @descripccion = ?;
    SET @imagen = ?;
    CALL AddOrEditMateria(@id, @nombre, @descripccion, @imagen);
  `;
  mysqlConnection.query(query, [id, nombre, descripccion, imagen], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'materia Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An materia
router.put('/actualizarMateria/:id', (req, res) => {
  const { nombre, descripccion, imagen } = req.body;
  const { id } = req.params;
  const query = `
    SET @id = ?;
    SET @nombre = ?;
    SET @descripccion = ?;
    SET @imagen = ?;
    CALL AddOrEditMateria(@id, @nombre, @descripccion, @imagen);
  `;
  mysqlConnection.query(query, [id, nombre, descripccion, imagen], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'materia Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;