<template lang="pug">
  .container-fluid
    custom-title(title="Administrar Mascotas")
    .div-botton
      b-button.icon-button(type='is-info', icon-left='paw', size="is-medium" @click="$router.push('pet-add')") Nueva mascota
    b-table(empty striped narrowed hoverable mobile-cards :data='petList', :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentPage', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort='id' aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
      template(slot-scope='props')
        b-table-column(field='mascotas.id', label='#', sortable)
          | {{ props.row.mascotas.id }}
        b-table-column(field='mascotas.nombre', label='Nombre', sortable)
          | {{ props.row.mascotas.nombre }}
        b-table-column(field='mascotas.estado_mascota', label='Estado', sortable)
          | {{ props.row.estados_mascota.nombre_estado }}
        b-table-column(field='mascotas.fechaNacimiento', label='Fecha de nacimiento', sortable, centered)
          span.tag.is-success(v-if="props.row.mascotas.fecha_nacimiento != null") {{ moment.unix(props.row.mascotas.fecha_nacimiento).format('DD / MM / YYYY') }}
          span.tag.is-info(v-else) Desconocida
        b-table-column(field='mascotas.fechaRegistro', label='Fecha de registro', sortable, centered)
          span.tag.is-success
            | {{ moment(props.row.fecha_registro).format('DD / MM / YYYY') }}
        b-table-column(field='mascotas.genero', label='Género', sortable, centered)
          b-icon(pack='fas', :icon="props.row.mascotas.genero === 0 ? 'mars' : 'venus'")
        b-table-column(field="mascotas.chip", label="Chip", sortable)
          div(v-if="props.row.mascotas.chip != null && props.row.mascotas.chip != ''") {{ props.row.mascotas.chip }}
          div(v-else) Sin chip
        b-table-column(field="mascotas.raza", label="Raza", sortable)
          div(v-if="props.row.mascotas.raza != null && props.row.mascotas.raza != ''") {{ props.row.mascotas.raza }}
          div(v-else) Desconocida
        b-table-column(field="operaciones", label="Operaciones" centered)
          .icons-box
            b-button.icon-button(type='is-danger', icon-left='trash', size="is-medium" @click="handleDelete(props.row.mascotas.id)")
            b-button.icon-button(type="is-primary", icon-left='edit', size="is-medium" @click="handleEdit(props.row.mascotas)")
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
const moment = require('moment')
import Title from '@/components/title'

export default {
  name: 'PetManagment',
  components: {
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
      petList: []
    }
  },
  created () {
    this.fetchData()
  },
  mounted() {
    this.fetchData()
    this.$on('refresh-pet-table', this.fetchData())
  },
  methods: {
    fetchData() {
      this.getPets()
    },
    getPets() {
      axios.get('http://localhost:3000/apaz/v1/mascotas').then(response =>{
        this.petList = response.data
      }).catch(error =>{
        console.log(error)
      })
    },
    deletePet(id){
      axios.delete(`http://localhost:3000/apaz/v1/deletePet/${id}`)
      .then((response) => {
        this.$toast.open(response.data)
        this.fetchData()
      })
      .catch(function (error){
        console.log(error);
      })
    },
    handleDelete(id) {
      this.$dialog.confirm({
        title: 'Eliminar Mascota',
        message: '¿Está seguro de que quiere <b>eliminar</b> esta mascota? Esta acción no se podrá deshacer.',
        confirmText: 'Eliminar Mascota',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: () => this.deletePet(id)
      })
    },
    handleEdit(mascota) {
      this.$router.push({ name: `petAdd`, params: { pet_edit: mascota } })
    }
  },
}
</script>

<style lang="sass" scoped>
  .icons-box
    display: flex
    justify-content: space-around
</style>
