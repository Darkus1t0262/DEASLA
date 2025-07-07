const { Sequelize } = require('sequelize');

let sequelize;

if (!sequelize) {
  sequelize = new Sequelize(
    process.env.POSTGRES_DB,
    process.env.POSTGRES_USER,
    process.env.POSTGRES_PASSWORD,
    {
      host: process.env.POSTGRES_HOST,
      port: process.env.POSTGRES_PORT,
      dialect: 'postgres',
      logging: false,
    }
  );
}

module.exports = { sequelize };
