import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../components/Home'
import UserManagment from '../components/UserManagment'

Vue.use(Router)

let router = new Router({
  routes: [
    {
      path: '/',
      component: Home
    },
    {
      path: '/home',
      component: Home
    },
    {
      path: '/userManagment',
      component: UserManagment
    }
  ]
})

export default router
