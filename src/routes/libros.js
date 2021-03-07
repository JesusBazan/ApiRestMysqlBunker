const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all libros
router.get('/libros', (req, res) => {
  mysqlConnection.query('SELECT * FROM libro', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An libro
router.get('/buscarLibro/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM libro WHERE id_libro = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An libro
router.delete('/eliminarLibro/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM libro WHERE id_libro = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Libro Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An libro
router.post('/insertarLibro', (req, res) => {
  const {id, titulo, autor, imagen, fk_materia} = req.body;
  console.log(id, titulo, autor, imagen, fk_materia);
  const query = `
    SET @id = ?;
    SET @titulo = ?;
    SET @autor = ?;
    SET @imagen = ?;
    SET @fk_materia = ?;
    CALL AddOrEditLibro(@id, @titulo, @autor, @imagen, @fk_materia);
  `;
  mysqlConnection.query(query, [id, titulo, autor, imagen, fk_materia], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Libro Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An libro
router.put('/actualizarLibro/:id', (req, res) => {
  const { titulo, autor, imagen, fk_materia } = req.body;
  const { id } = req.params;
  const query = `
  SET @id = ?;
  SET @titulo = ?;
  SET @autor = ?;
  SET @imagen = ?;
  SET @fk_materia = ?;
  CALL AddOrEditLibro(@id, @titulo, @autor, @imagen, @fk_materia);
  `;
  mysqlConnection.query(query, [id, titulo, autor, imagen, fk_materia], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Libro Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;