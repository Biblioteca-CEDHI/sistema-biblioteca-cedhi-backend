const sequelize = require('../config/db');
const { QueryTypes } = require('sequelize');

// Obtener libros favoritos del usuario

const getFavoriteBooks = async (req, res) => {
  try {
    const { email } = req.user;
    const favoritos = await sequelize.query(
      `SELECT l.registro, l.titulo, l.autor, l.tema
       FROM "libros_favoritos" f
       JOIN "Usuario_cedhis" u ON f.codigo = u.codigo
       JOIN "libros" l ON l.registro = f.registro
       WHERE u.email = :email`,
      {
        replacements: { email },
        type: QueryTypes.SELECT,
      }
    );
    res.status(200).json({ favorites: favoritos });
  } catch (error) {
    console.log(error);
    res.status(500).json({ mensaje: 'Error al obtener libros favoritos', error: error.message });
  }
};

// Añadir libro favorito de un usuario

const addFavorite = async (req, res) => {
    try {
        const { email } = req.user;
        const { registro } = req.body;

        const userResult = await sequelize.query(
        `SELECT codigo FROM "Usuario_cedhis" WHERE email = :email`,
        { replacements: { email }, type: QueryTypes.SELECT }
        );
        const userCodigo = userResult[0]?.codigo;

        await sequelize.query(
            `INSERT INTO libros_favoritos(codigo, registro)
             VALUES (:userCodigo, :registro)`,
            {
                replacements: { userCodigo, registro },
                type: QueryTypes.INSERT
            }
        );

        res.status(200).json({ mensaje: 'Libro agregado a favoritos' });
    } catch (error) {
        console.error("Error al agregar favorito:", error);
        res.status(500).json({ error: "Error en el servidor" });
    }
};

// Quitar libro de favoritos
const removeFavorite = async (req, res) => {
    try {
        const { email } = req.user;
        const { registro } = req.body;

        const userResult = await sequelize.query(
        `SELECT codigo FROM "Usuario_cedhis" WHERE email = :email`,
        { replacements: { email }, type: QueryTypes.SELECT }
        );
        const userCodigo = userResult[0]?.codigo;

        await sequelize.query(
            `DELETE FROM libros_favoritos WHERE codigo = :userCodigo AND registro = :registro`,
            {
                replacements: { userCodigo, registro },
                type: QueryTypes.DELETE
            }
        );

        res.status(200).json({ mensaje: 'Libro eliminado de favoritos' });
    } catch (error) {
        console.error("Error al eliminar favorito:", error);
        res.status(500).json({ error: "Error en el servidor" });
    }
};

module.exports = { getFavoriteBooks, addFavorite, removeFavorite };