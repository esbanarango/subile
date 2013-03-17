#### Config file
# Sets application config parameters depending on `env` name
exports.setEnvironment = (env) ->
	console.log "set app environment: #{env}"
	switch(env)
		when "development"
			exports.DEBUG_LOG=true
			exports.DEBUG_WARN=true
			exports.DEBUG_ERROR=true
			exports.DEBUG_CLIENT=true
			exports.DB_HOST = 'localhost'
			exports.DB_PORT = "27017"
			exports.DB_NAME = 'subile-dev'
			exports.DB_USER = ''
			exports.DB_PASS = ''
			exports.API_TINY_KEY = "d6af4409f6ea1cb032ceb5309617265d"

		when "testing"
			exports.DEBUG_LOG=true
			exports.DEBUG_WARN=true
			exports.DEBUG_ERROR=true
			exports.DEBUG_CLIENT=true
			exports.DB_NAME = 'subile-test'

		when "production"
			exports.DEBUG_LOG=false
			exports.DEBUG_WARN=false
			exports.DEBUG_ERROR=true
			exports.DEBUG_CLIENT=false
		else
			console.log "environment #{env} not found"