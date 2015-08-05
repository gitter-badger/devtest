gulp = require('gulp')
browserSync  = require('browser-sync')

gulp.task 'browserSync', ->
	browserSync
		server:
			baseDir: 'www'
			notify: false
	return

