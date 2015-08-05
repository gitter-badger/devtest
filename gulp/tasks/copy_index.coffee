gulp = require('gulp')
runSequence = require('run-sequence')
paths = require('../paths.coffee')
browserSync = require('browser-sync')

gulp.task 'copy:index', ->
	runSequence 'clean:index', ->
		gulp.src(paths.app.index.file)
				.pipe(gulp.dest(paths.www.app.index.dir))
				.pipe(browserSync.reload({stream: true}))
