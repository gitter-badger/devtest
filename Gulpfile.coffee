gulp         = require('gulp')
requireDir = require('require-dir')
requireDir('./gulp/tasks')
runSequence = require('run-sequence')


gulp.task 'default', ->
	runSequence 'build', 'watch'
