<script>
import ModalUsuarioVue from '../modals/usuario/ModalUsuario.vue';
export default {
  name: 'NavBar',
  data() {
    return {
      scrollPosition: null
    };
  },
  mounted() {
    window.addEventListener('scroll', this.updateScroll);
  },
  methods: {
    updateScroll() {
      this.scrollPosition = window.scrollY
    },
    toggleNav() {
      console.log('toglenav')
      var nav = document.getElementById("nav-menu");
      var className = nav.getAttribute("class");
      if(className == "navbar-burger") {
          nav.className = "is-active";
      } else {
          nav.className = "navbar";
      }
    },
    userModal() {
      this.$modal.open({
        parent: this,
        component: ModalUsuarioVue,
        hasModalCard: true
      })
    }
  }
}
</script>

<template lang="pug">
  header
    nav.navbar(role='navigation', aria-label='main navigation')
      .navbar-brand
        router-link.navbar-item(to="home")
          img(src='https://bulma.io/images/bulma-logo.png', width='112', height='28')
        a.navbar-burger.burger(role='button', aria-label='menu', aria-expanded='false', data-target='nav-menu' @click="toggleNav")
          span(aria-hidden='true')
          span(aria-hidden='true')
          span(aria-hidden='true')
      #nav-menu.navbar-menu
        .navbar-start
          router-link.navbar-item(to="home")
            | Home
          router-link.navbar-item(to="userManagement")
            | User Managmenet
          .navbar-item.has-dropdown.is-hoverable
            a.navbar-link
              | More
            .navbar-dropdown
              a.navbar-item
                | About
              a.navbar-item
                | Jobs
              a.navbar-item
                | Contact
              hr.navbar-divider
              a.navbar-item
                | Report an issue
        .navbar-end
          .navbar-item
            .buttons
              a.button.is-primary(@click="userModal()")
                strong Ayúdanos 
              a.button.is-light
                | Entrar
</template>

<style lang="sass" scoped>
header
  width: 100%
  background: url(header.jpg) no-repeat 50% 40%
  background-position: 25% 25%
  background-size: cover
  height: 450px
  min-height: 240px

nav
  position: fixed
  width: 100%
</style>
