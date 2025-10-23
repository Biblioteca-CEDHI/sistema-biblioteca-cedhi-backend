
const express =require('express');
const router = express.Router();
const verifyToken = require('../middleware/authMiddleware'); 
const {loanBookRegister, loansDelay, getAllLoans, getLoansForUser, loansReturn, deleteLoan} = require("../controllers/loanController");

// AGREGAR UN PRESTAMO
router.post('/addLoan',loanBookRegister);


router.get('/loansDelay',loansDelay);


//OBTENER TODOS LOS PRESTAMOS
router.get('/allLoans',getAllLoans);

router.get('/my-loans', verifyToken, getLoansForUser);

router.post('/returnLoan',loansReturn);

router.delete('/deleteLoan/:id_prestamo',deleteLoan);


module.exports = router;