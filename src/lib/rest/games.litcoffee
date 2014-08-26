
	define [
	], (
	) ->
		class Games
			constructor: (options) ->
				app = options.app
				@db = options.db

				app.get '/games/:id', (req, res) =>
					data = req.query
					gameId = req.params.id
					@db.findById 'games', gameId, (err, gameData) ->
						res.json gameData

				app.put '/games/:id', (req, res) =>
					gameId = req.params.id
					data = req.body
					@db.updateWithIdAndGet 'games', gameId, data, (err, game) ->
						res.json game
