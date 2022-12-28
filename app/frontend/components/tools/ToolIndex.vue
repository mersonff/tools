<template lang="">
  <div class="container">
    <div class="columns">
      <div class="column is-one-fifths is-offset-9">
        <router-link :to="{name: 'new_tool_path'}"  class="button is-primary">Nova Ferramenta</router-link> 
      </div> 
    </div>

    <filters :tools="store.tools" />
    
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
            <tr v-for="tool in store.tools" :key="tool.id">
              <td><router-link :to="{ name: 'tool_path', params: { id: tool.id } }" class="link">{{tool.id}}</router-link></td>
              <td>{{tool.name}}</td>
              <td>
                <router-link :to="{ name: 'edit_tool_path', params: { id: tool.id } }" class="button is-primary is-small">Editar</router-link>
              </td>
              <td>
                <a @click="deletetool(tool.id)" class="button is-danger is-small">Excluir</a>
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
import { ToolStore } from "@/stores/tool_store";
import Filters from '@/components/Filters.vue';

import axios from 'axios';

export default {
  components: {
    Filters
  },

  setup() {
    const store = ToolStore();

    return { store }
  },

  mounted() {
    this.index();
  },

  methods: {

    index() {
      this.$api.call(this.store.index(this.$route.fullPath), this.$refs.listing);
    },

    async deletetool(id) {
      if (confirm('Tenha certeza que deseja apagar esse local?')) {
        try {
          await axios.delete(`/tools/${id}`);
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