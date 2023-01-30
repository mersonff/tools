<template>
  <div v-if="store.pagination.next || store.pagination.previous">
    <!-- <nav class="pagination" role="navigation" aria-label="pagination">
      <a class="pagination-previous">Previous</a>
      <a class="pagination-next">Next page</a>
      <ul class="pagination-list">
        <li>
          <a class="pagination-link" aria-label="Goto page 1">1</a>
        </li>
        <li>
          <span class="pagination-ellipsis">&hellip;</span>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 45">45</a>
        </li>
        <li>
          <a class="pagination-link is-current" aria-label="Page 46" aria-current="page">46</a>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 47">47</a>
        </li>
        <li>
          <span class="pagination-ellipsis">&hellip;</span>
        </li>
        <li>
          <a class="pagination-link" aria-label="Goto page 86">86</a>
        </li>
      </ul>
    </nav> -->
    <nav class="pagination" role="navigation" aria-label="pagination">
      <ul class="pagination-list">
        <div v-if="store.pagination.previous != null">
          <router-link :to="{path: $route.path, query: setQuery(store.pagination.previous)}" v-if="store.pagination.previous" class="pagination-previous">
            <span>&laquo;</span>
          </router-link>
        </div>

        <li v-for="page in store.pagination.pages" :key="page"  :aria-current="[store.pagination.current == page ? page : '']">
          <router-link :to="{path: $route.path, query: setQuery(page)}" v-if="page != store.pagination.current && (page == 1 || page == 2 || page == 3 || page == store.pagination.pages || page == store.pagination.pages - 1 || page == store.pagination.pages - 2)" :class="'pagination-link'">{{ page }}</router-link>

          <a v-if="page == store.pagination.current" :class="[page == store.pagination.current ? 'pagination-link is-current' : 'pagination-link']">{{ page }}</a>
          <a v-if="page == store.pagination.current && page % 4 == 0" class="pagination-ellipsis">&hellip;</a>
        </li>

        <div v-if="store.pagination.next != null && store.pagination.pages > 0">
          <router-link :to="{path: $route.path, query: setQuery(store.pagination.next)}"  v-if="store.pagination.next" class="pagination-next">
            <span>&raquo;</span>
          </router-link>
        </div>
      </ul>
    </nav>
  </div>
</template>

<script>
export default {
  props: ['store'],

  methods: {
    setQuery(page) {
      let query = JSON.parse(JSON.stringify(this.$route.query));
      query['page'] = page;

      return query;
    }
  },

  watch: {
    '$route.query': function() {   
      this.$emit('clicked');  
    }
  }
}
</script>