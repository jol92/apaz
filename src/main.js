// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// Axios
import axios from 'axios'
import VueAxios from 'vue-axios'

// Buefy
import Buefy from 'buefy'
import 'buefy/dist/buefy.css'

// FontAwesome
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Vee Validator
import VeeValidate, { Validator } from 'vee-validate'
import es from 'vee-validate/dist/locale/es'
Vue.component('font-awesome-icon', FontAwesomeIcon)

Vue.use(VueAxios, axios)
Vue.use(Buefy, {
  defaultIconPack: 'fa'
})

Vue.use(VeeValidate, {
  events: ''
})

Validator.localize('es', es)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
