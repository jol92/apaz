import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../views/Home'
import UserManagement from '../views/UserManagement'
import PetManagment from '../views/PetManagment'
import PetAdd from '../views/PetAdd'

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
    },
    {
      path: '/petManagment',
      component: PetManagment
    },
    {
      path: '/petAdd',
      component: PetAdd
    }
  ]
})

export default router
