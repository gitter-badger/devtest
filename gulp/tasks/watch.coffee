gulp = require('gulp')
args = require('minimist')(process.argv.slice(2))
runSequence = require('run-sequence')

gulp.task 'watch', ['browserSync'], ->
  global.isWatching = true
  gulp.watch('src/**/*.scss', ['sass:ruby', 'cordova:build'])
  gulp.watch('src/index.html', ['copy:index', 'cordova:build'])