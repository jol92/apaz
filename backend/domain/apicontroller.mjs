import knex from '../infraestructure/knex'

const apicontroller = app => {
  app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
    next()
  })

  // Usuarios
  app.get('/usuarios', (req, res, next) => knex('usuarios').join('provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia').select('usuarios.*', 'provincias.provincia').then(data => res.send(data)))

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
