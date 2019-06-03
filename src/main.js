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

// Vee Validator
import VeeValidate, { Validator } from 'vee-validate'
import es from 'vee-validate/dist/locale/es'

// Vue Editor
import { VueEditor } from 'vue2-editor'

// FontAwesome
import { library } from '@fortawesome/fontawesome-svg-core'
import {
  faCheck,
  faTrash,
  faInfoCircle,
  faExclamationTriangle,
  faArrowUp,
  faAngleRight,
  faAngleDown,
  faAngleLeft,
  faEye,
  faCaretDown,
  faCaretUp,
  faUserEdit,
  faExclamationCircle,
  faCalendarDay,
  faMars,
  faVenus,
  faPaw,
  faEdit,
  faUpload,
  faHeart,
  faVenusMars,
  faBirthdayCake,
  faBone,
  faDog,
  faCat
} from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

// FA Icons Library
library.add(
  faCheck,
  faTrash,
  faInfoCircle,
  faExclamationTriangle,
  faArrowUp,
  faAngleRight,
  faAngleDown,
  faAngleLeft,
  faEye,
  faCaretDown,
  faCaretUp,
  faUserEdit,
  faExclamationCircle,
  faCalendarDay,
  faMars,
  faVenus,
  faPaw,
  faEdit,
  faUpload,
  faHeart,
  faVenusMars,
  faBirthdayCake,
  faBone,
  faDog,
  faCat
)
Vue.component('vue-fontawesome', FontAwesomeIcon)

Vue.use(VueEditor)
Vue.use(VueAxios, axios)
Vue.use(Buefy, {
  defaultIconPack: 'fa',
  defaultIconComponent: 'vue-fontawesome'
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
