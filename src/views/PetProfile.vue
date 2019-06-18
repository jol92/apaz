<template lang="pug">
  .container-fluid
    custom-title(:title="'Conoce a ' + mascota.nombre")
    .pet-layout
      .nada-side
      .img-side
        img.imagen(:src="ruta + mascota.imagen")
      .nada-side
      .info-side
        custom-title(title="Información" subtitle)
        .info
          b-icon(pack="fas", icon='heart')
          .titulo Nombre:
          .value {{ mascota.nombre }}
        .info
          b-icon(pack="fas", icon='venus-mars')
          .titulo Sexo:
          .value(v-if="mascota.genero === 0") Macho
          .value(v-else) Hembra
        .info
          b-icon(pack="fas", icon='birthday-cake')
          .titulo Edad:
          .value(v-if="mascota.fecha_nacimiento != null") {{ moment.unix(mascota.fecha_nacimiento).toNow(true) }}
          .value(v-else) Desconocida
        .info
          b-icon(pack="fas", icon='bone')
          .titulo Raza:
          .value(v-if="mascota.raza != ''") {{ mascota.raza }}
          .value(v-else) Desconocida
        .info
          b-icon(pack='fas', :icon="mascota.tipo === 'Perro' ? 'dog' : mascota.tipo === 'Gato' ? 'cat' : 'paw'")
          .titulo Tipo:
          .value {{ mascota.tipo }}
        .info
          b-taglist
            b-tag(type="is-info" v-for="caracteristica in mascota.caracteristicas" :key="caracteristica.id") {{ caracteristica }}
      .nada-side
    .descripcion
      custom-title(title="Descripción")
      div(v-html="mascota.descripcion")
    .interest
      custom-title(:title="`¿Quieres ayudar a ${mascota.nombre}?`")
      section
        b-tabs(type='is-boxed' size="is-medium")
          b-tab-item(label='Donar', icon='donate')
            .info-box
              p.strong Únete a nuestro teaming:
              a(href='https://www.teaming.net/apaz?lang=es_ES' target="_blank")
                img(src="https://djg5cfn4h6wcu.cloudfront.net/resources/images/coLogos/teaming-alpha.png")
            .info-box
              p.strong Si quieres colaborar económicamente y no puedes comprometerte mensualmente puedes ayudarnos haciendo un donativo.
              ul
                li A través de 
                  a Paypal
                  |  haciendo click en el enlace o imagen:
                .imagen
                  img(src="https://www.nocreasnada.com/wp-content/uploads/2016/10/Boton-donar-paypal-300x166-.png" width="150")
                li A través de la siguiente cuenta bancaria:
                p.strong CAIXABANK	ES6621000418401234567891	1210	0418	40	1234567891
          b-tab-item(label='Acoger', icon='home')
            .info-box
              b-message(title='¿Estás interesado/a en acoger?', type='is-info', has-icon='', aria-close-label='Close message') Ten en cuenta los animales precisan de unas necesidades mínimas: alimentación, dedicación, veterinario... Si crees que no puedes dárselo por falta de tiempo o recursos, por favor, no contactes.
              custom-title(subtitle title="Ser casa de acogida de un animal es una opción muy necesaria e importante para poder salvarlos.")
              p.strong ¿Que tienes que hacer como casa de acogida y que necesitas?
              ol
                li Dar amor y cariño a un animal que te necesita.
                li Ayudarlo en el tiempo de su recuperación para que recobre su confianza en los humanos.
                li Rehabiltar, medicar en su caso o simplemente jugar con él.
                li Llevarlo a revisiones veterinarias, en caso necesario (Corren a cargo de la asociación, salvo que quieras apadrinarlo)
                li Tener paciencia y ganas de ayudar a un ser que te necesita.
              p.strong Ventajas para el perro que está en acogida:
              ol
                li Se siente seguro bajo un techo y con una familia
                li Su recuperación es mas rápida y placentera.
                li Aprende a perder sus miedos a los humanos.
                li Está a salvo, alimentado, cuidado y recibiendo el cariño que necesita.
                li Salva su vida gracias a tu ayuda.
              p.strong Ventajas para tí:
              ol
                li Disfrutas de su compañía como la de un amigo.
                li Te sientes útil ayudando a un animal que te necesita.
                li Te ayuda a tomar la decisión de adoptar a un perro si aún no tienes, porque cuentas con la ayuda y el asesoramiento de la asociación, si tienes dudas que puedes resolver durante ese tiempo
                li Satisfacción por salvar una vida.
            .button-box
              b-tooltip(label="Por favor, tenga en cuenta que pulsando este botón nos pondremos en contacto con usted para tramitar una posible acogida", position='is-bottom', size='is-large', multilined='')
                b-button.icon-button(type='is-info', icon-left='home', size="is-medium" @click="handleAcoger") Quiero acoger a {{ mascota.nombre }}
          b-tab-item(label='Adoptar', icon='heart')
            .info-box
              b-message(title='¿Estás interesado/a en adoptar?', type='is-info', has-icon='', aria-close-label='Close message') Ten en cuenta los animales precisan de unas necesidades mínimas: alimentación, dedicación, veterinario... Si crees que no puedes dárselo por falta de tiempo o recursos, por favor, no contactes.
              custom-title(subtitle title="Adoptando a una mascota le estarás dando una segunda oportunidad a un ser vivo.")
              p.strong Por favor, antes de adoptar piensa. Reflexiona seriamente sobre:
              ul.lista
                li Obligaciones: 
                  p Tener una mascota significa tener un SER VIVO en casa, que tiene una serie de necesidades las cuales no podrá satisfacer por sí mismo y que, por tanto, requiere que tú asumas esa responsabilidad. Infórmate de las necesidades que tiene un perro o un gato y de las obligaciones que conlleva tenerle contigo, y plantéate seriamente si serás capaz de asumir esa responsabilidad.
                li Molestias: 
                  p Además de las obligaciones que supone tener una mascota, puede ocasionar en casa algunas "molestias", como soltar pelo, ruidos...,etc. Infórmate de las molestias que puede ocasionar un perro o un gato y piensa si estarías dispuesto a convivir los próximos 10-15 años con esas molestias en casa.
                li Problemas de Conducta: 
                  p A veces, los perros o los gatos desarrollan una serie de problemas de comportamiento que pueden llegar a hacerse insoportables para los humanos (como llorar cuando están solos o sienten miedo, ladrar a todas horas, estrés, etc). Estos problemas tienen un origen y tienen solución. Infórmate del tema antes y piensa qué harías si tu perro o gato desarrollase algún problema de conducta. Asimismo, debes informarte antes de cómo se educa a una mascota y pensar si serás capaz de hacerlo tú.
                li Hogar y familia:  
                  p Infórmate de si tu vivienda es la adecuada para tener un animal de las características del que estás buscando (tamaño grande o pequeño, carácter activo o tranquilo, etc.). Asimismo, preocúpate de ver si están todos de acuerdo en casa con la llegada de un nuevo miembro a la familia y de si tendrás algún problema con ellos a la hora de integrar a ese animal en casa. Piensa en el caracter de las personas que conviven contigo y piensa cómo sería la convivencia de esas personas conla mascota que adoptes.
                li Circunstancias personales: 
                  p Piensa si tus circunstancias personales (trabajo, pareja, ...) pueden cambiar a lo largo de los próximos 10-15 años y si pudieras tener problemas para seguir teniendo al animal contigo. Como, por ejemplo, un cambio en el horario de trabajo que impida que puedas seguir atendiendo a tu mascota, una nueva pareja que no quiera convivir con el animal, mudarte a otro país ...etc.
                li Vacaciones: 
                  p Piensa qué harás en las vacaciones con tu mascota. Piensa si sería un problema para tí el llevarle contigo a tu lugar de vacaciones. Asimismo, si has pensado en dejarle en una residencia para perros o gatos, infórmate de los precios de estas residencias o canguros para mascotas en tu ciudad y de la antelación con la que debes reservar una plaza para tu mascota (puede que, cuando lo intentes, ya no haya sitio para él).
                li Razas: 
                  p Si quieres un perro o gato de una determinada raza, infórmate del caracter y características de los animales de esa raza. Encontrarás información en libros, revistas, páginas de Internet dedicadas a ellas, ... Además, te aconsejamos que te informes de las características y ventajas de los perros mestizos que son muchas.
                li Cachorro/Adulto: 
                  p Tanto un cachorro como un perro o gato adulto tienen una serie de necesidades y conllevan una serie de obligaciones, pero no son las mismas. Ambos tienen una serie de ventajas y una serie de inconvenientes. Infórmate antes de lo que supone adoptar a un cachorro y de lo que sería adoptar a un animal adulto.


              
            .button-box
              b-tooltip(label="Por favor, tenga en cuenta que pulsando este botón nos pondremos en contacto con usted para tramitar una posible adopción", position='is-bottom', size='is-large', multilined='')
                b-button.icon-button(type='is-info', icon-left='heart', size="is-medium" @click="handleAdoptar") Quiero adoptar a {{ mascota.nombre }}
