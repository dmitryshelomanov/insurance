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
    babel: {
      presets: ["es2015", "stage-0", "stage-1", "stage-2", "stage-3"],
    },
    loaders: [
      {
        test: /\js$/,
        loader: 'babel-loader',
        query: {
          presets: ["es2015", "stage-0", "stage-1", "stage-2", "stage-3"],
        }
      }
    ],
    vendor: [
      'vue-resource',
      'helper-storage',
      'validatores6'
    ]
  },
  plugins: [
    {src: '~plugins/vue-resource.js'},
    {src: '~plugins/register.js'},
    {src: '~plugins/storage.js', ssr: false},
    {src: '~plugins/validator.js', ssr: false}
  ]
}