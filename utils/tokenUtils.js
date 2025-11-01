const jwt = require("jsonwebtoken");

function verifyTokenFunction(token) {
  try {
    const secret = process.env.JWT_SECRET;
    
    const decoded = jwt.verify(token, secret);
    return decoded;
  } catch (err) {
    throw new Error("Token inválido o expirado");
  }
}

module.exports = { verifyTokenFunction };
