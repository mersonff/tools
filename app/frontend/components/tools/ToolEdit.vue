<template lang="">
  <div class="container">
    <div class="columns is-centered">
      <div class="column is-three-quarters">
        <form ref="form" @submit.prevent="update" accept-charset="UTF-8">
          <ToolsForm :data="store" />

          <div class="field is-grouped buttons">
            <div class="is-one-quarter"></div>
            <div class="control">
              <input type="submit" value="Salvar" class="button is-link"/>      
            </div>
            <div class="control">
              <router-link :to="{ name: 'tools_path' }" class="button is-link is-light">Cancelar</router-link>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
  import { ToolStore } from '@/stores/tool_store.js'
  import ToolsForm from './_form.vue'

  export default {
    components: {
      ToolsForm
    },

    setup() {
      const store = ToolStore();

      return { store }
    },

    mounted() {
      this.$api.call(this.store.edit(this.$route.params.id));
    },

    methods: {
      update(form) {
        this.$api.call(this.store.update(this.$route.params.id), form.target);
      }
    },
  }
</script>
<style>
  .buttons {
    margin-top: 2rem;
  }
</style>