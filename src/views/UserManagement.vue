<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
import ModalUsuario from '@/components/modals/usuario'
const moment = require('moment');

export default {
  name: 'UserManagement',
  components: {
    'modal-usuario': ModalUsuario
  },
  data() {
    return {
      moment:moment,
      isPaginated: true,
      isPaginationSimple: true,
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 5,
      userList: [],
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

<template lang="pug">
  .container-fluid
    b-icon(pack="fas" icon="home" size="is-medium" type="is-success")
    b-table(:data='userList', :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentPage', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page')
      template(slot-scope='props')
        b-table-column(field='id', label='#', width='40', sortable='', numeric='')
          | {{ props.row.id_usuario }}
        b-table-column(field='dni', label='dni', sortable='')
          | {{ props.row.dni }}
        b-table-column(field='email', label='email', sortable='')
          | {{ props.row.email }}
        b-table-column(field='provincia', label='provincia', sortable='')
          | {{ props.row.provincia }}
        b-table-column(field='date', label='fecha de nacimiento', sortable='', centered='')
          span.tag.is-success
            | {{ moment(props.row.fecha_nacimiento).format('DD / MM / YYYY') }}
</template>

<style lang="sass" scoped>

</style>
