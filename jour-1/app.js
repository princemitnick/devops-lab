// app.js

// Importation du module express
const express = require('express');
const app = express();

// Définition du port, soit celui fourni par l'environnement, soit le port 3000
const PORT = process.env.PORT || 3000;

// Définition d'une route de base
app.get('/', (req, res) => {
  res.send('Bienvenue sur mon application Node.js déployée sur Azure !');
});

// Démarrage du serveur
app.listen(PORT, () => {
  console.log(`Serveur démarré sur le port ${PORT}`);
});