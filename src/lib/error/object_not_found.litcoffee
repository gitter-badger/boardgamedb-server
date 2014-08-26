Error when user could not be found in the database.

	define [
		'error/error'
	], (
		Error
	) ->
		class ObjectNotFoundError extends Error
			constructor: ->
				super 'Object not found', 100
