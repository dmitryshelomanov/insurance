module.exports = {
  head: {
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Мета описание' }
    ],
  	link: [
      { rel: 'stylesheet', href: '//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css' },
      { rel: 'stylesheet', href: '/css/main.css' },
      { rel: 'stylesheet', href: '/css/font-awesome.min.css' },
      { rel: 'stylesheet', href: 'http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css' },
  	],
    script: [
      {src: 'http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js'},
      {src: 'http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js'},
      {src: 'http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js'}
    ]
  },
  build: {
    vendor: [
      'vue-resource',
      '~plugins/register.js'
    ],
  },
  plugins: [
    '~plugins/vue-resource.js',
    '~plugins/register.js'
  ]
}