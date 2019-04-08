// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// Firebase
import VueFire from 'vuefire'
import firebase from 'firebase/app'
import 'firebase/firestore'

// Bootstrap
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(VueFire)
Vue.use(BootstrapVue)

firebase.initializeApp({
  apiKey: 'AIzaSyBFjl33tHIl7pzQxilTasZ-47rhcGetVKM',
  authDomain: 'apaz-2f9df.firebaseapp.com',
  databaseURL: 'https://apaz-2f9df.firebaseio.com',
  projectId: 'apaz-2f9df',
  storageBucket: 'apaz-2f9df.appspot.com',
  messagingSenderId: '45759090403'
})

export const db = firebase.firestore()

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
