const express = require('express');
const app = express();

// Settings
app.set('port', process.env.PORT || 3000);

// Middlewares
app.use(express.json());

// Routes
app.use(require('./routes/employees'));
app.use(require('./routes/usuarios'));
app.use(require('./routes/anuncios'));
app.use(require('./routes/materias'));
app.use(require('./routes/libros'));
app.use(require('./routes/temas'));



// Starting the server
app.listen(app.get('port'), () => {
  console.log(`Server on port ${app.get('port')}`);
});
