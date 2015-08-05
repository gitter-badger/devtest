Q = require('q')
gulp = require('gulp')
runSequence = require('run-sequence')
paths = require('../paths.coffee')
concat = require('gulp-concat')
handleErrors = require('../handleErrors.coffee')

gulp.task 'lib', ->
	deferred = Q.defer()
	runSequence 'lib:css','lib:fonts', ->
		deferred.resolve()
	return deferred.promise

gulp.task 'lib:css', ->
	gulp.src ['bower_comp/font-awesome/css/font-awesome.min.css', 'bower_comp/ratchet/dist/css/ratchet.min.css']
		.pipe(concat(paths.www.lib.css.file))
		.pipe(gulp.dest(paths.www.lib.css.dir))
		.on 'error', handleErrors

gulp.task 'lib:fonts', ->
	gulp.src ['bower_comp/font-awesome/fonts/**/*.*', 'bower_comp/ratchet/dist/fonts/**/*.*']
			.pipe(gulp.dest(paths.www.app.fonts.dir))
