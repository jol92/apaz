<template lang="pug">
  .container-fluid
    nav-bar
    .content
      router-view
    footer-bar
</template>

<script>
import NavBar from '@/components/navbar'
import FooterBar from '@/components/footerbar'

export default {
  name: 'App',
  components: {
    'footer-bar': FooterBar,
    'nav-bar': NavBar,
  },
}
</script>

<style lang="sass" scoped>
.container-fluid
  padding-right: 0px
  padding-left: 0px

.content
  width: 94%
  margin: 4em auto
  font-size: 20px
  line-height: 30px
  text-align: justify
</style>
