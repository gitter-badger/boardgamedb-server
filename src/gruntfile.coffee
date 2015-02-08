module.exports = (grunt) ->
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-compress'

	grunt.initConfig
		coffee:
			glob_to_multiple:
				expand: true
				flatten: false
				src: ['**/*.litcoffee']
				ext: '.js'

		copy:
			main:
				files: [
						expand: true
						src: ['**/*.js', '!node_modules/**']
						dest: 'out'
					,
						expand: true
						src: ['package.json']
						dest: 'out'
				]

		compress:
			main:
				options:
					archive: 'deploy/boardgamedb_server.tar.gz'
				files: [
						src: ['**']
						expand: true
						cwd: 'out/'
				]

	grunt.registerTask 'default', [
		'coffee'
		'copy'
		'compress'
	]

	grunt.registerTask 'test', [
	]
