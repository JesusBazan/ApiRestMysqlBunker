const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all anuncios
router.get('/anuncios', (req, res) => {
  mysqlConnection.query('SELECT * FROM anuncio', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An anuncio
router.get('/buscarAnuncio/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM anuncio WHERE id_anuncio = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// DELETE An anuncio
router.delete('/eliminarAnuncio/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM anuncio WHERE id_anuncio = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Anuncio Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An anuncio
router.post('/insertarAnuncio', (req, res) => {
  const {id, titulo, autor, descripccion, imagen} = req.body;
  console.log(id, titulo, autor, descripccion, imagen);
  const query = `
    SET @id = ?;
    SET @titulo = ?;
    SET @autor = ?;
    SET @descripccion = ?;
    SET @imagen = ?;
    CALL AddOrEditAnuncio(@id, @titulo, @autor, @descripccion, @imagen);
  `;
  mysqlConnection.query(query, [id, titulo, autor, descripccion, imagen], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'anuncio Saved'});
    } else {
      console.log(err);
    }
  });

});

// UPDATE An anuncio
router.put('/actualizarAnuncio/:id', (req, res) => {
  const { titulo, autor, descripccion, imagen } = req.body;
  const { id } = req.params;
  const query = `
    SET @id = ?;
    SET @titulo = ?;
    SET @autor = ?;
    SET @descripccion = ?;
    SET @imagen = ?;
    CALL AddOrEditAnuncio(@id, @titulo, @autor, @descripccion, @imagen);
  `;
  mysqlConnection.query(query, [id, titulo, autor, descripccion, imagen], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'anuncio Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;