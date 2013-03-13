#### Routes
# We are setting up theese routes:
#
# GET, POST, PUT, DELETE methods are going to the same controller methods - we dont care.
# We are using method names to determine controller actions for clearness.


module.exports = (app) ->

  require('./controllers/application')(app)
  require('./controllers/authentication')(app)
  require('./controllers/users')(app)
