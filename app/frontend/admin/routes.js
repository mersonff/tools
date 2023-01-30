import { createWebHistory, createRouter } from 'vue-router'

import PlaceIndex from '@/admin/components/places/PlaceIndex.vue'
import PlaceShow from '@/admin/components/places/PlaceShow.vue'
import PlaceEdit from '@/admin/components/places/PlaceEdit.vue'
import PlaceNew from '@/admin/components/places/PlaceNew.vue'

import ToolIndex from '@/admin/components/tools/ToolIndex.vue'
import ToolShow from '@/admin/components/tools/ToolShow.vue'
import ToolEdit from '@/admin/components/tools/ToolEdit.vue'
import ToolNew from '@/admin/components/tools/ToolNew.vue'

const router = createRouter({
  history: createWebHistory(`/admin`),
  routes: [
    // { path: '/', component: ToolIndex, name: 'tools_path' },

    { path: '/places', component: PlaceIndex, name: 'places_path' },
    { path: '/places/:id', component: PlaceShow, name: 'place_path' },
    { path: '/places/:id/edit', component: PlaceEdit, name: 'edit_place_path' },
    { path: '/places/new', component: PlaceNew, name: 'new_place_path' },

    { path: '/tools', component: ToolIndex, name: 'tools_path' },
    { path: '/tools/:id', component: ToolShow, name: 'tool_path' },
    { path: '/tools/:id/edit', component: ToolEdit, name: 'edit_tool_path' },
    { path: '/tools/new', component: ToolNew, name: 'new_tool_path' },
  ]
});

export default router;