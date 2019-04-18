import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../components/Home'
import Footer from '../components/Footer'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/home',
      component: Home,
      name: Home
    },
    {
      path: '/footer',
      component: Footer,
      name: Footer
    }
  ]
})

export default router
