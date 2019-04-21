import config from '../database/knexfile'
import knex from 'knex'

const knexConnection = knex(config)

process.on('exit', () => knexConnection.destroy())

export default knexConnection
