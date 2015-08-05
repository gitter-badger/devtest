Q 					= require('q')
gulp        = require('gulp')
runSequence = require('run-sequence')
args = require('minimist')(process.argv.slice(2))
shell_run = require('./shell_run.coffee')

gulp.task	'build', ->
		deferred = Q.defer()
		runSequence 'clean', 'copy:index', 'lib', 'app:assets', 'sass:ruby', 'browserify', 'cordova:build', ->
			deferred.resolve()
		return deferred.promise
