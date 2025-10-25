const express =require('express');
const router = express.Router();
const {estadisticaLibros,estadisticaUsuarios,getTotal, getActiveLoansForUser} = require('../controllers/estadisicasController')
const verifyToken = require('../middleware/authMiddleware'); 

router.get('/libros',estadisticaLibros);

router.get('/usuarios',estadisticaUsuarios);

router.get('/getTotal',getTotal);

router.get('/prestamos-activos', verifyToken, getActiveLoansForUser);

module.exports = router;