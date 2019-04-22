<template lang="pug">
  .container-fluid
    h1 {{ probando }}
    table.table.table-striped
      thead
        tr
          th(scope='col') #
          th(scope='col') dni
          th(scope='col') email
          th(scope='col') nombre
          th(scope='col') telefono
          th(scope='col') direccion
          th(scope='col') fecha nacimiento
      tbody
        tr(v-for="(user, index) in userList" :key="index")
          td {{ user.id }}
          td {{ user.dni }}
          td {{ user.email }}
          td {{ user.nombre }}
          td {{ user.telefono }}
          td {{ user.direccion }}
          td {{ user.fecha_nacimiento }}
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
  name: 'UserManagement',
  data() {
    return {
      probando: 'texto normal',
      userList: []
    }
  },
  mounted() {
    this.getUsers()
  },
  methods: {
    getUsers(){
      axios.get('http://localhost:3000/apaz/v1/usuarios')
        .then((response) => {
          this.userList = response.data
          console.log(this.userList)
        })
        .catch(function (error) {
            console.log(error);
        });
    },
  },
}
</script>

<style lang="sass" scoped>

</style>
