const express = require('express');
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(express.json());

// Routes
app.use(require('./src/routes/employees'));
app.use(require('./src/routes/usuarios'));
app.use(require('./src/routes/anuncios'));
app.use(require('./src/routes/materias'));
app.use(require('./src/routes/libros'));
app.use(require('./src/routes/temas'));
app.use(require('./src/routes/reportes'));



// Starting the server
app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);
});
