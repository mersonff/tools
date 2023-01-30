<template lang="">
  <div>
    <NavBar/>
    <router-view />
  </div>
</template>
<script>
import NavBar from './NavBar.vue'
export default {
  components: {
    'NavBar': NavBar
  },
}
</script>
<style lang="">
  
</style>