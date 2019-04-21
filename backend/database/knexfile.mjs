import dotenv from 'dotenv'
dotenv.config()

const { MYSQL_HOST, MYSQL_USER, MYSQL_DATABASE } = process.env

const migrationConfig = {
  directory: 'database/migrations',
  tableName: 'knex_migrations'
}

const liveConfig = {
  client: 'mysql',
  connection: {
    host: MYSQL_HOST,
    user: MYSQL_USER,
    password: '',
    database: MYSQL_DATABASE
  },
  pool: {
    min: 2,
    max: 10
  },
  migrations: migrationConfig,
  seeds: {
    directory: 'database/seeds-live'
  }
}
export default liveConfig

// module.exports = {
//   development: liveConfig,
//   test: liveConfig,
//   staging: liveConfig,
//   production: liveConfig
// }
