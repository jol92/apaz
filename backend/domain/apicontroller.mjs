import knex from '../infraestructure/knex'

const tableName = 'usuarios'
const apicontroller = app => {
  app.get('/usuarios', (req, res, next) => knex(tableName).select('*').then(data => res.send(data)))

  app.get('/usuarios/:usuarioId', (req, res, next) => {
    const { usuarioId } = req.params
    console.log(usuarioId)
  })

  app.post('/usaurios/:usuarioId', (req, res, next) => {

  })

  app.delete('/usuarios/:usuarioId', (req, res, next) => {
    const { usuarioId } = req.params
    console.log(usuarioId)
  })
}

export default apicontroller
