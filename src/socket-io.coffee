config = require "./config"
request = require('superagent')

module.exports = (server, app) ->
  socketIO = require('socket.io').listen(server)

  config.setEnvironment app.settings.env

  currentSong = undefined
  dj = undefined

  elect = (socket) ->
    dj = socket
    socketIO.sockets.emit "announcement", {text: socket.nickname + " is the new dj"}
    socket.emit "elected"
    socket.dj = true
    socket.on "disconnect", ->
      dj = null
      socketIO.sockets.emit "announcement", {text: "the dj left - next one to join become dj"}

  # Heroku Config 
  # "The WebSockets protocol is not yet supported on the Cedar stack."
  # socketIO.configure ->
  #   socketIO.set "transports", ["xhr-polling"]
  #   socketIO.set "polling duration", 10

  unless app.settings.socketIO
    app.set 'socketIO', socketIO
  socketIO.sockets.on 'connection', (socket) ->

    socket.on "join", (name) ->
      socket.nickname = name
      socket.broadcast.emit "announcement", {text: name + " joined the chat."}
      unless dj
        elect socket
      else
        socket.emit "play", currentSong

    socket.on "play", (song) ->
      if socket.dj
        currentSong = song
        socket.broadcast.emit "play", song

    socket.on "search", (q, fn) ->
      request "http://tinysong.com/s/" + encodeURIComponent(q) + "?key=" + config.API_TINY_KEY + "&format=json", (res) ->
        fn JSON.parse(res.text) if 200 is res.status


    socket.on "send:message", (msg, fn) ->
      message =
        text: msg
        from: socket.nickname
      socket.broadcast.emit "send:message", message
      
      # Confirm the reception
      fn new Date
