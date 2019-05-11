<template lang="pug">
  .special-title-box
    .special-title-section
      b-icon.title-icon(v-if="icon" :icon="icon")
      .title {{title}}
    .slot-section
      slot
</template>

<script>
  export default {
    name: 'Title',
    props: {
      title: {
        type: String
      },
      icon: {
        type: String,
        default: null
      }
    },
    data() {
      return {
      }
    }
  }
</script>

<style lang="sass" scoped>
  .special-title-box
    display: flex
    align-items: center
    justify-content: space-between
    flex-wrap: wrap
    margin: 10px 0px
    padding: 10px 10px 0px 10px
    border-bottom: 2px solid #c78d8a
    width: 100%
    min-width: 300px
    .special-title-section
      flex: 1
      display: flex
      align-items: center
      margin: 5px 0px
      .title-icon
        width: 10px
        height: 10px
        margin-right: 15px
        color: #c78d8a
      .title
        color: #c78d8a
        font-weight: bold
        font-size: 28px

  .half-space.special-title-box
    width: 50%
</style>



