<template lang="pug">
  .container-fluid
    custom-title(:title="action + ' Mascota'" icon="paw")
    form.formulario(@submit.prevent='validateBeforeSubmit' enctype="multipart/form-data")
      b-field(label='Nombre *', :type="{'is-danger': errors.has('nombre')}", :message="errors.first('nombre')")
        b-input(v-model='pet.nombre', name='nombre', v-validate="'required'", placeholder='Introduzca el nombre')

      b-field(label='Fecha de Nacimiento')
        b-datepicker(placeholder='Pulsa para seleccionar una fecha', editable, icon='calendar-day', name='fecha de nacimiento' v-model='fecha' )

      b-field(label='Chip', :type="{'is-danger': errors.has('chip')}", :message="errors.first('chip')")
        b-input(v-model='pet.chip', name='chip', v-validate="'numeric|length:15'", placeholder='Introduzca el chip')
     
      b-field.file(label="Seleccione la imagen de la mascota *" :type="{'is-danger': errors.has('imagen')}", :message="errors.first('imagen')")
        .upload-box
          b-upload(v-model='pet.imagen' name="imagen", v-validate="'required'")
            a.button.is-primary
              b-icon(icon='upload')
              span Click to upload
          span.file-name(v-if='pet.imagen')
            | {{ pet.imagen.name }}

      b-field(label='Tipo *', :type="{'is-danger': errors.has('tipo')}", :message="errors.first('tipo')")
        b-select(v-model='pet.id_tipo', name='tipo', placeholder='Seleccione el tipo', v-validate="'required'")
          option(v-for="(tipo, index) in tiposList" :key="tipo.id"  :value='tipo.id') {{tipo.nombre}}
    
      b-field(label="Características de la mascota")
        b-taglist
          b-tag( rounded type='is-success' v-if="pet.caracteristicas.length > 0" v-for="caracteristica in caracteristicasPetList" :key="caracteristica.id" closable @close="removeCaracteristica(caracteristica)" ) {{ caracteristica.nombre_caracteristica }}
          br
          .lista_caracteristicas_box 
            b-button.custom_tags(rounded size="is-small" type="is-info" v-for="caracteristica in caracteristicasList" :key="caracteristica.id" @click.prevent="asignarCaracteristica(caracteristica)") {{ caracteristica.nombre_caracteristica }}
          b-input.nueva(v-model="new_caracteristica", placeholder="Añadir una nueva característica a la lista..." size="is-small" rounded)
          b-button(type='is-success', icon-right='check' size="is-small" rounded @click="insertarCaracteristica(new_caracteristica)")

      b-field(label='Raza')
        b-input(v-model='pet.raza', name='chip', placeholder='Introduzca la raza')
        
      b-field.genero(label="Género *" :type="{'is-danger': errors.has('genero')}", :message="errors.first('genero')")
        .boton-margin
          b-radio-button.gender-buttons(v-model='pet.genero', native-value=0, type='is-info', name="genero", v-validate="'required'")
            b-icon(icon='mars')
            span Macho
          b-radio-button.gender-buttons(v-model='pet.genero', native-value=1, type='is-danger', name="genero", v-validate="'required'")
            b-icon(icon='venus')
            span Hembra

      b-field.info(label="Descripción" style="width: 80%")
        vue-editor(v-model="pet.descripcion")

      .button-box(style="width: 100%")
        b-button.is-primary(size="is-medium" native-type="submit")  Añadir Mascota
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
const moment = require('moment')
import Title from '@/components/title'
import { VueEditor } from 'vue2-editor'

export default {
  name: 'PetAdd',
  components: {
    'custom-title': Title,
    VueEditor
  },
  data() {
    return {
      action: 'Añadir',
      tiposList: [],
      pet: {
        nombre: null,
        fecha_nacimiento: null,
        chip: null,
        genero: null,
        id_estado: 3,
        caracteristicas: [],
        descripcion: '',
        imagen: null,
        raza: null
      },
      fecha: null,
      caracteristicasList: [],
      caracteristicasPetList: [],
      new_caracteristica: null
    }
  },
  mounted() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.getCaracteristicas()
      this.getTipos()
    },
    getFiles(files){
      console.log(this.pet.imagen)
      console.log(files)
    },
    getTipos() {
      axios.get('http://localhost:3000/apaz/v1/tipos_mascota')
        .then(response => {
          this.tiposList = response.data
        })
        .catch(err => {
          console.log(err)
        })
    },
    getCaracteristicas() {
      axios.get('http://localhost:3000/apaz/v1/caracteristicas')
        .then((response) => {
          this.caracteristicasList = response.data
        })
    },
    asignarCaracteristica: function (caracteristica) {
      this.caracteristicasList = this.caracteristicasList.filter(item => item.id !== caracteristica.id)
      this.caracteristicasPetList.push(caracteristica)
      this.pet.caracteristicas.push(caracteristica.id)
    },
    removeCaracteristica(caracteristica){
      this.pet.caracteristicas = this.pet.caracteristicas.filter(item => item.id !== caracteristica.id)
      this.caracteristicasPetList = this.caracteristicasPetList.filter(item => item.id !== caracteristica.id)
      this.caracteristicasList.push(caracteristica)
    },
    insertarCaracteristica() {
      axios.post('http://localhost:3000/apaz/v1/insertarCaracteristica', {
        caracteristica: this.new_caracteristica
      }).then(res =>{
          this.$toast.open({
          message: res.data,
          type: 'is-info',
          position: 'is-bottom'
        })
        this.fetchData()
      })
      .catch(err => {
        console.log(err)
      })
    },
    validateBeforeSubmit() {
      this.$validator.validateAll().then((result) => {
        if (result) {
          this.fecha != null ? this.pet.fecha_nacimiento = moment(this.fecha).unix() : ''
          this.pet.genero = parseInt(this.pet.genero)
          this.pet.chip = parseInt(this.pet.chip)
          this.postMascota()
          this.$router.push('pet-management')
        }else {
          this.$toast.open({
            message: 'Ha ocurrido un error. Por favor revise el formulario',
            type: 'is-danger',
            position: 'is-bottom'
          })
        }
      });
    },
    postMascota(){
      const formData = new FormData()
      formData.append('file', this.pet.imagen)
      formData.append('mascota', JSON.stringify(this.pet))
      axios({
        method: 'POST',
        url: 'http://localhost:3000/apaz/v1/insertarMascota',
        data: formData,
        config: { headers: {'Content-Type': 'multipart/form-data' }}
      })
      .then(response => {
        this.$toast.open({
          message: response.data,
          type: 'is-info',
          position: 'is-bottom'
        })
      })
      .catch(function (error) {
        console.log(error);
      });
    }
  },
}
</script>

<style lang="sass" scoped>
  .formulario
    display: flex
    flex-wrap: wrap
    justify-content: center
    .field
      width: 40%
      margin: 10px
      min-width: 400px
    .field.file
      flex-wrap: wrap
    .field.genero
      flex-wrap: wrap
  .upload-box
    display: flex
    margin-right: 500px
  .boton-margin
    display: flex
    .gender-buttons
     margin-right: 5px
  .custom_tags
    margin: 2px
  .lista_caracteristicas_box
    margin-top: 10px
  .nueva
    width: 400px !important
    margin-top: 5px
  .info
    width: 100%
  .button-box
    text-align: center
    margin-top: 20px
</style>
