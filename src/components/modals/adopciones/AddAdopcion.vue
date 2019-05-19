<template lang="pug">
    .modal-card(style='width: 1000px')
      header.modal-card-head
        p.modal-card-title Añadir {{ accion }}
      section.modal-card-body
        .double-table
          table
            custom-title(title="Seleccione Usuario")
            b-table.data_table(:data='usuariosList', :selected.sync='selected_usuario', focusable='' empty striped narrowed hoverable mobile-cards :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentTable1Page', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort='id' aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
              template(slot-scope='props')
                b-table-column(field='id', label='#', sortable)
                  | {{ props.row.id_usuario }}
                b-table-column(field='dni', label='Dni', sortable)
                  | {{ props.row.dni }}
                b-table-column(field='nombre', label='Nombre', sortable)
                  | {{ props.row.nombre + ' ' + props.row.apellidos}}
          table
            custom-title(title="Seleccione Mascota")
            b-table.data_table(:data='mascotasList', :selected.sync='selected_mascota', focusable='' empty striped narrowed hoverable mobile-cards :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentTable2Page', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort='id' aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
              template(slot-scope='props')
                b-table-column(field='id', label='#', sortable)
                  | {{ props.row.id }}
                b-table-column(field='nombre', label='Nombre', sortable)
                  | {{ props.row.nombre }}
        .button-box
          button.button.is-primary(type='button', @click="addAccion")  Añadir
          button.button.is-danger(type='button', @click='$parent.close()') Cerrar
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
import Title from '@/components/title'

export default {
  name: 'AddAdopcion',
  components: {
    'custom-title': Title
  },
  mounted() {
    this.fetchData()
  },
  props: {
    accion: {
      type: String,
      default: ''
    }
  },
  data() {
    return {
      usuariosList: [],
      mascotasList: [],
      selected_usuario: null,
      selected_mascota: null,
      isPaginated: true,
      isPaginationSimple: true,
      defaultSortDirection: 'asc',
      currentTable1Page: 1,
      currentTable2Page: 1,
      perPage: 10,
    }
  },
  methods: {
    fetchData() {
      this.getUsers()
      if(this.accion === 'Adopcion'){
        this.getMascotasNoAdoptadas()
      }
      else{
        this.getMascotasParaAcoger()
      }
    },
    getUsers() {
      axios.get('http://localhost:3000/apaz/v1/usuarios')
        .then((response) => {
          this.usuariosList = response.data
        })
        .catch(function (error) {
            console.log(error);
        })
    },
    getMascotasNoAdoptadas() {
      axios.get('http://localhost:3000/apaz/v1/mascotasNoAdoptadas')
        .then((response) => {
          this.mascotasList = response.data
        })
        .catch(function (error) {
            console.log(error);
        })
    },
    getMascotasParaAcoger() {
      axios.get('http://localhost:3000/apaz/v1/mascotasDisponibles')
        .then((response) => {
          this.mascotasList = response.data
        })
        .catch(function (error) {
            console.log(error);
        })
    },
    addAccion() {
      if(this.selected_usuario === null || this.selected_mascota === null) {
        this.$toast.open({
          duration: 5000,
          message: `¡Debe seleccionar una mascota y un usuario!`,
          position: 'is-bottom',
          type: 'is-danger'
        })
      }else {
        this.accion === 'Adopcion' ? this.postAdopcion() : this.postAcogida()
      }
    },
    postAdopcion() {
      let adopcion = {
        id_mascota: this.selected_mascota.id,
        id_usuario: this.selected_usuario.id_usuario
      }
      axios.post('http://localhost:3000/apaz/v1/insertarAdopcion', {
        adopcion: adopcion
      })
      .then(response => {
        console.log(response)
        this.$toast.open({
          message: response.data,
          type: 'is-info',
          position: 'is-bottom'
        })
      })
      .catch(function (error) {
        console.log(error);
      })
    },
    postAcogida() {
      let acogida = {
        id_mascota: this.selected_mascota.id,
        id_usuario: this.selected_usuario.id_usuario
      }
      axios.post('http://localhost:3000/apaz/v1/insertarAcogida', {
        acogida: acogida
      })
      .then(response => {
        console.log(response)
        this.$toast.open({
          message: response.data,
          type: 'is-info',
          position: 'is-bottom'
        })
      })
      .catch(function (error) {
        console.log(error);
      })
    } 
  }
}
</script>

<style lang="sass" scoped>
  .double-table
    display: flex
    flex-wrap: wrap
    justify-content: space-between
  .table
    text-align: center
  .button-box
    margin-top: 50px
    display: flex
    justify-content: space-around
</style>
