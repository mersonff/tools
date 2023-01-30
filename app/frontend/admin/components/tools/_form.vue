<template lang="">
  <fieldset class="edit-form">
    <section class="hero is-info">
      <div class="hero-body">
        <div
          class="imagePreviewWrapper"
          :style="{ 'background-image': `url(${data?.tool?.image_url || previewImage})` }"
          @click="selectImage">
        </div>
        <p class="title">
          Ferramenta: {{ data.tool.name }}
        </p>
        <p class="subtitle">
          Local: {{ data.tool.place_name }}
        </p>
      </div>
    </section>
    <br>
    <div class="control">
      <label class="label">Código</label>
      <input type="number" name="code" id="code" class="input" v-model="data.tool.code"/>
    </div>

    <div class="control">
      <label class="label">Nome</label>
      <input type="text" name="name" id="name" class="input" v-model="data.tool.name"/>
    </div>

    <div class="control">
      <label class="label">Marca</label>
      <input type="text" name="brand" id="brand" class="input" v-model="data.tool.brand"/>
    </div>

    <div class="control">
      <label class="label">Modelo</label>
      <div class="select">
        <select v-model="data.tool.kind">
          <option v-for="kind in data.tool.kinds" :value="kind.key" :key="kind.key">{{ kind.name }}</option>
        </select>
      </div>
    </div>
    
    <div class="control">
      <label class="label">Observações</label>
      <textarea name="observations" id="observations" class="input" v-model="data.tool.observations"/>
    </div>
    <br>
    <div class="field">
      <label class="label">Local</label>
      <div class="control">
        <v-select :options="ajaxOptions" v-model="data.tool.place_id" :settings="{ ajax: ajax }" class="select2-places"/>
      </div>
    </div>

    <div class="file has-name">
      <label class="file-label">
        <input ref="fileInput"
          type="file"
          @input="pickFile" class="file-input">
        <span class="file-cta">
          <span class="file-icon">
            <i class="fas fa-upload"></i>
          </span>
          <span class="file-label">
            Escolha uma imagem
          </span>
        </span>
      </label>
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
        previewImage: null,
        tool_id: '',
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

  methods: {
    selectImage () {
      this.$refs.fileInput.click()
    },
    pickFile () {
      let input = this.$refs.fileInput
      let file = input.files
      if (file && file[0]) {
        let reader = new FileReader
        reader.onload = e => {
          this.previewImage = e.target.result
        }
        reader.readAsDataURL(file[0])
        this.$emit('input', file[0])
      }
    }
  }
}

</script>
<style>
  .imagePreviewWrapper {
    width: 250px;
    height: 250px;
    display: block;
    cursor: pointer;
    margin: 0 auto 30px;
    background-size: cover;
    background-position: center center;
  }
  .buttons {
    margin-top: 1rem;
  }

  select.form-control {
    width: 100%;
  }

  .edit-form {
    margin-top: 1rem;
  }

  .select2-places span {
    height: 2em !important;
  }
</style>