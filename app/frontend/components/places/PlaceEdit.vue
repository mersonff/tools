<template lang="">
  <div class="container">
    <form ref="form" @submit.prevent="update" accept-charset="UTF-8">
      <PlacesForm :data="store" />
    </form>
  </div>
</template>
<script>
  import { PlaceStore } from '@/stores/place_store.js'
  import PlacesForm from './_form.vue'

  export default {
    components: {
      PlacesForm
    },

    setup() {
      const store = PlaceStore();

      return { store }
    },

    mounted() {
      this.$api.call(this.store.edit(this.$route.params.id));
    }
  }
</script>
<style>
  
</style>