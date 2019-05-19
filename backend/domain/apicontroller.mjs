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
  app.get('/usuarios', (_req, res, _next) => knex('usuarios')
    .join('provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia')
    .join('tipos_vivienda', 'usuarios.id_tipo_vivienda', '=', 'tipos_vivienda.id_vivienda')
    .select('usuarios.*', 'provincias.provincia', 'tipos_vivienda.nombre_vivienda')
    .then(data => res.send(data)))

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

  // Update usuario
  app.post('/updateUsuario', (req, res, _next) => {
    const { usuario } = req.body
    knex('usuarios').where('id_usuario', usuario.id_usuario).then(userList => {
      bcrypt.hash(usuario.password, 10, function (_err, hash) {
        knex('usuarios').update(
          [
            {
              id_usuario: usuario.id_usuario,
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
      res.send('La información ha sido actualizada')
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
    knex('usuarios').where('id_usuario', usuarioId).del().then(res.send('Usuario Eliminado')).catch(err => { console.log(err) })
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

  // Add caracteristica
  app.post('/insertarCaracteristica', (req, res, _next) => {
    const { caracteristica } = req.body
    if (caracteristica != null && caracteristica !== '') {
      knex('caracteristicas').insert({nombre_caracteristica: caracteristica}).then(
        res.send('Característica insertada')
      )
    } else {
      res.send('¡No puede insertar una característica vacía!')
    }
  })

  // PREFERENCIAS

  // Preferencias por id_usuario
  app.get('/getPreferenciasUsuario/:usuarioId', (req, res, _next) => {
    const { usuarioId } = req.params
    knex('preferencias')
      .join('caracteristicas', 'preferencias.id_caracteristica', '=', 'caracteristicas.id')
      .where('id_usuario', usuarioId)
      .options({nestTables: true})
      .then(data => res.send(data))
  })

  // MASCOTAS

  // Listar mascotas
  app.get('/mascotas', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado')
    .then(data => res.send(data))
  )

  // Listar mascotas no adoptadas
  const subquery1 = knex('mascotas_adoptadas').select('id_mascota')
  app.get('/mascotasNoAdoptadas', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado')
    .whereNotIn('mascotas.id', subquery1)
    .then(data => res.send(data))
  )

  // Listar mascotas no adoptadas y no acogidas
  const subquery2 = knex('mascotas_acogidas').select('id_mascota')
  app.get('/mascotasDisponibles', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado')
    .whereNotIn('mascotas.id', subquery1)
    .whereNotIn('mascotas.id', subquery2)
    .then(data => res.send(data))
  )

  // Eliminar mascota
  app.delete('/deletePet/:petId', (req, res, _next) => {
    const { petId } = req.params
    knex('mascotas').where('id', petId).del().then(res.send('Mascota Eliminada')).catch(err => { console.log(err) })
  })

  // Añadir mascota
  app.post('/insertarMascota', (req, res, _next) => {
    const { mascota } = req.body
    knex('mascotas').insert(
      [
        {
          nombre: mascota.nombre,
          fecha_nacimiento: mascota.fecha_nacimiento,
          id_estado: mascota.estado,
          chip: mascota.chip,
          genero: mascota.genero,
          imagen: mascota.imagen_name,
          descripcion: mascota.text
        }
      ]
    ).then(res => {
      const insertarCaracteristicas = mascota.caracteristicas.map(caracteristica => ({ id_mascota: res[0], id_caracteristica: caracteristica }))
      return knex('caracteristicas_mascota').insert(insertarCaracteristicas)
    })
    res.send('¡La mascota ha sido registrada correctamente!')
  })
  // ESTADOS MASCOTAS

  // Listar estados
  app.get('/estados', (_req, res, _next) => knex('estados_mascota').select('*').then(data => res.send(data)))

  // ADOPCIONES

  // Listar adopciones
  app.get('/adopciones', (_req, res, _next) => knex('mascotas_adoptadas')
    .join('mascotas', 'mascotas_adoptadas.id_mascota', '=', 'mascotas.id')
    .join('usuarios', 'mascotas_adoptadas.id_usuario', '=', 'usuarios.id_usuario')
    .join('provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia')
    .select('mascotas_adoptadas.*', 'mascotas.*', 'usuarios.*', 'provincias.provincia')
    .options({nestTables: true})
    .then(
      data => res.send(data)
    )
  )

  // Eliminar adopcion
  app.delete('/deleteAdopcion/:adopcionId', (req, res, _next) => {
    const { adopcionId } = req.params
    knex('mascotas_adoptadas').where('id', adopcionId).del().then(res.send('Adopción Eliminada')).catch(err => { console.log(err) })
  })

  // Añadir adopcion
  app.post('/insertarAdopcion', (req, res, _next) => {
    const { adopcion } = req.body
    knex('mascotas_adoptadas').insert(
      [
        {
          id_usuario: adopcion.id_usuario,
          id_mascota: adopcion.id_mascota
        }
      ]
    ).then(
      knex('mascotas').where('id', adopcion.id_mascota).update('id_estado', '1')
    ).catch(err => { console.log(err) })
    res.send('¡La adopción se ha registrado correctamente!')
  })

  // ACOGIDAS

  // Listar Acogidas
  app.get('/acogidas', (_req, res, _next) => knex('mascotas_acogidas')
    .join('mascotas', 'mascotas_acogidas.id_mascota', '=', 'mascotas.id')
    .join('usuarios', 'mascotas_acogidas.id_usuario', '=', 'usuarios.id_usuario')
    .join('provincias', 'usuarios.id_provincia', '=', 'provincias.id_provincia')
    .select('mascotas_acogidas.*', 'mascotas.*', 'usuarios.*', 'provincias.provincia')
    .options({nestTables: true})
    .then(
      data => res.send(data)
    )
  )

  // Eliminar acogida
  app.delete('/deleteAcogida/:acogidaId', (req, res, _next) => {
    const { acogidaId } = req.params
    knex('mascotas_acogidas').where('id', acogidaId).del().then(res.send('Acogida Eliminada')).catch(err => { console.log(err) })
  })

  // Añadir adopcion
  app.post('/insertarAcogida', (req, res, _next) => {
    const { acogida } = req.body
    knex('mascotas_acogidas').insert(
      [
        {
          id_usuario: acogida.id_usuario,
          id_mascota: acogida.id_mascota
        }
      ]
    ).then(
      knex('mascotas').where('id', acogida.id_mascota).update('id_estado', '2')
    ).catch(err => { console.log(err) })
    res.send('¡La acogida se ha registrado correctamente!')
  })

  // OTHERS

  // Matching mascota / usuarios
  const subquery = knex('mascotas_adoptadas').select('id_mascota')
  app.get('/matchs', (_req, res, _next) => knex('caracteristicas').where('mascotas.id', 'not in', subquery).groupBy('mascotas.id')
    .join('caracteristicas_mascota', 'caracteristicas.id', '=', 'caracteristicas_mascota.id_caracteristica')
    .join('preferencias', 'caracteristicas.id', '=', 'preferencias.id_caracteristica')
    .join('usuarios', 'preferencias.id_usuario', '=', 'usuarios.id_usuario')
    .join('mascotas', 'caracteristicas_mascota.id_mascota', '=', 'mascotas.id')
    .select('caracteristicas.nombre_caracteristica',
      'mascotas.nombre',
      'mascotas.id as id_mascota',
      knex.raw('GROUP_CONCAT(usuarios.nombre, " ", usuarios.apellidos) as usuario'),
      knex.raw('GROUP_CONCAT(usuarios.id_usuario) as usuarios_id')
    )
    .then(
      data => res.send(data)
    )
  )
}

export default apicontroller
