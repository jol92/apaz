import knex from '../infraestructure/knex'
import bcrypt from 'bcrypt'

const apicontroller = app => {
  app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE')
    next()
  })

  // USUARIOS

  // Listar Usuarios
  app.get('/usuarios', (_req, res, _next) => knex('usuarios').join(
    'provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia'
  )
    .join(
      'tipos_vivienda', 'usuarios.id_tipo_vivienda', '=', 'tipos_vivienda.id_vivienda'
    ).select(
      'usuarios.*', 'provincias.provincia', 'tipos_vivienda.nombre_vivienda'
    ).then(
      data => res.send(data)
    ))

  // Añadir Usuario
  app.post('/insertUsuario', (req, res, _next) => {
    const { usuario } = req.body
    knex('usuarios').where('email', usuario.email).then(userList => {
      if (userList.length === 0) {
        bcrypt.hash(usuario.password, 10, function (_err, hash) {
          knex('usuarios').insert(
            [
              {
                dni: usuario.dni,
                email: usuario.email,
                password: hash,
                nombre: usuario.nombre,
                apellidos: usuario.apellidos,
                telefono: usuario.telefono,
                direccion: usuario.direccion1,
                fecha_nacimiento: usuario.fecha_nac,
                id_tipo_usuario: 2,
                id_provincia: usuario.provincia,
                direccion2: usuario.direccion2,
                id_tipo_vivienda: usuario.tipoVivienda
              }
            ]
          ).then(function (response) {
            const insertPreferencias = usuario.preferencias.map(preferencia => ({ id_usuario: response[0], id_caracteristica: preferencia }))
            return knex('preferencias').insert(insertPreferencias)
          })
            .catch(err => { console.log(err) })
        })
        res.send('Se ha registrado correctamente. ¡Muchas gracias!')
      } else {
        res.send('El email con el que intenta registrarse ya está en uso')
      }
    })
  })

  // Login Usuario
  app.post('/loginUsuario', (req, res, next) => {
    const { usuario } = req.body
    knex('usuarios').where('email', usuario.email).then(function (response) {
      if (response.length > 0) {
        if (bcrypt.compareSync(usuario.password, response[0].password)) {
          response[0].mensaje = 'Bienvenido'
          res.send(response[0])
        } else {
          res.send('¡Ha introducido una contraseña incorrecta!')
        }
      } else {
        res.send('¡El E-mail introducido no existe!')
      }
    })
  })

  // Mostrar un usuario
  app.get('/usaurios/:usuarioId', (req, res, _next) => {
    const { usuarioId } = req.params
    knex('usuarios').where('id_usuario', usuarioId).then(data => res.send(data))
  })

  // Eliminar un usuario
  app.delete('/deleteUser/:usuarioId', (req, res, _next) => {
    const { usuarioId } = req.params
    knex('usuarios').where('id_usuario', usuarioId).del().then(res.send('asd')).catch(err => { console.log(err) })
  })

  // PROVINCIAS

  // Listar provincias
  app.get('/provincias', (_req, res, _next) => knex('provincias').select('*').then(data => res.send(data)))

  // VIVIENDAS

  // Listar viviendas
  app.get('/viviendas', (_req, res, _next) => knex('tipos_vivienda').select('*').then(data => res.send(data)))

  // CARACTERISTICAS

  // Listar características
  app.get('/caracteristicas', (_req, res, _next) => knex('caracteristicas').select('*').then(data => res.send(data)))

  // MASCOTAS

  // Listar mascotas
  app.get('/mascotas', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado')
    .then(data => res.send(data))
  )

  // Eliminar mascota
  app.delete('/deletePet/:petId', (req, res, _next) => {
    const { petId } = req.params
    knex('mascotas').where('id', petId).del().then(res.send('Mascota Eliminada')).catch(err => { console.log(err) })
  })
}

export default apicontroller
