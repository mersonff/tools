<template lang="">
  <div>
    <nav class="navbar" role="navigation" aria-label="main navigation">
  <div class="navbar-brand">
    <router-link :to="{name: 'tools_path'}" class="navbar-item">
      <img src="@/images/support.png" width="36" height="28">
    </router-link>

    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-start">
      <router-link :to="{name: 'tools_path'}" class="navbar-item">
        Ferramentas
      </router-link>
      <router-link :to="{name: 'places_path'}" class="navbar-item">
        Locais
      </router-link>
    </div>
  </div>
</nav>
  </div>
</template>
<script>
export default {
  
}
</script>
<style lang="">
  
</style>