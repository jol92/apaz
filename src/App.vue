<template lang="pug">
  .container-fluid
    header
      nav(:class="{black: scrollPosition > 100}")
        .logo
          router-link(to="/home") APAZ
        .menu
          ul
            li
              router-link(to="/home") Home
            li
              router-link(to="/userManagment") User Managment
    router-view
    section#footer
      .container
        .row.text-center.text-xs-center.text-sm-left.text-md-left
          .col-xs-12.col-sm-4.col-md-4
            h5 Quick links
            ul.list-unstyled.quick-links
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Home
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | About
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | FAQ
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Get Started
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Videos
          .col-xs-12.col-sm-4.col-md-4
            h5 Quick links
            ul.list-unstyled.quick-links
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Home
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | About
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | FAQ
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Get Started
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Videos
          .col-xs-12.col-sm-4.col-md-4
            h5 Quick links
            ul.list-unstyled.quick-links
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Home
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | About
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | FAQ
              li
                a(href='javascript:void();')
                  i.fa.fa-angle-double-right
                  | Get Started
              li
                a(href='https://wwwe.sunlimetech.com', title='Design and developed by')
                  i.fa.fa-angle-double-right
                  | Imprint
        .row
          .col-xs-12.col-sm-12.col-md-12.mt-2.mt-sm-5
            ul.list-unstyled.list-inline.social.text-center
              li.list-inline-item
                a(href='javascript:void();')
                  i.fa.fa-facebook
              li.list-inline-item
                a(href='javascript:void();')
                  i.fa.fa-twitter
              li.list-inline-item
                a(href='javascript:void();')
                  i.fa.fa-instagram
              li.list-inline-item
                a(href='javascript:void();')
                  i.fa.fa-google-plus
              li.list-inline-item
                a(href='javascript:void();', target='_blank')
                  i.fa.fa-envelope
        .row
          .col-xs-12.col-sm-12.col-md-12.mt-2.mt-sm-2.text-center.text-white
            p
              u
                a(href='https://www.nationaltransaction.com/') National Transaction Corporation
              |  is a Registered MSP/ISO of Elavon, Inc. Georgia [a wholly owned subsidiary of U.S. Bancorp, Minneapolis, MN]
            p.h6
              | All right Reversed.
              a.text-green.ml-2(href='https://www.sunlimetech.com', target='_blank') Sunlimetech
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      scrollPosition: null
    };
  },
  mounted() {
    window.addEventListener('scroll', this.updateScroll);
  },
  methods: {
    updateScroll() {
      this.scrollPosition = window.scrollY
    }
  }
}
</script>

<style lang="sass" scoped>
.container-fluid
  padding-right: 0px
  padding-left: 0px
header
  width: 100%
  height: 100vh
  background: url(assets/header.jpg) no-repeat 40% 40%
  background-size: cover
  max-height: 500px
  min-height: 300px
  a
    text-decoration: none
    color: #fff

.content
  width: 94%
  margin: 4em auto
  font-size: 20px
  line-height: 30px
  text-align: justify

.logo
  line-height: 60px
  position: fixed
  float: left
  margin: 16px 46px
  color: #fff
  font-weight: bold
  font-size: 24px
  letter-spacing: 2px

nav
  position: fixed
  width: 100%
  line-height: 60px
  ul
    line-height: 60px
    list-style: none
    background: rgba(0, 0, 0, 0)
    overflow: hidden
    padding: 0
    text-align: right
    margin: 0
    padding-right: 40px
    transition: 1s
  &.black ul
    background: rgba(0,123,94, 0.90)
  ul li
    display: inline-block
    padding: 16px 40px
    a
      color: #fff
      font-size: 16px
section
  padding: 60px 0
  .section-title
    text-align: center
    color: #007b5e
    margin-bottom: 50px
    text-transform: uppercase

#footer
  background: #007b5e !important
  h5
    padding-left: 10px
    border-left: 3px solid #eeeeee
    padding-bottom: 6px
    margin-bottom: 20px
    color: #ffffff
  a
    color: #ffffff
    text-decoration: none !important
    background-color: transparent
    -webkit-text-decoration-skip: objects
  ul
    &.social li
      padding: 3px 0
      a i
        margin-right: 5px
        font-size: 25px
        -webkit-transition: .5s all ease
        -moz-transition: .5s all ease
        transition: .5s all ease
      &:hover a i
        font-size: 30px
        margin-top: -10px
      a
        color: #ffffff
    &.quick-links li a
      color: #ffffff
    &.social li a:hover
      color: #eeeeee
    &.quick-links li
      padding: 3px 0
      -webkit-transition: .5s all ease
      -moz-transition: .5s all ease
      transition: .5s all ease
      &:hover
        padding: 3px 0
        margin-left: 5px
        font-weight: 700
      a i
        margin-right: 5px
      &:hover a i
        font-weight: 700

@media (max-width: 767px)
  #footer h5
    padding-left: 0
    border-left: transparent
    padding-bottom: 0px
    margin-bottom: 10px
</style>
