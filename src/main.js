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
  faUser,
  faUserShield,
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
  faCat,
  faDonate,
  faHome,
  faEyeSlash,
  faSearch
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
  faEyeSlash,
  faCaretDown,
  faCaretUp,
  faUserEdit,
  faUser,
  faUserShield,
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
  faCat,
  faDonate,
  faHome,
  faSearch
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

router.beforeEach(async function (to, from, next) {
  let loggedUser = {}
  JSON.parse(localStorage.getItem('logedUser')) != null ? loggedUser = JSON.parse(localStorage.getItem('logedUser')) : loggedUser = {id_tipo_usuario: 2}
  if (
    to.path !== '/home' &&
    to.path !== '/pet-list' &&
    to.path !== '/help' &&
    to.path !== '/about-us' &&
    to.path !== '/pet-profile/' + 75 &&
    to.path !== '/pet-profile/' + 76 &&
    to.path !== '/pet-profile/' + 77 &&
    to.path !== '/pet-profile/' + 78 &&
    to.path !== '/pet-profile/' + 79 &&
    to.path !== '/pet-profile/' + 80 &&
    to.path !== '/pet-profile/' + 81 &&
    to.path !== '/pet-profile/' + 82 &&
    to.path !== '/pet-profile/' + 83 &&
    to.path !== '/pet-profile/' + 84 &&
    to.path !== '/pet-profile/' + 85 &&
    to.path !== '/pet-profile/' + 86 &&
    to.path !== '/pet-profile/' + 87 &&
    to.path !== '/pet-profile/' + 88 &&
    to.path !== '/pet-profile/' + 89 &&
    to.path !== '/pet-profile/' + 90 &&
    to.path !== '/pet-profile/' + 91 &&
    to.path !== '/pet-profile/' + 92 &&
    to.path !== '/pet-profile/' + 93 &&
    to.path !== '/pet-profile/' + 94 &&
    to.path !== '/pet-profile/' + 95 &&
    to.path !== '/pet-profile/' + 96 &&
    to.path !== '/pet-profile/' + 97 &&
    to.path !== '/pet-profile/' + 98 &&
    to.path !== '/pet-profile/' + 99 &&
    to.path !== '/pet-profile/' + 100 &&
    to.path !== '/pet-profile/' + 101 &&
    to.path !== '/pet-profile/' + 102 &&
    to.path !== '/pet-profile/' + 103 &&
    to.path !== '/pet-profile/' + 104 &&
    to.path !== '/pet-profile/' + 105 &&

    loggedUser.id_tipo_usuario !== 1
  ) {
    next({ path: 'home' })
  } else {
    next()
  }
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
