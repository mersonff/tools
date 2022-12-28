<template lang="">
  <div class="container">
    <div class="columns is-centered">
      <div class="column is-three-quarters">
        <form ref="form" @submit.prevent="create" accept-charset="UTF-8">
          <PlacesForm :data="store" />

          <div class="field is-grouped buttons">
            <div class="is-one-quarter"></div>
            <div class="control">
              <input type="submit" value="Salvar" class="button is-link"/>      
            </div>
            <div class="control">
              <router-link :to="{ name: 'places_path' }" class="button is-link is-light">Cancelar</router-link>
            </div>
          </div>
        </form>
      </div>
    </div>
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
      this.$api.call(this.store.new());
    },

    methods: {
      create() {
        this.$api.call(this.store.create()).then(response => {
          if(response === true) {
            this.$router.push({name: 'edit_place_path', params: {id: this.store.place.id}})
          }
        })
      }
    },
  }
</script>
<style>
  .buttons {
    margin-top: 2rem;
  }
</style>