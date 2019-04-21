<template lang="pug">
  .container-fluid
    table.table.table-striped
      thead
        tr
          th(scope='col') #
          th(scope='col') First
          th(scope='col') Last
          th(scope='col') Handle
      tbody
        tr(v-for="(user, index) in userList" :key="index")
          td {{user.nombre}}
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'

export default {
  data: {
    userList: []
  },
  mounted: function() {
    this.getUsers()
  },
  methods: {
    getUsers(){
      axios.get('localhost:3000/apaz/v1/usuarios/')
        .then(function (response) {
            console.log(response.data);
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
