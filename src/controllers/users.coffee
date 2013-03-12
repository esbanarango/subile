User = require '../models/user'

UsersController = (app) ->

  app.namespace '/users', ->

    # Returns the information of an user
    # +URL+:: GET /users/+:id+
    app.get '/:id', (req, res) ->
      User.findById req.params.id, (err, user) ->
        if not err
          res.send user
        else
          res.send err
          res.statusCode = 500

    # Updates the information of an user
    # +URL+:: PUT /users/+:id+
    # +Params+::
    #   - +user+ hash
    app.put '/:id', (req, res) ->
      User.findByIdAndUpdate req.params.id, {"$set":req.body.user}, (err, user) ->
        if not err
          res.send user
        else
          res.send err
          res.statusCode = 500

    # Destroys an user
    # +URL+:: DELETE /users/+:id+
    app.del '/:id', (req, res) ->
      User.findByIdAndRemove req.params.id, (err) ->
        if not err
          res.send {}
        else
          res.send err
          res.statusCode = 500

    # Lists all users
    # +URL+:: GET /users
    app.get '/', (req, res) ->
      User.find {}, (err, users) ->
        res.send users

    # Creates user
    # +URL+:: POST /users
    # +Params+::
    #   - +user+ hash.
    app.post '/', (req, res) ->
      user = new User req.body.user
      user.save (err, user) ->
        if not err
          res.send user
          res.statusCode = 201
        else
          res.send err
          res.statusCode = 500      

module.exports = UsersController