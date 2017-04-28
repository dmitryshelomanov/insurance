'use strict'

import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)


const _73f309e7 = () => import('E:\\OpenServer\\domains\\diplom\\client\\pages\\index.vue')

const _0f9010b7 = () => import('E:\\OpenServer\\domains\\diplom\\client\\pages\\faq\\index.vue')

const _ae4789c0 = () => import('E:\\OpenServer\\domains\\diplom\\client\\pages\\about\\index.vue')

const _5eb425ff = () => import('E:\\OpenServer\\domains\\diplom\\client\\pages\\auth\\index.vue')

const _be25414a = () => import('E:\\OpenServer\\domains\\diplom\\client\\pages\\insurance\\_id.vue')



const scrollBehavior = (to, from, savedPosition) => {
  // savedPosition is only available for popstate navigations.
  if (savedPosition) {
    return savedPosition
  } else {
    let position = {}
    // if no children detected
    if (to.matched.length < 2) {
      // scroll to the top of the page
      position = { x: 0, y: 0 }
    }
    else if (to.matched.some((r) => r.components.default.options.scrollToTop)) {
      // if one of the children has scrollToTop option set to true
      position = { x: 0, y: 0 }
    }
    // if link has anchor,  scroll to anchor by returning the selector
    if (to.hash) {
      position = { selector: to.hash }
    }
    return position
  }
}


export default new Router({
  mode: 'history',
  base: '/',
  linkActiveClass: 'nuxt-link-active',
  scrollBehavior,
  routes: [
		{
			path: "/",
			component: _73f309e7,
			name: "index"
		},
		{
			path: "/faq",
			component: _0f9010b7,
			name: "faq"
		},
		{
			path: "/about",
			component: _ae4789c0,
			name: "about"
		},
		{
			path: "/auth",
			component: _5eb425ff,
			name: "auth"
		},
		{
			path: "/insurance/:id?",
			component: _be25414a,
			name: "insurance-id"
		}
  ]
})
