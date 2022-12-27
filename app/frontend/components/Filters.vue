<template>  
  <section>
    <a href="#" @click.prevent="toggleForm">&nbsp;Filtrar</a>
    <br><br>
    <form @submit.prevent="search" ref="filters" accept-charset="UTF-8" class="is-hidden">  
      <div class="columns">      
        <div class="column is-full"> 
          <label class="label">Nome</label>    
          <input type="text" v-model="form.name_cont" class="input">
        </div>  
      </div>
      <div class="field is-grouped buttons">
        <div class="column is-one-sixth"></div>
        <div class="control">
          <input type="submit" role="button" class="button is-primary" value="Filtrar">
        </div>
        <div class="control">
          <a @click="reset" href="#" class="button is-secondary">Limpar</a>
        </div>  
      </div>      
    </form>

  </section>
</template>

<script>

export default {
  data: function() {
    return {
      form: {
        name_cont: ''
      }
    }
  },

  methods: {
    toggleForm() {
      this.$refs.filters.classList.toggle('is-hidden');
    },
    search() {
      const query = Object.fromEntries(
        Object.entries(this.form).map(entry => [`q[${entry[0]}]`, entry[1]])
      );
      this.$router.push({path: this.$route.path, query: query});
      this.$emit('index');
    },
    reset() {
      this.form = {
        name_cont: ''
      }
      this.$router.push({path: this.$route.path, query: ''})
    },
  }
}
</script>
