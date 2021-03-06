<template lang="pug">
  .container-fluid
    custom-title(title=`Administrar Adopciones` v-if="accion === 'Adopcion'")
    custom-title(v-else-if="accion == 'Acogida'" title=`Administrar Acogidas`)
    .div-botton
      b-button.icon-button(type='is-info', :icon-left="accion === 'Adopcion' ? 'heart' : 'home'", size="is-medium" @click="handleAdd(accion)") Añadir {{accion}}
    b-table(empty striped narrowed hoverable mobile-cards :data='mascotasList', :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentPage', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort='id' aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
      template(slot-scope='props')
        b-table-column(field='id', label='#', sortable)
          | {{ props.row.mascotas_acogidas_adoptadas.id }}
        b-table-column(field='mascota', label='Mascota', sortable)
          | {{ props.row.mascotas.nombre }}
        b-table-column(field='usuario', label='Usuario', sortable)
          | {{ props.row.usuarios.nombre + ' ' + props.row.usuarios.apellidos  }}
        b-table-column(field='fechaAdopcion', :label="'Fecha de ' + accion", sortable, centered)
          span.tag.is-success {{ moment(props.row.mascotas_acogidas_adoptadas.fecha_adopcion).format('DD / MM / YYYY') }}
        b-table-column(field='chip', label='Chip', sortable, centered)
          span(v-if="props.row.mascotas.chip === null") Sin chip 
          span(v-else) {{ props.row.mascotas.chip }}
        b-table-column(field='dni', label='Dni', sortable, centered)
          | {{ props.row.usuarios.dni }}
        b-table-column(field='dni', label='Dirección', sortable, centered)
          | {{ props.row.usuarios.direccion + ' ' + props.row.usuarios.direccion2 + ', ' + props.row.provincias.provincia  }}
        b-table-column(field="operaciones", label="Operaciones" centered)
          .icons-box
            b-button.icon-button(type="is-primary", icon-left='info-circle', size="is-medium" @click="handleInfo(props.row.usuarios)")
            b-button.icon-button(type='is-danger', icon-left='trash', size="is-medium" @click="handleDelete(props.row.mascotas_acogidas_adoptadas.id, props.row.mascotas_acogidas_adoptadas.id_mascota)")
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
const moment = require('moment')
import Title from '@/components/title'
import AddAdopcion from '@/components/modals/adopciones/AddAdopcion'

export default {
  name: 'AdoptionManagment',
  components: {
    'custom-title': Title
  },
  mounted () {
    this.fetchData()
  },
  data() {
    return {
      moment: moment,
      isPaginated: true,
      isPaginationSimple: true,
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 10,
      mascotasList: [],
      matchsList: [],
      usuariosMatch: [],
    }
  },
  props: {
    accion: {
      type: String,
      default: 'Adopcion'
    }
  },
  watch: {
    accion: {
      // the callback will be called immediately after the start of the observation
      immediate: true, 
      handler (val, oldVal) {
       this.fetchData()
      }
    }
  },
  methods: {
    fetchData() {
      if(this.accion === 'Adopcion') {
        this.getAdoptions()
        this.getMatchs()
      }else if(this.accion === 'Acogida'){
        this.getAcogidas()
        this.getMatchs()
      }
    },
    getAdoptions() {
      axios.get('http://localhost:3000/apaz/v1/adopciones').then(response =>{
        this.mascotasList = response.data
      }).catch(error =>{
        console.log(error)
      })
    },
    getAcogidas() {
      axios.get('http://localhost:3000/apaz/v1/acogidas').then(response =>{
        this.mascotasList = response.data
      }).catch(error =>{
        console.log(error)
      })
    },
    getMatchs() {
      axios.get('http://localhost:3000/apaz/v1/matchs').then(response =>{
        this.matchsList = response.data
      }).catch(error =>{
        console.log(error)
      })
    },
    deleteAdopcion(id, id_mascota){
      axios.delete(`http://localhost:3000/apaz/v1/deleteAdopcion/${id}/${id_mascota}`)
      .then((response) => {
        this.$toast.open(response.data)
        this.fetchData()
      })
      .catch(function (error){
        console.log(error);
      })
    },
    deleteAcogida(id, id_mascota){
      axios.delete(`http://localhost:3000/apaz/v1/deleteAcogida/${id}/${id_mascota}`)
      .then((response) => {
        this.$toast.open(response.data)
        this.fetchData()
      })
      .catch(function (error){
        console.log(error);
      })
    },
    handleDelete(id, id_mascota) {
      this.$dialog.confirm({
        title: 'Eliminar Adopción',
        message: `¿Está seguro de que quiere <b>eliminar</b> esta ${this.accion}? Esta acción no se podrá deshacer.`,
        confirmText: `Eliminar ${this.accion}`,
        type: 'is-danger',
        hasIcon: true,
        onConfirm: () => this.accion === 'Adopcion' ? this.deleteAdopcion(id, id_mascota) : this.deleteAcogida(id, id_mascota)
      })
    },
    handleAdd(accion) {
      this.$modal.open({
        parent: this,
        component: AddAdopcion,
        hasModalCard: true,
        props: { accion: accion }
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
