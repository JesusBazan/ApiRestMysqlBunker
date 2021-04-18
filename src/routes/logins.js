const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all logins
router.get('/sesiones', (req, res) => {
    mysqlConnection.query('SELECT * FROM sesion', (err, rows, fields) => {
      if(!err) {
        res.json(rows);
      } else {
        console.log(err);
      }
    });  
  });

// INSERT a reporte
router.post('/insertarSesion', (req, res) => {
    const {id, fk_usuario, created_at} = req.body;
    console.log(id, fk_usuario, created_at);
    const query = `
      SET @id = ?;
      SET @fk_usuario = ?;
      SET @created_at = ?;
      CALL AddOrEditSesion(@id, @fk_usuario, @created_at);
    `;
    mysqlConnection.query(query, [id, fk_usuario, created_at], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Sesion Saved'});
      } else {
        console.log(err);
      }
    });
  
  });

module.exports = router;