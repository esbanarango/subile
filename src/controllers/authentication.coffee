User = require '../models/user'

AuthenticationController = (app) ->

  # Returns the information of an user
  # +URL+:: GET /users/+:id+
  app.get '/login', (req, res) ->
    res.render 'authentication/login',
      title: 'Login'
      csss: ['login']

module.exports = AuthenticationController