</template>

<script>
  import ModalLogin from "@/components/modals/usuario/login"
  import axios from 'axios'
  import VueAxios from 'vue-axios'
  import Title from '@/components/title'
  const moment = require('moment')
  import 'moment/locale/es'
  
  export default {
    name: 'PetProfile',
    components: {
      'custom-title': Title
    },
    created() {
      this.id = this.$route.params.id
    },
    mounted() {
      this.fetchData()
    },
    data() {
      return {
        moment: moment,
        ruta: '../../static/img/',
        id: null,
        mascota: {
          id: null,
          nombre: null,
          tipo: null,
          genero: null,
          imagen: null,
          raza: null,
          caracteristicas: [],
          fecha_nacimiento: null,
          descripcion: null
        },
        usuario: null
      }
    },
    methods: {
      fetchData() {
        this.getMascota()
        this.getCaracteristicaMascota()
        this.usuario = JSON.parse(localStorage.getItem('logedUser'))
      },
      getMascota() {
        axios.get(`http://localhost:3000/apaz/v1/mascotas/${this.id}`).then(response =>{
          this.mascota.id = response.data[0].mascotas.id
          this.mascota.nombre = response.data[0].mascotas.nombre
          this.mascota.tipo = response.data[0].tipos_mascota.nombre
          this.mascota.genero = response.data[0].mascotas.genero
          this.mascota.imagen = response.data[0].mascotas.imagen
          this.mascota.raza = response.data[0].mascotas.raza
          this.mascota.fecha_nacimiento = response.data[0].mascotas.fecha_nacimiento
          this.mascota.descripcion = response.data[0].mascotas.descripcion
        }).catch(error =>{
          console.log(error)
        })
      },
      getCaracteristicaMascota() {
        axios.get(`http://localhost:3000/apaz/v1/getCaracteristicasMascota/${this.id}`).then(response =>{
          response.data.forEach(caracteristica => {
            this.mascota.caracteristicas.push(caracteristica.caracteristicas.nombre_caracteristica) 
          })
        }).catch(error =>{
          console.log(error)
        })
      },
      handleAdoptar() {
        if(JSON.parse(localStorage.getItem("logedUser")) != null) {
          axios.post('http://localhost:3000/apaz/v1/mailInteresado', {
            usuario: this.usuario,
            mascota: this.mascota,
            accion: 'adoptar'
          })
          this.$snackbar.open({
            message: `Nos pondremos en contacto con usted para tramitar la posible adopción de ${this.mascota.nombre}. ¡Muchas gracias!`,
            type: 'is-warning',
            position: 'is-top',
            actionText: 'Continuar',
            duration: 5000
          })
        } else {
          this.$modal.open({
            parent: this,
            component: ModalLogin,
            hasModalCard: true
          })
        }
      },
      handleAcoger() {
        if(JSON.parse(localStorage.getItem("logedUser")) != null) {
          axios.post('http://localhost:3000/apaz/v1/mailInteresado', {
            usuario: this.usuario,
            mascota: this.mascota,
            accion: 'acoger'
          })
          this.$snackbar.open({
            message: `Nos pondremos en contacto con usted para tramitar la posible acogida de ${this.mascota.nombre}. ¡Muchas gracias!`,
            type: 'is-warning',
            position: 'is-top',
            actionText: 'Continuar',
            duration: 5000
          })
        } else {
          this.$modal.open({
            parent: this,
            component: ModalLogin,
            hasModalCard: true
          })
        }
      }
    }
  }
</script>

<style lang="sass" scoped>
  .lista
    li
      font-weight: 600
      p
        font-weight: normal
  .strong
    font-weight: 600
  .pet-layout
    display: flex
    width: 100%
    border-radius: 40px
    padding-top: 5px
    flex-wrap: wrap
    .img-side
      flex: 3
      min-width: 360px
      img
        border-radius: 10px
    .nada-side
      flex: 1
      max-width: 100px
    .info-side
      flex: 2
      min-width: 210px
      text-align: left
      .icon
        color: #8c8bde
      .info-title
        width: 100%
        font-weight: bolder
        font-size: 28px
        margin-bottom: 20px
  .info
    display: flex
    margin-left: 10px
    margin-top: 20px
    flex-wrap: wrap
    .value
      margin-left: 10px
    .titulo
      font-weight: bold
    .icon
      margin-right: 10px
  .button-box
    margin-top: 50px
    display: flex
    justify-content: space-around
</style>
