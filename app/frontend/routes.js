import { createWebHistory, createRouter } from 'vue-router'

import AppLayout from '@/components/AppLayout.vue'
import PlaceIndex from '@/components/places/PlaceIndex.vue'
import PlaceShow from '@/components/places/PlaceShow.vue'
import PlaceEdit from '@/components/places/PlaceEdit.vue'
import PlaceNew from '@/components/places/PlaceNew.vue'

const router = createRouter({
  history: createWebHistory(),
  routes: [
    { path: '/', component: PlaceIndex, name: 'root_path' },
    { path: '/places', component: PlaceIndex, name: 'places_path' },
    { path: '/places/:id', component: PlaceShow, name: 'place_path' },
    { path: '/places/:id/edit', component: PlaceEdit, name: 'edit_place_path' },
    { path: '/places/new', component: PlaceNew, name: 'new_place_path' },
  ]
});

export default router;