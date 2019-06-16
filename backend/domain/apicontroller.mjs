import knex from '../infraestructure/knex'
import bcrypt from 'bcrypt'
import upload from '../infraestructure/multer'
import nodemailer from 'nodemailer'

const apicontroller = app => {
  app.use(function (req, res, next) {
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept')
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE')
    next()
  })

  // MAIL
  // Petición adopción
  app.post('/mailInteresado', function (req, res, next) {
    const usuario = req.body.usuario
    const mascota = req.body.mascota
    const accion = req.body.accion
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: 'informacion.apaz@gmail.com',
        pass: '123Apaz.'
      }
    })
    const mailOptions = {
      from: `${req.body.email}`,
      to: 'protectora.zeus@gmail.com', // mail receiver
      subject: `¡Un usuario se ha interesado por ${mascota.nombre}!`, // subject
      html: `<p>El usuario <b>${usuario.nombre} ${usuario.apellidos}</b> se ha interesado en <b>${accion}</b> a <b>${mascota.nombre}</b></p><p><b> - Información del usuario - </b></p><p><b>Teléfono: </b>${usuario.telefono}</p><p><b>E-mail: </b>${usuario.email}</p>` // plain text body
    }
    transporter.sendMail(mailOptions, function (err, res) {
      if (err) {
        console.error('there was an error: ', err)
      } else {
        console.log('here is the res: ', res)
      }
    })
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

  // Caracteristica por id_mascota
  app.get('/getCaracteristicasMascota/:mascotaId', (req, res, _next) => {
    const { mascotaId } = req.params
    knex('caracteristicas_mascota')
      .join('caracteristicas', 'caracteristicas_mascota.id_caracteristica', '=', 'caracteristicas.id')
      .where('id_mascota', mascotaId)
      .options({nestTables: true})
      .then(data => res.send(data))
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

  // TIPOS MASCOTA

  // Listar tipos
  app.get('/tipos_mascota', (_req, res, _next) => knex('tipos_mascota').select('*').then(data => res.send(data)))

  // MASCOTAS

  // Listar mascotas
  app.get('/mascotas', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .join('tipos_mascota', 'mascotas.id_tipo', '=', 'tipos_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado', 'tipos_mascota.nombre')
    .options({nestTables: true})
    .then(data => res.send(data))
  )

  // Listar mascotas no adoptadas
  app.get('/mascotasNoAdoptadas', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .join('tipos_mascota', 'mascotas.id_tipo', '=', 'tipos_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado', 'tipos_mascota.nombre')
    .where('mascotas.id_estado', '!=', 1)
    .options({nestTables: true})
    .then(data => res.send(data))
  )

  // Listar mascotas no adoptadas y no acogidas
  app.get('/mascotasDisponibles', (_req, res, _next) => knex('mascotas')
    .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
    .join('tipos_mascota', 'mascotas.id_tipo', '=', 'tipos_mascota.id')
    .select('mascotas.*', 'estados_mascota.nombre_estado', 'tipos_mascota.nombre')
    .where('mascotas.id_estado', '!=', 1)
    .where('mascotas.id_estado', '!=', 2)
    .options({nestTables: true})
    .then(data => res.send(data))
  )

  // Listar mascotas con filtros
  app.post('/filteredMascotas', (req, res, next) => {
    const filtrosMascota = req.body.filtros
    let query = knex('mascotas')
      .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
      .join('tipos_mascota', 'mascotas.id_tipo', '=', 'tipos_mascota.id')
      .join('caracteristicas_mascota', 'mascotas.id', '=', 'caracteristicas_mascota.id_mascota')
      .select('mascotas.*', 'estados_mascota.nombre_estado', 'tipos_mascota.nombre')
    if (filtrosMascota.buscador != null && filtrosMascota.buscador !== '' && filtrosMascota.buscador !== ' ') {
      query.where('mascotas.nombre', 'like', `%${filtrosMascota.buscador}%`).orWhere('mascotas.raza', 'like', `%${filtrosMascota.buscador}%`)
    }
    if (filtrosMascota.tipo != null && filtrosMascota.tipo !== '' && filtrosMascota.tipo !== ' ' && filtrosMascota.tipo !== '0') {
      query.where('mascotas.id_tipo', '=', filtrosMascota.tipo)
    }
    if (filtrosMascota.sexo != null && filtrosMascota.sexo !== '' && filtrosMascota.sexo !== ' ' && filtrosMascota.sexo !== '2') {
      query.where('mascotas.genero', '=', filtrosMascota.sexo)
    }
    if (filtrosMascota.edad != null && filtrosMascota.edad !== '' && filtrosMascota.edad !== ' ') {
      query.orderBy('mascotas.fecha_nacimiento', filtrosMascota.edad)
    }
    if (filtrosMascota.caracteristicas.length >= 1) {
      if (filtrosMascota.caracteristicas.length === 1) {
        query.where('caracteristicas_mascota.id_caracteristica', '=', filtrosMascota.caracteristicas[0].id)
      } else {
        query.where('caracteristicas_mascota.id_caracteristica', '=', filtrosMascota.caracteristicas[0].id)
        filtrosMascota.caracteristicas.forEach(caracteristica => {
          query.orWhere('caracteristicas_mascota.id_caracteristica', '=', caracteristica.id)
        })
      }
    }
    query.where('mascotas.id_estado', '!=', 1)
    query.groupBy('mascotas.id')
    query.options({nestTables: true})
    query.then(data => res.send(data))
  })

  // Eliminar mascota
  app.delete('/deletePet/:petId', (req, res, _next) => {
    const { petId } = req.params
    knex('mascotas').where('id', petId).del().then(res.send('Mascota Eliminada')).catch(err => { console.log(err) })
  })

  // Añadir mascota
  app.post('/insertarMascota', upload.single('file'), (req, res, _next) => {
    const mascota = JSON.parse(req.body.mascota)
    const imagen = req.file ? req.file.filename : 'No image'
    const caracteristicas = mascota.caracteristicas
    delete mascota.caracteristicas
    const mascotaFormateada = {
      ...mascota,
      imagen
    }
    console.log(mascotaFormateada)
    knex('mascotas').insert(mascotaFormateada)
      .then(res => {
        const insertarCaracteristicas = caracteristicas.map(caracteristica => ({ id_mascota: res[0], id_caracteristica: caracteristica }))
        return knex('caracteristicas_mascota').insert(insertarCaracteristicas)
      })
    res.send('¡La mascota ha sido registrada correctamente!')
  })

  // Mostrar una mascota
  app.get('/mascotas/:mascotaId', (req, res, _next) => {
    const { mascotaId } = req.params
    knex('mascotas')
      .join('estados_mascota', 'mascotas.id_estado', '=', 'estados_mascota.id')
      .join('tipos_mascota', 'mascotas.id_tipo', '=', 'tipos_mascota.id')
      .select('mascotas.*', 'estados_mascota.nombre_estado', 'tipos_mascota.nombre')
      .where('mascotas.id', mascotaId)
      .options({nestTables: true})
      .then(data => res.send(data))
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
  app.delete('/deleteAdopcion/:adopcionId/:mascotaId', (req, res, _next) => {
    const adopcionId = parseInt(req.params.adopcionId)
    const mascotaID = parseInt(req.params.mascotaId)
    knex('mascotas_adoptadas')
      .where('id', adopcionId)
      .del()
      .then(function (response) {
        return knex('mascotas').where('id', mascotaID).update('id_estado', '3')
      }).catch(err => { console.log(err) })
    res.send('Adopción Eliminada')
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
    ).then(function (response) {
      return knex('mascotas').where('id', adopcion.id_mascota).update('id_estado', '1')
    }).catch(err => { console.log(err) })
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
  app.delete('/deleteAcogida/:acogidaId/:mascotaId', (req, res, _next) => {
    const acogidaId = parseInt(req.params.acogidaId)
    const mascotaID = parseInt(req.params.mascotaId)
    knex('mascotas_acogidas')
      .where('id', acogidaId)
      .del()
      .then(function (response) {
        return knex('mascotas').where('id', mascotaID).update('id_estado', '3')
      }).catch(err => { console.log(err) })
    res.send('Acogida Eliminada')
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
    ).then(function (response) {
      return knex('mascotas').where('id', acogida.id_mascota).update('id_estado', '2')
    }).catch(err => { console.log(err) })
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
