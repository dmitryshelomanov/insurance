<template>
  <div id="__nuxt">
    <nuxt-loading ref="loading"></nuxt-loading>
    <component v-if="layout" :is="layout"></component>
  </div>
</template>

<script>
import NuxtLoading from './components/nuxt-loading.vue'

let layouts = {

  "_app": process.BROWSER_BUILD ? () => System.import('E:\\OpenServer\\domains\\diplom\\client\\layouts\\app.vue') : require('E:\\OpenServer\\domains\\diplom\\client\\layouts\\app.vue'),

  "_default": process.BROWSER_BUILD ? () => System.import('E:\\OpenServer\\domains\\diplom\\client\\node_modules\\nuxt\\dist\\app\\layouts\\default.vue') : require('E:\\OpenServer\\domains\\diplom\\client\\node_modules\\nuxt\\dist\\app\\layouts\\default.vue')

}

export default {
  head: {"meta":[{"charset":"utf-8"},{"name":"viewport","content":"width=device-width, initial-scale=1"},{"hid":"description","name":"description","content":"Мета описание"}],"link":[{"rel":"stylesheet","href":"//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"},{"rel":"stylesheet","href":"/css/main.css"},{"rel":"stylesheet","href":"/css/font-awesome.min.css"},{"rel":"stylesheet","href":"http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"}],"script":[{"src":"http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"},{"src":"http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"},{"src":"http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"}]},
  data: () => ({
    layout: null,
    layoutName: ''
  }),
  
  mounted () {
    this.$loading = this.$refs.loading
    this.$nuxt.$loading = this.$loading
  },
  
  methods: {
    setLayout (layout) {
      if (!layout || !layouts['_' + layout]) layout = 'default'
      this.layoutName = layout
      let _layout = '_' + layout
      if (typeof layouts[_layout] === 'function') {
        return this.loadLayout(_layout)
      }
      this.layout = layouts[_layout]
      return Promise.resolve(this.layout)
    },
    loadLayout (_layout) {
      return layouts[_layout]()
      .then((Component) => {
        layouts[_layout] = Component
        this.layout = layouts[_layout]
        return this.layout
      })
      .catch((e) => {
        if (this.$nuxt) {
          return this.$nuxt.error({ statusCode: 500, message: e.message })
        }
        console.error(e)
      })
    }
  },
  components: {
    NuxtLoading
  }
}
</script>


