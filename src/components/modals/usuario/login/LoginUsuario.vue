<template lang="pug">
  form(action='')
    .modal-card(style='width: 400px')
      header.modal-card-head
        p.modal-card-title Iniciar Sesión
      section.modal-card-body
        form(@submit.prevent='validateBeforeSubmit')
          b-field(label='E-mail', :type="{'is-danger': errors.has('email')}", :message="errors.first('email')")
            b-input(type='text', v-model='usuario.email', name='email', v-validate="'required|email'")
          b-field(label='Contraseña', :type="{'is-danger': errors.has('password')}", :message="errors.first('password')")
            b-input(type='password', v-model='usuario.password', name='password', v-validate="'required'", data-vv-as="contraseña")
          .button-box
            button.button.is-primary(type='submit')  Entrar
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
  data() {
    return {
      usuario: {
        email: null,
        password: null
      }
    }
  },
  methods: {
    validateBeforeSubmit() {
      this.$validator.validateAll().then((result) => {
        if (result) {
          this.loginUsuario()
          this.$parent.close()
          return;
        }
      })
    },
    loginUsuario(){
      axios.post('http://localhost:3000/apaz/v1/loginUsuario', {
        usuario: this.usuario
      }).then((response) => {
        if(response.data.mensaje != null){
          localStorage.setItem('logedUser',JSON.stringify(response.data))
          this.$toast.open({
            message: response.data.mensaje,
            type: 'is-success',
            positivon: 'is-bottom'
          })
          this.$router.go()
        } else {
          this.$toast.open({
            message: response.data,
            type: 'is-warning',
            positivon: 'is-bottom'
          })
        }
      }).catch((error) => {
        console.log(error)
      })
    }
  },
}
</script>

<style lang="sass" scoped>

</style>
