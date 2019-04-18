<template>
<div class="container">
  <h1>Home</h1>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
  <p>asdsad</p>
</div>
</template>

<script>
export default {
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
};
</script>

<style lang="sass" scoped>
  .container
    background: rgb(0,123,94)
</style>

