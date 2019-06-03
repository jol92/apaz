import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../views/Home'
import UserManagement from '../views/managment/UserManagement'
import PetManagment from '../views/managment/PetManagment'
import PetAdd from '../views/managment/PetAdd'
import AdoptionManagment from '../views/Managment/AdoptionManagment'
import PetProfile from '../views/PetProfile'

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
      path: '/user-management',
      component: UserManagement
    },
    {
      path: '/pet-management',
      component: PetManagment
    },
    {
      path: '/pet-add',
      component: PetAdd,
      hidden: true
    },
    {
      path: '/adoption-management',
      component: AdoptionManagment,
      props: { accion: 'Adopcion' }
    },
    {
      path: '/reception-management',
      component: AdoptionManagment,
      props: { accion: 'Acogida' }
    },
    {
      path: '/pet-profile/:id',
      component: PetProfile
    }
  ]
})

export default router
