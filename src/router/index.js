import Vue from 'vue'
import Router from 'vue-router'

// Components
import Home from '../views/Home'
import UserManagement from '../views/managment/UserManagement'
import PetManagment from '../views/managment/PetManagment'
import PetAdd from '../views/managment/PetAdd'
import AdoptionManagment from '../views/Managment/AdoptionManagment'
import PetProfile from '../views/PetProfile'
import Help from '../views/Help'
import PetList from '../views/PetList'
import AboutUs from '../views/AboutUs'

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
      name: 'petAdd',
      component: PetAdd,
      hidden: true,
      props: true
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
    },
    {
      path: '/help',
      component: Help
    },
    {
      path: '/pet-list',
      component: PetList
    },
    {
      path: '/about-us',
      component: AboutUs
    }
  ]
})

export default router
