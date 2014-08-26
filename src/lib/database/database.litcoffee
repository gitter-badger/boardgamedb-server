
	define [
		'mongodb'
		'error/object_not_found'
	], (
		mongodb
		ObjectNotFoundError
	) ->
		class Database
			connect: (databaseName, done) ->
				@client = mongodb.MongoClient
				@client.connect "mongodb://127.0.0.1:27017/#{databaseName}", (err, @db) =>
					done err

			insert: (name, data, done) ->
				@db.collection name, (err, collection) ->
					return done err if err?
					collection.insert data, {w:1}, (err) ->
						done err

			findOne: (name, criteria, done) ->
				@db.collection name, (err, collection) ->
					return done err if err?
					console.log 'searching for :', criteria
					collection.findOne criteria, (err, object) ->
						return done err if err?
						return done new ObjectNotFoundError if not object?
						done err, object

			findArray: (name, criteria, done) ->
				@db.collection name, (err, collection) ->
					return done err if err?
					collection.find( criteria ).toArray done

			findCollection: (name, done) ->
				@db.collection name, done

			remove: (name, criteria, done) ->
				@db.collection name, (err, collection) ->
					collection.remove criteria, done

			findById: (name, id, done) ->
				@findOne name, {_id:new mongodb.ObjectID(id)}, done

			updateWithIdAndGet: (name, id, data, done) ->
				@updateAndGet name, {_id:new mongodb.ObjectID(id)}, data, done

			updateAndGet: (name, criteria, data, done) ->
				@db.collection name, (err, collection) ->
					return done err if err?
					collection.update criteria, data, (err) ->
						return done err if err?
						collection.findOne criteria, (err, object) ->
							return done err if err?
							return done new ObjectNotFoundError if not object?
							done err, object
