const { verifyTokenFunction } = require("../utils/tokenUtils"); 

module.exports = function verifyToken(req, res, next) {
  // Extraer el token del encabezado Authorization (formato: Bearer <token>)
  if (req.originalUrl.includes('/api/auth/token-login')) return next();
  const token = req.headers["authorization"]?.split(" ")[1] || req.body.token;
  if (!token) return res.status(401).json({ message: "No token provided" });
  try {
    const user = verifyTokenFunction(token); 
    req.user = user; 
    next();
  } catch (err) {
    res.status(401).json({ message: "Token inválido" });
  }
};
