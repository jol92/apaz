<template lang="pug">
  .container-fluid
    custom-title(title="Administrar Usuarios")
    b-table(empty striped narrowed hoverable mobile-cards :data='userList', :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentPage', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort="id", aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
      template(slot-scope='props')
        b-table-column(field='id', label='#', sortable)
          | {{ props.row.id_usuario }}
        b-table-column(field='dni', label='Dni', sortable)
          | {{ props.row.dni }}
        b-table-column(field='nombre', label='Nombre', sortable)
          | {{ props.row.nombre + ' ' + props.row.apellidos}}
        b-table-column(field='email', label='E-mail', sortable)
          | {{ props.row.email }}
        b-table-column(field='telefono', label='Teléfono', sortable)
          | {{ props.row.telefono }}
        b-table-column(field='direccion', label='Direccion', sortable)
          | {{ props.row.direccion + ' ' + props.row.direccion2 + ', ' + props.row.provincia }}
        b-table-column(field='vivienda', label='Vivienda', sortable)
          | {{ props.row.nombre_vivienda }}
        b-table-column(field='date', label='Fecha de Nacimiento', sortable, centered)
          span.tag.is-success
            | {{ moment.unix(props.row.fecha_nacimiento).format('DD / MM / YYYY') }}
        b-table-column(field="operaciones", label="Operaciones" centered)
          .icons-box
            b-button.icon-button(type='is-danger', icon-left='trash', size="is-medium" @click="handleDelete(props.row.id_usuario)")
            b-button.icon-button(type="is-primary", icon-left='user-edit', size="is-medium" @click="handleEdit(props.row)")
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
import ModalUsuario from '@/components/modals/usuario/registro'
const moment = require('moment')
import Title from '@/components/title'
import ModalUsuarioVue from '@/components/modals/usuario/registro'

export default {
  name: 'UserManagement',
  components: {
    'modal-usuario': ModalUsuario,
    'custom-title': Title
  },
  data() {
    return {
      moment: moment,
      isPaginated: true,
      isPaginationSimple: true,
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 10,
      userList: [],
    }
  },
  mounted() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.getUsers()
    },
    getUsers(){
      axios.get('http://localhost:3000/apaz/v1/usuarios')
        .then((response) => {
          this.userList = response.data
        })
        .catch(function (error) {
            console.log(error);
        })
    },
    deleteUser(id){
      axios.delete(`http://localhost:3000/apaz/v1/deleteUser/${id}`)
      .then((response) => {
        this.$toast.open('Usuario Eliminado!')
        this.fetchData()
      })
      .catch(function (error){
        console.log(error);
      })
    },
    handleEdit(user) {
      this.$modal.open({
        parent: this,
        component: ModalUsuarioVue,
        hasModalCard: true,
        props: { user_edit: user }
      })
    },
    handleDelete(id) {
      this.$dialog.confirm({
        title: 'Eliminar Usuario',
        message: '¿Está seguro de que quiere <b>eliminar</b> el usuario? Esta acción no se podrá deshacer.',
        confirmText: 'Eliminar Usuario',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: () => this.deleteUser(id)
      })
    }
  },
}
</script>

<style lang="sass" scoped>
  .icons-box
    display: flex
    justify-content: space-around
</style>
