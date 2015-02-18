module.exports = (grunt) ->
	require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
	# Project configuration
	grunt.initConfig
		jekyll:
			server:
				src: '<%= app %>'
				dest: '.jekyll'
				server: true
				server_port: 8000
				auto: true
	# Register tasks
	grunt.registerTask 'default', 'jekyll'
	grunt.registerTask 'serve', 'jekyll:server'