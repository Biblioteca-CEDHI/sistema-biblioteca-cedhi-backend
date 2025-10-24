const express = require('express');
const router = express.Router();
const verifyToken = require('../middleware/authMiddleware'); 
const {getSanciones2,removeSancion, getSancionesForUser} = require('../controllers/sanctionController');

router.get('/getSanciones',getSanciones2);

router.get('/my-sanctions', verifyToken, getSancionesForUser);

router.put('/removeSanction/:id_sancion',removeSancion);

module.exports = router;