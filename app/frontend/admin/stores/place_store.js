import { defineStore } from 'pinia'

export const PlaceStore = defineStore('places', {
  state: () => {
    return {
      errors: [],
      children: [],
      place: {},
      places: [],
      pagination: {}
    }
  },

  actions: {
    async index(path) {
      return this.axios.get(path).then(response=> {
        this.pagination = response.data.pagination;
        this.places = response.data.places
      });
    },
    async new() {
      this.errors = {}; 
      this.place = {};
      return this.axios.get(`/places/new`).then(response => {             
        this.place = response.data.place;
      })  
    },
    async create() {
      this.errors = {};
      return this.axios.post(`/places`, this.place).then(response => {        
        debugger
        this.place = response.data.place;
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    },
    async edit(id) {
      this.errors = {};
      this.place = {};
      return this.axios.get(`/places/${id}/edit`).then(response => {      
        this.place = response.data.place;
      })  
    },
    async update(id) {
      this.errors = {};
      return this.axios.put(`/places/${id}`, this.place).then(response => {        
        this.place = response.data.place;
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    },
    async destroy(id) {
      this.errors = {};
      return this.axios.delete(`/places/${id}`).then(response => {        
        return true;
      }).catch(error => {
        this.errors = error.response.data.errors;
        return false;
      }) 
    }
  },
});