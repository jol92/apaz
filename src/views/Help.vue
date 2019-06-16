<template lang="pug">
  .container
    custom-title(title="Colabora con APAZ.")
    .donaciones
      custom-title(subtitle title="Donaciones")
      .text
        p.intro Si quieres colaborar económicamente y no puedes comprometerte mensualmente puedes ayudarnos haciendo un donativo.
        ul
          li A través de 
            a Paypal
            |  haciendo click en el enlace o imagen:
          li A través de la siguiente cuenta bancaria: 
    .teaming
      custom-title(subtitle title="Teaming")
      .text
        p.intro También puedes ayudarnos por sólo un euro al mes a través de nuestro 
          a(href='https://www.teaming.net/apaz?lang=es_ES') Teaming.
    .colaborador
      custom-title(subtitle title="Colaborador Permanente")
      .text
        p Hazte Colaborador permanente y ayudarás a que nuestros perros y gatos tengan una mejor calidad de vida, tengan la oportunidad de encontrar una familia y, si no son adoptados, vivan el resto de su vida en las mejores condiciones.
        p En resumen, formarás parte de aquellos que defendemos los derechos de unos seres indefensos ante la crueldad de algunos seres humanos.
        p A partir de 10€ mensuales formarás parte de nuestro colectivo y contribuirás a sufragar los gastos de residencias, veterinario, envíos, ...
        p Para ser Colaborador por favor ponte en
          a(href='mailto:protectora.zeus@gmail.com')  contacto
          |  con nosotros
    .donarutiles
      custom-title(subtitle title="No tires nada, piensa en ellos")
      .text
        p.intro También puedes ayudarnos donando material que en nuestro día a día es indispensable:
        ul
          li Comida (pienso y latas) para perros y gatos, tanto de adultos como de cachorros, comida renal, o para diabéticos, biberones, leche en polvo...
          li Correas, arneses, bozales, collares, ...
          li Juguetes para perros y gatos.
          li Transportines para traer y llevar a los animales.
          li Camas, mantas para abrigarlos, vestidos, ...
          li Material veterinario, desde gasas y jeringuillas hasta antibióticos y vitaminas.
          li Material de limpieza: cepillos, fregonas, cubos, mangueras, guantes, papel industrial, productos de desinfección, etc.
        p Si tienes algo que te sobre y quieres donarlo 
          a(href='mailto:protectora.zeus@gmail.com') contáctanos
          |  o pásate por uno de nuestros puntos de ayuda:
        ul
          li Punto 1
          li Punto 2
    .difunde
      custom-title(subtitle title="Teaming")
      p texto teaming
    .otros
      custom-title(subtitle title="Teaming")
      p texto teaming
</template>

<script>
  import Title from '@/components/title'

export default {
  name: 'Help',
  components: {
    'custom-title': Title
  },
  data() {
      return {

      }
  }
}
</script>

<style lang="sass" scoped>
 .text
  padding: 15px
  font-weight: 400
  .intro
    font-weight: 600 !important
</style>
