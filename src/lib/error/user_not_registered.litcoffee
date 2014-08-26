Error when user could not be found in the database.

	define [
		'error/error'
	], (
		Error
	) ->
		class UserNotRegisteredError extends Error
			constructor: ->
				super 'User not Registered Error', -101
