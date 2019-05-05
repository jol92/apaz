<template lang="pug">
  form(action='')
    .modal-card(style='width: 700')
      header.modal-card-head
        p.modal-card-title ¡Gracias por ayudarnos!
      section.modal-card-body
        form(@submit.prevent='validateBeforeSubmit')
          b-field(label='Nombre *', :type="{'is-danger': errors.has('nombre')}", :message="errors.first('nombre')")
            b-input(v-model='user.nombre', name='nombre', v-validate="'required'", placeholder='Introduzca su nombre')

          b-field(label='Apellidos *', :type="{'is-danger': errors.has('apellidos')}", :message="errors.first('apellidos')")
            b-input(v-model='user.apellidos', name='apellidos', v-validate="'required'", placeholder='Introduzca sus apellidos')

          b-field(label='Fecha de Nacimiento *', :type="{'is-danger': errors.has('fecha de nacimiento')}", :message="errors.first('fecha de nacimiento')")
            b-datepicker(placeholder='Pulsa para seleccionar una fecha', editable, icon='calendar-day', name='fecha de nacimiento' v-model='fecha', v-validate="'required'" )

          b-field(label='E-mail *', :type="{'is-danger': errors.has('email')}", :message="errors.first('email')")
            b-input(type='text', v-model='user.email', name='email', v-validate="'required|email'", placeholder='email@email.com')

          b-field(label='Teléfono *', :type="{'is-danger': errors.has('telefono')}", :message="errors.first('telefono')")
            b-input(v-model='user.telefono', name='telefono', v-validate="'required|max:9|min:9|integer'", placeholder='Introduzca su nº de teléfono')
          
          b-field(label='Dni *', :type="{'is-danger': errors.has('dni')}", :message="errors.first('dni')")
            b-input(type='text', v-model='user.dni', name='dni', v-validate="'required'", placeholder='Introduzca su DNI')

          b-field(label='Direccion 1', :type="{'is-danger': errors.has('direccion')}", :message="errors.first('direccion')")
            b-input(type='text', v-model='user.direccion1', name='direccion', v-validate="'required'", placeholder='Calle nº, piso puerta')

          b-field(label='Direccion 2', :type="{'is-danger': errors.has('direccion')}", :message="errors.first('direccion')")
            b-input(type='text', v-model='user.direccion2', name='direccion', v-validate="'required'", placeholder='Código postal, Localidad')

          b-field(label='Provincia', :type="{'is-danger': errors.has('provincia')}", :message="errors.first('provincia')")
            b-select(v-model='user.provincia', name='provincia', placeholder='Seleccione su provincia', v-validate="'required'")
              option(v-for="(provincia, index) in provinciasList" :key="provincia.id_provincia"  :value='provincia.id_provincia') {{provincia.provincia}}

          b-field(label='Tipo Vivienda')
            b-select(v-model='user.tipoVivienda', name='vivienda', placeholder='¿Cómo es su vivienda?')
              option(v-for="(vivienda, index) in viviendasList" :key="vivienda.id_vivienda"  :value="vivienda.id_vivienda") {{vivienda.nombre_vivienda}}
          
          b-field(label="Seleccione las características que busca en una mascota")
            b-taglist
              b-tag( rounded type='is-success' v-if="user.preferencias.length > 0" v-for="preferencia in caracteristicasUserList" :key="preferencia.id" closable @close="removePreferencia(preferencia)" ) {{ preferencia.nombre_caracteristica }}
              br
              .lista_caracteristicas_box 
                b-button.custom_tags(rounded size="is-small" type="is-info" v-for="caracteristica in caracteristicasList" :key="caracteristica.id" @click.prevent="asignarPreferencia(caracteristica)") {{ caracteristica.nombre_caracteristica }}

          b-field(label='Contraseña', :type="{'is-danger': errors.has('password')}", :message="errors.first('password')")
            b-input(type='password', v-model='user.password', name='password', v-validate="'required|min:8'", data-vv-as="contraseña")

          b-field(label='Confirmar Contraseña', :type="{'is-danger': errors.has('confirm-password')}", 
          :message="[{\'El campo confirmar contraseña es obligatorio' : errors.firstByRule('confirm-password', 'required'),\'¡Las contraseñas son distintas!' : errors.firstByRule('confirm-password', 'is')\
          }]")
            b-input(type='password', v-model='confirmPassword', name='confirm-password', v-validate='{ required: true, is: user.password }')

          b-field(label='', :type="{'is-danger': errors.has('flag-terms')}", :message="{'Por favor marque la casilla para continuar' : errors.firstByRule('flag-terms', 'required')}")
            b-checkbox(v-model='flagTerms', name='flag-terms', v-validate="'required:false'")
              | Estoy de acuerdo con los términos y condiciones

          .button-box
            button.button.is-primary(type='submit')  Resgistrarse
            button.button.is-danger(type='button', @click='$parent.close()') Cerrar
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
const moment = require('moment');

