src_dir = './src/'
lib_dir = './lib/'

paths = ->
	obj =
				app:
					img_dir: src_dir + 'assets/img/**/*.png'
					fonts_dir: src_dir + 'assets/fonts/**/*.*'
					browserify_entry: './src/main.coffee'
					index:
						file: './src/index.html'
				www:
				 app:
					 js:
						 file: 'app.js'
						 dir: './www/js/'
						css: './www/css'
						img:
							dir: './www/img'
						fonts:
							dir: './www/fonts'
						index:
							file: './www/index.html'
							dir: './www'
					lib:
						img:
							dir: './www/css/images/'
						css:
							file: 'libs.css'
							dir: './www/css'




module.exports = paths()
