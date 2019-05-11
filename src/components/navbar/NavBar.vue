<script>
import ModalUsuarioVue from '@/components/modals/usuario/registro'
import ModalLogin from '@/components/modals/usuario/login'
export default {
  name: 'NavBar',
  data() {
    return {
      scrollPosition: null,
      userLoged: {
        id_tipo_usuario: 2,
        loged: false
      }
    };
  },
  mounted() {
    if(localStorage.getItem('logedUser')) {
      this.userLoged.loged = true
      this.userLoged = JSON.parse(localStorage.getItem('logedUser'))
    }
    window.addEventListener('scroll', this.updateScroll);
  },
  methods: {
    updateScroll() {
      this.scrollPosition = window.scrollY
    },
    toggleNav() {
          var nav = document.getElementById("nav-menu");
          var className = nav.getAttribute("class");
          if(className == "nav-right nav-menu") {
              nav.className = "is-active";
          } else {
              nav.className = "";
          }
    },
    userModal() {
      this.$modal.open({
        parent: this,
        component: ModalUsuarioVue,
        hasModalCard: true,
      })
    },
    loginModal() {
      this.$modal.open({
        parent: this,
        component: ModalLogin,
        hasModalCard: true,
      })
    },
    logout(){
      localStorage.removeItem('logedUser')
      this.$router.go()
    }
  }
}
</script>

<template lang="pug">
  header
    nav.navbar(role='navigation', aria-label='main navigation')
      .navbar-brand
        router-link.navbar-item.logo(to="home")
        a.navbar-burger.burger(role='button', aria-label='menu', aria-expanded='false', data-target='nav-menu' @click="toggleNav")
          span(aria-hidden='true')
          span(aria-hidden='true')
          span(aria-hidden='true')
      #nav-menu.navbar-menu
        .navbar-start
          router-link.navbar-item(to="home")
            | Inicio
          router-link.navbar-item(to="home")
            | Mascotas en Adopción
          router-link.navbar-item(to="")
            | Ayúdanos
          router-link.navbar-item(to="")
            | Sobre nosotros
          .navbar-item.has-dropdown.is-hoverable(v-if="this.userLoged.id_tipo_usuario === 1")
            a.navbar-link
              | Administración
            .navbar-dropdown
              router-link.navbar-item(to="userManagement")
                | Administrar Usuarios
              router-link.navbar-item(to="petManagment")
                | Administrar Mascotas
              router-link.navbar-item(to="")
                | Administrar Casas de acogida
              router-link.navbar-item(to="")
                | Administrar Adopciones
              hr.navbar-divider
              a.navbar-item
                | Report an issue
        .navbar-end
          .navbar-item
            .buttons
              a.button.is-primary(@click="userModal()")
                strong Ayúdanos 
              a.button.is-link(@click="loginModal()" v-if="this.userLoged.loged == false")
                strong Entrar
              a.button.is-danger(@click="logout()" v-else) 
                strong Salir
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
  .logo
    background: url(logo.png)
    width: 200px
    height: 60px
</style>
