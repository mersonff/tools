<template lang="">
  <div class="container">
    <div class="columns">
      <div class="column is-one-fifths is-offset-9">
        <router-link :to="{name: 'new_place_path'}"  class="button is-primary">Novo Local</router-link> 
      </div> 
    </div>

    <filters :places="store.places" />
    
    <div class="columns is-centered" ref="listing">
      <div class="column is-three-quarters">
        <table class="table">
          <thead>
            <tr>
              <th><abbr title="ID">#ID</abbr></th>
              <th class="name-th"><abbr title="Nome">Nome</abbr></th>
              <th colspan="2" class="has-text-centered">Ações</th>
            </tr>
          </thead>
      
          <tbody>
            <tr v-for="place in store.places" :key="place.id">
              <td><router-link :to="{ name: 'place_path', params: { id: place.id } }" class="link">{{place.id}}</router-link></td>
              <td>{{place.name}}</td>
              <td>
                <router-link :to="{ name: 'edit_place_path', params: { id: place.id } }" class="button is-primary is-small">Editar</router-link>
              </td>
              <td>
                <a @click="deletePlace(place.id)" class="button is-danger is-small">Excluir</a>
              </td>
            </tr>
          </tbody>
        </table>
      </div>  
    </div>
    <pagination v-if="store.pagination" :store="store" @clicked="index"></pagination>
  </div>
</template>
<script>
import { PlaceStore } from "@/admin/stores/place_store";
import Filters from '@/admin/components/Filters.vue';

import axios from 'axios';

export default {
  components: {
    Filters
  },

  setup() {
    const store = PlaceStore();

    return { store }
  },

  mounted() {
    this.index();
  },

  methods: {

    index() {
      this.$api.call(this.store.index(this.$route.fullPath), this.$refs.listing);
    },

    async deletePlace(id) {
      if (confirm('Tenha certeza que deseja apagar esse local?')) {
        try {
          await axios.delete(`/api/places/${id}`);
          await this.index();
        } catch (error) {
          console.error(error);
        }
      }
    },
  },
}
</script>
<style>
  .table {
    margin-top: 2rem;
  }

  .name-th {
    width: 80%;
  }
</style>