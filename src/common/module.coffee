Marionette = require('backbone.marionette');
Backbone = require('backbone');
Radio = require('backbone.radio');

class Module extends Marionette.Module
  constructor: ->
    @listenTo(Backbone.history, 'route', @_onHistoryRoute);
    super

  _onHistoryRoute: (router) ->
    return undefined unless @router
    if (@router and @router is router)
      Radio.command('header', 'changeHeader', @moduleName)
      @start()
    else
      @stop()

module.exports = Module
