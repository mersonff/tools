// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

import { createApp } from 'vue';
const app = createApp(AppLayout)

import Router from '@/admin/routes.js';
import AppLayout from '@/admin/components/AppLayout.vue';
import Axios from "axios";

import { createApi } from '@/plugins/api';
const Api = createApi({handler: Axios, namespace: 'admin' });

import { createPinia } from 'pinia';
const Pinia = createPinia();
Pinia.use(({ store }) => { store.axios = Axios })

import Pagination from '@/admin/components/Pagination.vue'
app.component('pagination', Pagination)

import VueSelect2 from 'vue3-select2-component';
app.component("v-select", VueSelect2)

import $ from 'jquery';
import select2 from 'select2';




app.use(Router)
   .use($)
   .use(select2)
   .use(Pinia)
   .use(Api)
   .mount('#app');
