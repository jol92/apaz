<script>
import ModalUsuarioVue from '@/components/modals/usuario/registro'
import ModalLogin from '@/components/modals/usuario/login'
import Title from '@/components/title'
export default {
  name: 'NavBar',
  components: {
    'custom-title': Title
  },
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
    },
    handleEdit(user) {
      this.$modal.open({
        parent: this,
        component: ModalUsuarioVue,
        hasModalCard: true,
        props: { user_edit: user }
      })
    },
  }
}
</script>

<template lang="pug">
  .header
    nav.navbar(role='navigation', aria-label='main navigation')
      .navbar-brand
        router-link.navbar-item.logo(to="/home")
        a.navbar-burger.burger(role='button', aria-label='menu', aria-expanded='false', data-target='nav-menu' @click="toggleNav")
          span(aria-hidden='true')
          span(aria-hidden='true')
          span(aria-hidden='true')
      #nav-menu.navbar-menu
        .navbar-start
          router-link.navbar-item(to="/pet-list")
            strong Nuestras mascotas
          router-link.navbar-item(to="help")
            strong Ayúdanos
          router-link.navbar-item(to="/about-us")
            strong Sobre nosotros
          .navbar-item.has-dropdown.is-hoverable(v-if="this.userLoged.id_tipo_usuario === 1")
            a.navbar-link
              strong Administración
            .navbar-dropdown
              router-link.navbar-item(to="/user-management")
                | Administrar Usuarios
              router-link.navbar-item(to="/pet-management")
                | Administrar Mascotas
              router-link.navbar-item(to="/reception-management")
                | Administrar Casas de acogida
              router-link.navbar-item(to="/adoption-management")
                | Administrar Adopciones
              hr.navbar-divider
              a.navbar-item
                | Report an issue
        .navbar-end
          .navbar-item
            .buttons
              a.button.is-primary(@click="userModal()" v-if="this.userLoged.loged === false")
                strong Regístrate 
              b-button(v-else @click="handleEdit(userLoged)" :icon-left="this.userLoged.id_tipo_usuario === 1 ? 'user-shield' : 'user'") 
                strong Hola, {{ this.userLoged.nombre }}
              a.button.is-link(@click="loginModal()" v-if="this.userLoged.loged == false")
                strong Entrar
              a.button.is-danger(@click="logout()" v-else) 
                strong Salir

    section.hero.is-medium.is-primary.has-background
      img.hero-background.is-transparent(src="https://cdn.pixabay.com/photo/2016/01/19/17/41/friends-1149841_960_720.jpg" alt="Fill Murray")
      .hero-body
        .inside
          h1.title ASOCIACIÓN PROTECTORA DE ANIMALES ZEUS
</template>

<style lang="sass" scoped>
  nav
    position: fixed
    width: 100%
  .logo
    background: url(logo.png)
    width: 200px
    height: 60px
  .hero
    &.has-background
      position: relative
      overflow: hidden
    &-background
      position: absolute
      object-fit: cover
      object-position: center center
      width: 100%
      height: 100%
      &.is-transparent
        opacity: 0.6
    .title
      text-align: center
</style>
