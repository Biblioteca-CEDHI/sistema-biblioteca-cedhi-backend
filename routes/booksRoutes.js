const express = require('express');
const router = express.Router();
const bookController = require('../controllers/requestBook');
const {addFavorite, getFavoriteBooks, removeFavorite }= require('../controllers/favoriteBooks');
const verifyToken = require('../middleware/authMiddleware'); 

//ruta para obtener todos los libros
router.get('/all',bookController.requestBooks);

// ruta para obtener libros favoritos de un usuario
router.get('/my-favorites', verifyToken, getFavoriteBooks);

// ruta para agregar libro favorito de un usuario
router.post('/my-favorites', verifyToken, addFavorite);

// ruta para eliminar libro favorito de un usuario
router.delete('/my-favorites', verifyToken, removeFavorite);

//ruta para buscar un libro
router.get('/:registro',bookController.requestBook);

//ruta para agregar un libro
router.post('/addBook',bookController.addBook);

//ruta para agregar libros masivamente

//ruta para modificar o actualizar datos de un libro
router.put('/updateBook',bookController.updateBook);

//ruta para eliminar libros
router.delete('/deleteBook/:registro',bookController.deleteBook);


module.exports = router;