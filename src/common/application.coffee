BabySitter = require('backbone.babysitter')
Radio = require 'backbone.radio'
Marionette = require('backbone.marionette')
require('config/shim')

class Application extends Marionette.Application
  constructor: ->
    super
    @initialize()

module.exports = Application
