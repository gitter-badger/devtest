require 'plugins.coffee'
$ = require 'jquery'
Backbone = require 'backbone'
App = require 'common/application.coffee'
app = new App()

app.on 'start', ->
  console.log 'appstarted'
  $('#main').text('remove me!')

if !window.cordova
  Backbone.history.start()
  app.start()

else
  $(document).on 'deviceready', ->
    console.log 'deviceready fired'
    Backbone.history.start()
    app.start()
