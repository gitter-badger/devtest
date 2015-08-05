Q                     = require('q')
gulp        = require('gulp')
runSequence = require('run-sequence')
browserify  = require('browserify')
watchify    = require('watchify')
paths          = require('../paths.coffee')
source      = require('vinyl-source-stream')
bundleLogger = require('../bundleLogger.coffee')
handleErrors = require('../handleErrors.coffee')
browserSync = require('browser-sync')
path = require 'path'


gulp.task 'browserify', ->
  deferred = Q.defer()
  runSequence 'clean:js', ->
    console.log 'checking global var ' + global.isWatching
    if global.isWatching
      console.log 'Watchifying...'
      bundleMethod = watchify
    else
      console.log 'Browserifying...'
      bundleMethod = browserify

    bundler = bundleMethod
      cache: {}
      packageCache: {}
      fullPaths: true
      entries: paths.app.browserify_entry,
      extensions: ['.coffee','.hbs']
      paths: [path.resolve './src']
    bundle = ->
      bundleLogger.start()

      bundler
        .bundle({debug: true})
        .on('error', handleErrors)
        .pipe(source(paths.www.app.js.file))
        .pipe(gulp.dest(paths.www.app.js.dir))
        .pipe(browserSync.reload({stream: true}))
        .on('end', bundleLogger.end);

    if global.isWatching
      bundler.on('update', bundle)

    deferred.resolve(bundle())
    return deferred.promise
