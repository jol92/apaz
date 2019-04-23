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
import { library } from '@fortawesome/fontawesome-svg-core'
import { faCoffee } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// Icons Material
import MenuIcon from 'vue-material-design-icons/Menu.vue'

library.add(faCoffee)
Vue.component('font-awesome-icon', FontAwesomeIcon)
Vue.component('menu-icon', MenuIcon)

Vue.use(VueAxios, axios)
Vue.use(Buefy, {
  defaultIconPack: 'fa'
})

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
