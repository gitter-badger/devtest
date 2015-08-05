gulp = require 'gulp'
shell_run = require './shell_run.coffee'
args = require('minimist')(process.argv.slice(2))

gulp.task 'cordova:build', ->
  if (args.device is "android") or (args.device is "ios")
    shell_run('cordova build ' + args.device + " && cordova run " + args.device )
    return
  else
    return console.log "if you want to cordova build please provide --device ios OR android option"