const sequelize = require('../config/db');
const { QueryTypes } = require('sequelize');

async function syncUserToPostgres(user) {
  const { email, nombre, apellido, rol } = user;

  const result = await sequelize.query(
    `SELECT codigo FROM "Usuario_cedhis" WHERE email = :email`,
    { replacements: { email }, type: QueryTypes.SELECT }
  );

  let userCodigo = result[0]?.codigo;

  if (!userCodigo) {
    const insertResult = await sequelize.query(
      `INSERT INTO "Usuario_cedhis"(email, nombre, apellido, rol)
       VALUES (:email, :nombre, :apellido, :rol)
       RETURNING codigo`,
      {
        replacements: { email, nombre, apellido, rol },
        type: QueryTypes.INSERT
      }
    );

    userCodigo = insertResult[0][0].codigo;
  }

  return userCodigo;
}

module.exports = { syncUserToPostgres };
