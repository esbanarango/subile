# Just renders index.jade

ApplicationController = (app) ->
  app.get '/', (req, res) ->
    if not (req.session.loggedIn)
      res.redirect '/login'
      return    
    res.render 'index'



module.exports = ApplicationController