Error when user could not be authenticated. Usually for providing an illegal one time token.

	define [
		'error/error'
	], (
		Error
	) ->
		class AuthenticationError extends Error
			constructor: ->
				super 'Authentication Error', 99
