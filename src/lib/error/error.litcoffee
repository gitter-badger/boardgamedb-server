Base Error

	define [
	], (
	) ->
		class BaseError extends Error
			constructor: (message, code) ->
				@message = message
				@status = code
				super
