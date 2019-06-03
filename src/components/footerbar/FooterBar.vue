<script>
export default {
  name: 'FooterBar',
}
</script>

<template lang="pug">
footer.footer
  .content
    p Inicio
    p Políticas de privacidad
    p Términos y condiciones
    p Panel de administración
    p Reportar error
  .content
    .imagen-logo  
      img(src="'../../static/img/logo.png")
</template>

<style lang="sass" scoped>
  .footer
    display: flex
    padding-top: 10px
    padding-bottom: 20px
    background-color: #c78d8a
    color: blue
    .content
      text-align: center
      flex: 1
      .imagen-logo
        width: 20%
</style>
