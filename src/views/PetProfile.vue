<template lang="pug">
  .container-fluid
    custom-title(:title="'Conoce a ' + mascota.nombre")
    .pet-layout
      .nada-side
      .img-side
        img.imagen(:src="ruta + mascota.imagen")
      .nada-side
      .info-side
        .info-title Información  
          b-icon(pack="fas", icon='info-circle')
        .info
          b-icon(pack="fas", icon='heart')
          .titulo Nombre:
          .value {{ mascota.nombre }}
        .info
          b-icon(pack="fas", icon='venus-mars')
          .titulo Sexo:
          .value(v-if="mascota.genero === 0") Macho
          .value(v-else) Hembra
        .info
          b-icon(pack="fas", icon='birthday-cake')
          .titulo Edad:
          .value(v-if="mascota.fecha_nacimiento != null") {{ moment.unix(mascota.fecha_nacimiento).toNow(true) }}
          .value(v-else) Desconocida
        .info
          b-icon(pack="fas", icon='bone')
          .titulo Raza:
          .value(v-if="mascota.raza != ''") {{ mascota.raza }}
          .value(v-else) Desconocida
        .info
          b-icon(pack='fas', :icon="mascota.tipo === 'Perro' ? 'dog' : mascota.tipo === 'Gato' ? 'cat' : 'paw'")
          .titulo Tipo:
          .value {{ mascota.tipo }}
      .nada-side
    .descripcion
      custom-title(title="Descripción")
      div(v-html="mascota.descripcion")
    .interest
      custom-title(:title="`¿Quieres ayudar a ${mascota.nombre}?`")
      .donation-box
        .info
          .titulo Únete a nuestro teaming:
          .value 
            a https://www.teaming.net/apaz?lang=es_ES
        .info
          .titulo Haz tu donativo:
        p BBK CAJASUR - BIC: CSURES2CXXX - IBAN: ES09 0237 0197 1091 5619 7772 
        p BANKIA - BIC: CAHMESMMXXX . IBAN: ES11 2038 5859 2160 0059 0703


      .button-box
        b-button.icon-button(type='is-info', icon-left='paw', size="is-medium" @click="handleAdd(accion)") Quiero acoger a {{ mascota.nombre }}
        b-button.icon-button(type='is-info', icon-left='paw', size="is-medium" @click="handleAdd(accion)") Quiero adoptar a {{ mascota.nombre }}
</template>

<script>
  import axios from 'axios'
  import VueAxios from 'vue-axios'
  import Title from '@/components/title'
  const moment = require('moment')
  import 'moment/locale/es'
  
  export default {
    name: 'PetProfile',
    components: {
      'custom-title': Title
    },
    created() {
      this.id = this.$route.params.id
    },
    mounted() {
      this.fetchData()
    },
    data() {
      return {
        moment: moment,
        ruta: '../../static/img/',
        id: null,
        mascota: {
          id: null,
          nombre: null,
          tipo: null,
          genero: null,
          imagen: null,
          raza: null,
          caracteristicas: [],
          fecha_nacimiento: null,
          descripcion: null
        }
      }
    },
    methods: {
      fetchData() {
        this.getMascota()
        this.getCaracteristicaMascota()
        console.log(this.mascota)
      },
      getMascota() {
        axios.get(`http://localhost:3000/apaz/v1/mascotas/${this.id}`).then(response =>{
          this.mascota.id = response.data[0].mascotas.id
          this.mascota.nombre = response.data[0].mascotas.nombre
          this.mascota.tipo = response.data[0].tipos_mascota.nombre
          this.mascota.genero = response.data[0].mascotas.genero
          this.mascota.imagen = response.data[0].mascotas.imagen
          this.mascota.raza = response.data[0].mascotas.raza
          this.mascota.fecha_nacimiento = response.data[0].mascotas.fecha_nacimiento
          this.mascota.descripcion = response.data[0].mascotas.descripcion
        }).catch(error =>{
          console.log(error)
        })
      },
      getCaracteristicaMascota() {
        axios.get(`http://localhost:3000/apaz/v1/getCaracteristicasMascota/${this.id}`).then(response =>{
          response.data.forEach(caracteristica => {
            this.mascota.caracteristicas.push(caracteristica.caracteristicas.nombre_caracteristica) 
          })
        }).catch(error =>{
          console.log(error)
        })
      }
    }
  }
</script>

<style lang="sass" scoped>
  .pet-layout
    display: flex
    width: 100%
    border-radius: 40px
    padding-top: 5px
    flex-wrap: wrap
    .img-side
      flex: 3
      min-width: 360px
      img
        border-radius: 10px
    .nada-side
      flex: 1
      max-width: 100px
    .info-side
      flex: 1
      min-width: 210px
      text-align: left
      .icon
        color: #8c8bde
      .info-title
        width: 100%
        font-weight: bolder
        font-size: 28px
        margin-bottom: 20px
  .info
    display: flex
    margin-left: 10px
    margin-top: 20px
    .value
      margin-left: 10px
    .titulo
      font-weight: bold
    .icon
      margin-right: 10px
  .button-box
    margin-top: 50px
    display: flex
    justify-content: space-around
</style>
