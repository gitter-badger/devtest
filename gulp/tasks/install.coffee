gulp         = require('gulp')
install      = require('gulp-install')
shell_run    = require('./shell_run.coffee')

gulp.task 'install', ['bower'], ->
	gulp.src(['./package.json'])
			.pipe(install())