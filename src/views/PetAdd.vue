<template lang="pug">
  .container-fluid
    custom-title(:title="action + ' Mascota'" icon="paw")
</template>

<script>
import axios from 'axios'
import VueAxios from 'vue-axios'
const moment = require('moment')
import Title from '@/components/title'

export default {
  name: 'PetAdd',
  components: {
    'custom-title': Title
  },
  data() {
    return {
      action: 'Añadir'
    }
  },
}
</script>

<style lang="sass" scoped>

</style>
