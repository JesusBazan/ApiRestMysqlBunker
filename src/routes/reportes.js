const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all reportes
router.get('/reportes', (req, res) => {
    mysqlConnection.query('SELECT * FROM reportes', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });

// INSERT a reporte
router.post('/insertarReporte', (req, res) => {
    const {id, fk_usuario, created_at, herramienta, accion} = req.body;
    console.log(id, fk_usuario, created_at, herramienta, accion);
    const query = `
      SET @id = ?;
      SET @fk_usuario = ?;
      SET @created_at = ?;
      SET @herramienta = ?;
      SET @accion = ?;
      CALL AddOrEditReporte(@id, @fk_usuario, @created_at, @herramienta, @accion);
    `;
    mysqlConnection.query(query, [id, fk_usuario, created_at, herramienta, accion], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Reporte Saved'});
      } else {
        console.log(err);
      }
    });
  
  });

module.exports = router;