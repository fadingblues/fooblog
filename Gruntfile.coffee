module.exports = (grunt) ->
	require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
	# Project configuration
	grunt.initConfig
		# Build jekyll site
		jekyll:
			build:
				dest: '_site'
		# Compile Sass
		sass:
			dist:
				files:
					'css/main.css': '_sass/main.scss'
		# Minify CSS
		cssmin:
			# options:
			# 	shorthandCompacting: true
			# 	roundingPrecision: -1
			target:
				files:
					'css/main.min.css': 'css/main.css'
		# Watch for changes
		watch:
			sass:
				files: '_sass/**/*.scss'
				tasks: ['sass']
			jekyll:
				files: [
					'_layouts/*.html',
					'_includes/*.html',
					'_posts/*.md',
					'css/main.css',
					'index.html'
				]
				tasks: ['jekyll']
		# Keep browser in sync
		browserSync:
			files:
				src: ['_site/css/*.css']
			options:
				watchTask: true
				ghostMode:
					clicks: true
					scroll: true
					links: true
					forms: true
				server:
					baseDir: '_site'
	# Register tasks
	grunt.registerTask 'build', ['sass', 'cssmin', 'jekyll']
	grunt.registerTask 'default', ['build', 'browserSync', 'watch']