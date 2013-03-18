User = require '../models/user'

AuthenticationController = (app) ->

  # Returns the information of an user
  # +URL+:: GET /users/+:id+
  app.get '/login', (req, res) ->
    res.render 'authentication/login',
      title: 'Login'
      csss: ['zocial','login']
      message: req.flash('error')

  # Returns the information of an user
  # +URL+:: GET /users/+:id+
  app.post '/login', (req, res) ->
    User.findOne {username: req.body.user.username, password: req.body.user.password}, (err, user)->
      next(err) if err
      unless user
        req.flash('error', 'Incorrect username or password. ')
        res.redirect '/login'
        return
      req.session.loggedIn = user._id.toString()
      res.redirect '/'



module.exports = AuthenticationController