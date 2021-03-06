<template lang="pug">
  .container
    .filter-box
      custom-title(title="Filtrar búsqueda")
      b-input(v-model='filtros.buscador' placeholder="Introduzca nombre de mascota o raza")
      .normal-filters
        b-field(label="Especie")
          b-select(v-model="filtros.tipo", placeholder="Seleccione la especie")
            option(value=0) Todos
            option(value=1) Perro
            option(value=2) Gato
            option(value=3) Otro
        b-field(label="Sexo")
          b-select(v-model="filtros.sexo", placeholder="Seleccione el sexo")
            option(value=2) Todos
            option(value=0) Macho
            option(value=1) Hembra
        b-field(label="Edad")
          b-select(v-model="filtros.edad", placeholder="Ordenar por edad")
            option(value='DESC') Primero cachorros
            option(value='ASC') Primero adultos
      .caracteristicas-box
        custom-title(title="Seleccionar características" subtitle)
        b-tag(rounded :id="`eltag${caracteristica.id}`" type="is-primary" v-for="caracteristica in caracteristicas" :key="caracteristica.id" closable @close="removeCaracteristica(caracteristica, $event)" ) 
          a(tag is-link @click="asignarCaracteristica(caracteristica, $event)") {{ caracteristica.nombre_caracteristica }}
      b-button(type='is-primary' @click="getFilteredPets" icon-left="search" style="margin-top: 10px") Buscar
    .pet-list
      custom-title(title="Nuestras mascotas en adopción")
      .lista-animales
        .columns
          //- .column(v-for="mascota in petList" :key="mascota.id")
          b-table.column(empty striped narrowed hoverable mobile-cards :data='petList', :paginated='isPaginated', :per-page='perPage', :current-page.sync='currentPage', :pagination-simple='isPaginationSimple', :default-sort-direction='defaultSortDirection', default-sort='id' aria-next-label='Next page', aria-previous-label='Previous page', aria-page-label='Page', aria-current-label='Current page' style="width: 100%")
            template(slot-scope='mascota')
              .card(@click="mascotaClick(mascota.row.mascotas.id)")
                .card-image
                  figure.image.is-4by3
                    img(:src="ruta + mascota.row.mascotas.imagen")
                .card-content
                  .media
                    .media-content
                      p.title.is-4 {{ mascota.row.mascotas.nombre }}
                  .content
                    p(v-if="mascota.row.mascotas.fecha_nacimiento != null") Fecha de nacimiento: {{ moment.unix(mascota.row.mascotas.fecha_nacimiento).format('DD/MM/YYYY') }}
                    p(v-else) Fecha de nacimiento: Desconocida
                    p(v-if="mascota.row.mascotas.genero === 0") Macho 
                      b-icon(pack='fas', :icon="mascota.row.mascotas.genero === 0 ? 'mars' : 'venus'")
                    p(v-else) Hembra
                      b-icon(pack='fas', :icon="mascota.row.mascotas.genero === 0 ? 'mars' : 'venus'")
                    p(v-if="mascota.row.mascotas.id_estado === 3") En Adopción / Acogida
                    p(v-else-if="mascota.row.mascotas.id_estado === 2") En adopción
</template>

<script>
  import Title from '@/components/title'
  import axios from 'axios'
  import VueAxios from 'vue-axios'
  const moment = require('moment')
export default {
  name: 'PetList',
  components: {
    'custom-title': Title
  },
  data() {
    return {
      moment: moment,
      ruta: '../../static/img/',
      petList: [],
      caracteristicas: [],
      scrollPosition: null,
      tagtipe: 'is-primary',
      isPaginated: true,
      isPaginationSimple: true,
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 10,
      filtros: {
        buscador: '',
        tipo: null,
        sexo: null,
        edad: null,
        caracteristicas: []
      }
    };
  },
  mounted() {
    this.fetchData()
  },
  methods: {
    fetchData() {
      this.getFilteredPets()
      this.getCaracteristicas()
    },
    mascotaClick(id) {
      this.$router.push({ path: `pet-profile/${id}`, params: {id: id }})
    },
    getFilteredPets() {
      axios.post('http://localhost:3000/apaz/v1/filteredMascotas', {filtros: this.filtros}).then(response =>{
        this.petList = response.data
      }).catch(error =>{
        console.log(error)
      })
    },
    getCaracteristicas() {
      axios.get('http://localhost:3000/apaz/v1/caracteristicas').then(response => {
        this.caracteristicas = response.data
      })
    },
    asignarCaracteristica(caracteristica, event) {
      this.filtros.caracteristicas.indexOf(caracteristica) === -1 ? this.filtros.caracteristicas.push(caracteristica) : ''
      event.target.parentNode.parentNode.classList.remove('is-primary')
      event.target.parentNode.parentNode.classList.add('is-success')
    },
    removeCaracteristica(caracteristica) {
      this.filtros.caracteristicas = this.filtros.caracteristicas.filter(item => item.id !== caracteristica.id)
      document.getElementById(`eltag${caracteristica.id}`).classList.remove('is-success')
      document.getElementById(`eltag${caracteristica.id}`).classList.add('is-primary')
    }
  }
}
</script>

<style lang="sass">
  .content
    text-align: left !important
    .filter-box
      .normal-filters
        display: flex
        justify-content: space-between
        flex-wrap: wrap
      .caracteristicas-box
        a
          color: white
    .pet-list
      .table tbody
        display: flex
        flex-wrap: wrap
        tr
          margin: 10px
          max-width: 350px
          min-width: 350px
      .columns
        display: flex
        flex-wrap: wrap
        justify-content: center
        .card
          cursor: pointer
          .is-4
            font-weight: bold
            color: #ff3860
          p
            font-weight: 600
        .card:hover
          -webkit-animation: shadow-drop-2-center 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) both
          animation: shadow-drop-2-center 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94) both
      ul.pagination-list
        list-style-type: none
      .content
        p
          font-size: medium

    @-webkit-keyframes shadow-drop-2-center
      0%
        -webkit-transform: translateZ(0)
        transform: translateZ(0)
        box-shadow: 0 0 0 0 rgba(0, 0, 0, 0)

      100%
        -webkit-transform: translateZ(50px)
        transform: translateZ(50px)
        box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35)


    @keyframes shadow-drop-2-center
      0%
        -webkit-transform: translateZ(0)
        transform: translateZ(0)
        box-shadow: 0 0 0 0 rgba(0, 0, 0, 0)

      100%
        -webkit-transform: translateZ(50px)
        transform: translateZ(50px)
        box-shadow: 0 0 20px 0px rgba(0, 0, 0, 0.35)
</style>
