import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../views/Home'
import UserManagement from '../views/managment/UserManagement'
import PetManagment from '../views/managment/PetManagment'
import PetAdd from '../views/managment/PetAdd'
import AdoptionManagment from '../views/Managment/AdoptionManagment'

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
      component: PetAdd,
      hidden: true
    },
    {
      path: '/adoptionManagment',
      component: AdoptionManagment,
      props: { accion: 'Adopcion' }
    },
    {
      path: '/receptionManagment',
      component: AdoptionManagment,
      props: { accion: 'Acogida' }
    }
  ]
})

export default router
