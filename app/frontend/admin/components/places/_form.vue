<template lang="">
  <fieldset class="edit-form">
    <section class="hero is-info">
      <div class="hero-body">
        <p class="title">
          Local
        </p>
        <p class="subtitle">
          {{ data.place.place_name }}
        </p>
      </div>
    </section>
    <br>
    <div class="control">
      <label class="label">Nome</label>
      <input type="text" name="name" id="name" class="input" v-model="data.place.name"/>
    </div>
    <br>
    <div class="field">
      <div class="control">
        <label class="label">Local</label>
        <p class="control has-icons-left">
          <span class="">
            <v-select :options="ajaxOptions" v-model="data.place.place_id" :settings="{ ajax: ajax }" class="select2-places" />
          </span>
        </p>
      </div>
    </div>
  </fieldset>
</template>
<script>
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
                q: {
                  name_cont: params.term
                }
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
}

</script>
<style>
  .buttons {
    margin-top: 1rem;
  }

  select.form-control {
    width: 100%;
  }

  .edit-form {
    margin-top: 1rem;
  }
</style>