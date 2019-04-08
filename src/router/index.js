import Vue from 'vue'
import Router from 'vue-router'
import firebase from 'firebase'

// Components
import addDog from '../components/addDog'
import Login from '../components/Login'
import SignUp from '../components/SignUp'
import Home from '../components/Home'

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
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/addDog',
      name: 'addDog',
      component: addDog,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/signUp',
      name: 'SignUp',
      component: SignUp
    }
  ]
})

router.beforeEach((to, from, next) => {
  // to and from are both route objects. must call `next`.
  let currentUser = firebase.auth().currentUser
  let requiresAuth = to.matched.some(record => record.meta.requiresAuth)

  if (requiresAuth && !currentUser) next('login')
  else if (!requiresAuth && currentUser) next('addDog')
  else next()
})

export default router
