<template lang="pug">
  .container
    h1 Working
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

</style>

