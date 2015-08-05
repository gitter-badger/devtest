Q 					= require('q')
gulp        = require('gulp')
runSequence = require('run-sequence')
paths = require('../paths.coffee')
clean = require('gulp-rimraf')
handleErrors = require('../handleErrors.coffee')

gulp.task 'clean', ->
	deferred = Q.defer()
	runSequence 'clean:lib', 'clean:app:img', 'clean:sass', 'clean:js', 'clean:index', ->
		deferred.resolve()
	return deferred.promise


gulp.task 'clean:lib', ->
	gulp.src [paths.www.lib.img.dir, paths.www.lib.css.dir]
			.pipe(clean())

gulp.task 'clean:app:img', ->
	gulp.src paths.www.app.img.dir
					.pipe(clean())


gulp.task 'clean:index', ->
	gulp.src(paths.www.app.index.file)
			.pipe(clean())

gulp.task 'clean:sass', ->
	gulp.src('./www/css/app.css', {read: false} )
			.pipe(clean())
			.on 'error', handleErrors

gulp.task 'clean:js', ->
	gulp.src(paths.www.app.js.dir + paths.www.app.js.file, {read: false} )
			.pipe(clean())