export default {
  data() {
    return {
      moment:moment,
      fecha: null,
      user: {
        nombre: null,
        apellidos: null,
        fecha_nac: null,
        dni: null,
        email: null,
        telefono: null,
        provincia: null,
        direccion1: null,
        direccion2: null,
        tipoVivienda: null,
        password: null,
        preferencias: []
      },
      confirmPassword: null,
      flagTerms: false,
      provinciasList: [],
      viviendasList: [],
      caracteristicasList: [],
      caracteristicasUserList: []
    }
  },
  mounted() {
    this.getProvincias()
    this.getViviendas()
    this.getCaracteristicas()
  },
  methods: {
    validateBeforeSubmit() {
      this.$validator.validateAll().then((result) => {
        if (result) {
          this.$toast.open({
            message: 'Se ha registrado correctamente. ¡Muchas gracias!',
            type: 'is-success',
            position: 'is-bottom'
          })
          this.user.fecha_nac = moment(this.fecha).unix()
          this.user.telefono = parseInt(this.user.telefono)
          this.postUsuario()
          this.$parent.close()
          this.$parent.fetchData()
          return;
        }
        this.$toast.open({
          message: 'Ha ocurrido un error. Por favor revise el formulario',
          type: 'is-danger',
          position: 'is-bottom'
        })
      });
    },
    getProvincias(){
      axios.get('http://localhost:3000/apaz/v1/provincias')
        .then((response) => {
          this.provinciasList = response.data
          console.log(this.provinciasList)
        })
        .catch(function (error) {
            console.log(error);
        });
    },
    getViviendas(){
      axios.get('http://localhost:3000/apaz/v1/viviendas')
        .then((response) => {
          this.viviendasList = response.data
          console.log(this.viviendasList)
        })
        .catch(function (error) {
            console.log(error);
        });
    },
    getCaracteristicas(){
      axios.get('http://localhost:3000/apaz/v1/caracteristicas')
        .then((response) => {
        this.caracteristicasList = response.data
      })
    },
    postUsuario(){
      axios.post('http://localhost:3000/apaz/v1/insertUsuario', {
        usuario: this.user
      })
      .then((response) => {
        console.log(response)
      })
      .catch(function (error) {
        console.log(error);
      });
    },
    asignarPreferencia: function (caracteristica) {
      this.caracteristicasList = this.caracteristicasList.filter(item => item.id !== caracteristica.id)
      this.caracteristicasUserList.push(caracteristica)
      this.user.preferencias.push(caracteristica.id)
    },
    removePreferencia(preferencia){
      this.user.preferencias = this.user.preferencias.filter(item => item.id !== preferencia.id)
      this.caracteristicasUserList = this.caracteristicasUserList.filter(item => item.id !== preferencia.id)
      this.caracteristicasList.push(preferencia)
    }
  }
}
</script>

<style lang="sass" scoped>
  .custom_tags
    margin: 2px
  .lista_caracteristicas_box
    margin-top: 10px
  .button-box
    margin-top: 50px
    display: flex
    justify-content: space-around
</style>
