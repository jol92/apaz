<script>
export default {
  name: 'FooterBar',
}
</script>

<template lang="pug">
footer.footer
  .first-row
    .contacto
      .title Contáctanos
      .title2(style="font-weight: bold") Teléfonos
      .info 664881231
      .info 663129012
      .title2(style="font-weight: bold") E-mail
      .info protectora.zeus@gmail.com
    .ubicacion
      .title Ubiccación
      .info Calle AV El escorial nº 12 14010 Córdoba
    .logo
      .imagen-logo  
        img(src="'../../static/img/logo.png")
  .second-row
    .copy Copyright &copy; 2019 Asociación Protectora Animales Zeus. Todos los derechos reservados. Creado por 
      a(style="color: #c78d8a") jorgeojedalopez92@gmail.com
    .ies(style="font-weight: bold") IES Trassierra
</template>

<style lang="sass" scoped>
  .footer
    padding-bottom: 40px
    .first-row
      display: flex
      flex-wrap: wrap
      justify-content: space-around
      .logo
        flex: 1
        max-width: 200px
      .contacto
        flex: 1
        max-width: 200px
      .ubicacion
        flex: 1
        max-width: 400px
      .title
        color: #c78d8a
    .second-row
      text-align: center
</style>
