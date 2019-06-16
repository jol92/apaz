<template lang="pug">
  .container
    custom-title(title="Colabora con APAZ.")
    .donaciones
      custom-title(subtitle title="Donaciones")
      p 1.- Ingreso en cuenta bancaria.
      p Si quieres colaborar económicamente y no puedes comprometerte mensualmente puedes ingresar un donativo en una de las siguientes cuentas:
      p "La Caixa" nº de cuenta: 2100 4812 91 2200011235 (IBAN ES02 2100 4812 9122 0001 1235, SWIFT CAIXESBBXXX)
      p "La Caixa" nº de cuenta: 2100-2329-65-0200064470 (IBAN ES77 2100 2329 6502 0006 4470, SWIS CAIXESBBXXX) 
      p "La Caixa" nº de cuenta: 2100-7789-37-2200046502 (IBAN ES46 2100 7789 3722 0004 6502, SWIS CAIXESBBXXX)
      p 2.- A través de Paypal con nuestro correo electrónico: informatica@arcadenoe.org haciendo clic en la imagen:
    .teaming
      custom-title(subtitle title="Teaming")
      p texto teaming
    .acogida
      custom-title(subtitle title="Teaming")
      p texto teaming
    .adopcion
      custom-title(subtitle title="Teaming")
      p texto teaming
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

</style>
