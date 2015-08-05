gulp         = require('gulp')
handleErrors = require('../handleErrors.coffee')
concat			 = require('gulp-concat')
paths 			 = require('../paths.coffee')
browserSync = require('browser-sync')
runSequence = require('run-sequence')
sass_ruby = require('gulp-ruby-sass')
order = require 'gulp-order'
debug = require 'gulp-debug'


gulp.task 'sass:ruby', ->
		gulp.src ['src/assets/*.scss', 'src/features/**/*.scss']
			.pipe sass_ruby()
			.pipe(concat('app.css'))
			.pipe(gulp.dest(paths.www.app.css))
			.pipe(browserSync.reload({stream: true}))
			.on 'error', handleErrors
