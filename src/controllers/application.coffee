# Just renders index.jade

ApplicationController = (app) ->
  app.get '/', (req, res) ->
    res.render 'index'



module.exports = ApplicationController