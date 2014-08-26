

	requirejs = require 'requirejs'

	requirejs.config
		nodeRequire: require
		baseUrl: 'lib/'
		paths:
			shared: '../shared'

	requirejs ['main'], (main) ->
		main.start()
