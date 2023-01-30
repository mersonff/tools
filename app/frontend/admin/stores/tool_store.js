import { defineStore } from 'pinia'

export const ToolStore = defineStore('tools', {
  state: () => {
    return {
      errors: [],
      kinds: [],
      children: [],
      tool: {},
      tools: [],
      pagination: {}
    }
  },

  actions: {
    async index(path) {
      return this.axios.get(path).then(response=> {
        this.pagination = response.data.pagination;
        this.kinds = response.data.kinds;
        this.tools = response.data.tools
      });
    },
    async new() {
      this.errors = {}; 
      this.tool = {};
      return this.axios.get(`/tools/new`).then(response => {             
        this.tool = response.data.tool;
      })  
    },
    async create(params) {
      this.errors = {};

      return this.axios.post(`/tools`, this.tool).then(response => {        
        this.tool = response.data.tool;
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    },
    async edit(id) {
      this.errors = {};
      this.tool = {};
      return this.axios.get(`/tools/${id}/edit`).then(response => {      
        this.tool = response.data.tool;
      })  
    },
    async update(id) {
      this.errors = {};
      return this.axios.put(`/tools/${id}`, this.tool).then(response => {        
        this.tool = response.data.tool;
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    },
    async destroy(id) {
      this.errors = {};
      return this.axios.delete(`/tools/${id}`).then(response => {        
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    }
  },
});