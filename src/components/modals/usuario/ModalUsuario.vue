<template lang="pug">
  form(action='')
    .modal-card(style='width: auto')
      header.modal-card-head
        p.modal-card-title Register
      section.modal-card-body
        b-field(label='Email')
          b-input(type='email', :value='email', placeholder='Your email', required='')
        b-field(label='Password')
          b-input(type='password', :value='password', password-reveal='', placeholder='Your password', required='')
        b-checkbox Remember me
      footer.modal-card-foot
        button.button(type='button', @click='$parent.close()') Close
        button.button.is-primary Login
</template>

<script>
export default {
  name: 'ModalUsuario',
  data() {
    return {
      isComponentModalActive: false,
      formProps: {
        email: 'evan@you.com',
        password: 'testing'
      }
    }
  }
}
</script>