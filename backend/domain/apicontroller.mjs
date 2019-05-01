import knex from '../infraestructure/knex'
import bcrypt from 'bcrypt'

const apicontroller = app => {
  app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
    next()
  })

  // Usuarios
  app.get('/usuarios', (req, res, next) => knex('usuarios').join(
    'provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia'
  )
    .join(
      'tipos_vivienda', 'usuarios.id_tipo_vivienda', '=', 'tipos_vivienda.id_vivienda'
    ).select(
      'usuarios.*', 'provincias.provincia', 'tipos_vivienda.nombre_vivienda'
    ).then(
      data => res.send(data)
    ))

  app.post('/usuarios/:usuario', (req, res, next) => {
    const { usuario } = req.body
    // bcrypt.hash(usuario.password, 10, function (hash) {
    //   console.log(hash)
    // })
    knex('usuarios').insert(
      {dni: usuario.dni},
      {email: usuario.email},
      {password: usuario.password},
      {nombre: usuario.nombre},
      {apellidos: usuario.apellidos},
      {telefono: usuario.telefono},
      {direccion: usuario.direccion1},
      {fecha_nacimiento: usuario.fecha_nac},
      {id_tipo_usuario: 2},
      {id_provincia: usuario.provincia},
      {direccion2: usuario.direccion2},
      {id_tipo_vivienda: usuario.tipoVivienda}
    )
    console.log(usuario)
  })

  app.get('/usaurios/:usuarioId', (req, res, next) => {

  })

  app.delete('/usuarios/:usuarioId', (req, res, next) => {
    const { usuarioId } = req.params
    console.log(usuarioId)
  })

  // Provincias
  app.get('/provincias', (req, res, next) => knex('provincias').select('*').then(data => res.send(data)))

  // Viviendas
  app.get('/viviendas', (req, res, next) => knex('tipos_vivienda').select('*').then(data => res.send(data)))

  // Caracteristicas
  app.get('/caracteristicas', (req, res, next) => knex('caracteristicas').select('*').then(data => res.send(data)))
}

export default apicontroller
