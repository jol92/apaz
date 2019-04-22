<script>
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
    }
  }
}
</script>

<template lang="pug">
  header
    nav(:class="{black: scrollPosition > 100}")
      .logo
        router-link(to="home") APAZ
      .menu
        ul
          li
            router-link(to="home") Home
          li
            router-link(to="userManagement") User Management
</template>

<style lang="sass" scoped>
header
  width: 100%
  height: 100vh
  background: url(header.jpg) no-repeat 40% 40%
  background-size: cover
  max-height: 500px
  min-height: 300px
  a
    text-decoration: none
    color: #fff

nav
  position: fixed
  width: 100%
  line-height: 60px
  ul
    line-height: 60px
    list-style: none
    background: rgba(0, 0, 0, 0)
    overflow: hidden
    padding: 0
    text-align: right
    margin: 0
    padding-right: 40px
    transition: 1s
  &.black ul
    background: rgba(0,123,94, 0.90)
  ul li
    display: inline-block
    padding: 16px 40px
    a
      color: #fff
      font-size: 16px

.logo
  line-height: 60px
  position: fixed
  float: left
  margin: 16px 46px
  color: #fff
  font-weight: bold
  font-size: 24px
  letter-spacing: 2px
</style>
