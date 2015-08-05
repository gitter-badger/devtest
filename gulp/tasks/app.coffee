Q = require('q')
gulp = require('gulp')
runSequence = require('run-sequence')
paths = require('../paths.coffee')

gulp.task 'app:assets', ->
	deferred = Q.defer()	
	runSequence 'app:img', 'app:fonts', ->
		deferred.resolve()
	return deferred.promise

gulp.task 'app:fonts', ->
	gulp.src paths.app.fonts_dir
			.pipe(gulp.dest(paths.www.app.fonts.dir))

gulp.task 'app:img', ->
	gulp.src paths.app.img_dir
			.pipe gulp.dest paths.www.app.img.dir