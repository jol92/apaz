import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../views/Home'
import UserManagement from '../views/UserManagement'

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
      path: '/userManagement',
      component: UserManagement
    }
  ]
})

export default router
