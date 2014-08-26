
	define [
		'log4js'
		'nconf'
		'express'
		'body-parser'
		'database/database'
		'rest/games'
	], (
		log4js
		nconf
		Express
		bodyParser
		Database
		Games
	) ->
		class Application
			@start: ->
				logger = log4js.getLogger()
				nconf.env().argv
					p:
						alias: 'port'
						describe: 'Port for boardgamedb server to listen to'
						default: 22000
						demand: true

				@db = new Database
				@db.connect 'boardgamedb', (err) =>
					app = Express()
					app.use bodyParser.json()
					app.use (req, res, next) ->
						res.setHeader 'Access-Control-Allow-Origin', '*'
						res.setHeader 'Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE'
						res.setHeader 'Access-Control-Allow-Headers', 'X-Requested-With,content-type'
						res.setHeader 'Access-Control-Allow-Credentials', true
						next()

					rest = new Games
						app: app
						db: @db

					app.listen 32000, ->
						logger.debug 'Ready to receive requests'
