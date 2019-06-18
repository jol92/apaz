<template lang="pug">
  .container
    .first-content
      custom-title(title="Cientos de animales abandonados y/o maltratados necesitan de tu colaboración, únete a nuestra causa.")
      .columns
        .column
          section
            b-collapse.card(:open="false" aria-id='contentIdForA11y3')
              .card-header(slot='trigger', slot-scope='props', role='button', aria-controls='contentIdForA11y3')
                p.card-header-title
                  | Haz un donativo
                a.card-header-icon
                  b-icon(:icon="props.open ? 'caret-down' : 'caret-up'")
              .card-content
                .content
                  b ¡Ayúdanos económicamente haciendo un donativo o haciendo teaming con nosotros!
                  p Podrás ayudar a cientos de animales con sólo un poco de tiempo y dinero blablabla, así podrás lalala lo que sea ya tu sabes xd
              footer.card-footer
                a.card-footer-item(href="https://www.paypal.es" target="_blank") Donar
                a.card-footer-item(href="https://www.teaming.net/apaz?lang=es_ES" target="_blank") Teaming
        .column
          section
            b-collapse.card(:open="false" aria-id='contentIdForA11y3')
              .card-header(slot='trigger', slot-scope='props', role='button', aria-controls='contentIdForA11y3')
                p.card-header-title
                  | Adopta
                a.card-header-icon
                  b-icon(:icon="props.open ? 'caret-down' : 'caret-up'")
              .card-content
                .content
                  b ¿Quieres adoptar a tu nuevo mejor amigo?
                  p Adoptando a uno de nuestros animales le estarás dando una segunda oportunidad a blablablalba
              footer.card-footer
              router-link(tag="a" to="/pet-list").card-footer-item Ver mascotas en adopción
        .column
          section
            b-collapse.card(:open="false" aria-id='contentIdForA11y3')
              .card-header(slot='trigger', slot-scope='props', role='button', aria-controls='contentIdForA11y3')
                p.card-header-title
                  | Hazte voluntario
                a.card-header-icon
                  b-icon(:icon="props.open ? 'caret-down' : 'caret-up'")
              .card-content
                .content
                  b ¡Ayúdanos a mantener APAZ operativo!
                  p Siendo voluntario podrás ayudar a que la organización sea más efectiva.
                  p Para ser voluntario contáctanos contándonos por qué quieres ser voluntario
              footer.card-footer
                a.card-footer-item(href='mailto:protectora.zeus@gmail.com') Contáctanos
    .second-content
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
    name: 'Home',
    components: {
      'custom-title': Title
    },
    data() {
      return {
        moment: moment,
        ruta: '../../static/img/',
        petList: [],
        scrollPosition: null,
        isPaginated: true,
        isPaginationSimple: true,
        defaultSortDirection: 'asc',
        currentPage: 1,
        perPage: 10,
      };
    },
    mounted() {
      this.fetchData()
      window.addEventListener('scroll', this.updateScroll);
    },
    methods: {
      fetchData() {
        this.getAllPets()
      },
      mascotaClick(id) {
        this.$router.push({ path: `pet-profile/${id}`, params: {id: id }})
      },
      getAllPets() {
        axios.get('http://localhost:3000/apaz/v1/mascotasNoAdoptadas').then(response =>{
          this.petList = response.data
        }).catch(error =>{
          console.log(error)
        })
      },
      updateScroll() {
        this.scrollPosition = window.scrollY
      }
    }
  }
</script>

<style lang="sass">
  .content
    text-align: left !important
    .second-content
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

