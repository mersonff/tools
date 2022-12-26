<template lang="">
  <fieldset>
    <div class="control">
      <label class="label">Nome</label>
      <input type="text" name="name" id="name" class="input" v-model="data.place.name"/>
    </div>

    <div class="field">
      <label class="label">Local</label>
      <p class="control has-icons-left">
        <span class="">
          <v-select :options="ajaxOptions" v-model="place_id" :settings="{ ajax: ajax }" @change="ajaxChangeEvent($event)" @select="ajaxSelectEvent($event)" />
        </span>
      </p>
    </div>

    <div class="field is-grouped buttons">
      <div class="control">
        <input type="submit" value="Salvar" class="button is-link"/>      
      </div>
      <div class="control">
        <router-link :to="{ name: 'places_path' }" class="button is-link is-light">Cancelar</router-link>
      </div>
    </div>
  </fieldset>
</template>
<script>
import axios from 'axios';
import $ from 'jquery';
window.$ = $;
window.jQuery = window.$;

export default {
  props: ['data'],

  components: {

  },

  data() {
      return {
          place_id: '',
          ajaxOptions: [],
          ajax: {
            url: '/places',
            method: 'GET',
            data: function (params) {
              return {
                q: params.term
              }
            },
            processResults: function (data) {
              return {
                results: data.places.map (place => {
                  return { id: place.id, text: place.name }
                })
              }
            },
            cache: true
          },
        ajaxOptionsSelected: null    
      }
  },

  mounted() {
    this.getPlaces();
  },

  methods: {
    getPlaces() {
      axios.get('/places')
        .then(response => {
          this.myOptions = response.data.places.map (place => {
            return { id: place.id, text: place.name }
          });
        })
        .catch(error => {
          console.log(error);
        });
    },

    ajaxChangeEvent(val) {
      debugger
      console.log('ajaxChangeEvent', val);
      // alert(val);
    },

    ajaxSelectEvent({ id, text, selected }) {
      console.log('ajaxChangeEvent', { id, text, selected });
    },
  }
}

</script>
<style>
  .buttons {
    margin-top: 1rem;
  }

  select.form-control {
    width: 100%;
  }
</style>