"use strict"

ctrls = angular.module("subile.controllers", [])

ctrls.controller 'AppCtrl', ($scope, $http, socket) ->
  
  socket.on 'connect', ->
    # send a join event with your name
    socket.emit 'join', 'guest'

  # Incoming
  socket.on 'play', (song)-> 
    $scope.play(song)

  $scope.play = (song)->
    socket.emit 'play', song
    playing = $('#playing')
    playing.html "<b>Now Playing: </b> #{song.ArtistName}  #{song.SongName}<br>"
    source = $("#widget-template").html()
    template = Handlebars.compile(source)
    obj = template(song)    
    playing.append obj
   

# Chat Controller
ctrls.controller 'ChatCtrl', ($scope, socket)->
  $scope.messages = []  
  
  # Incoming
  socket.on 'send:message', (message) ->
    $scope.messages.push message

  socket.on 'announcement', (message) ->
    $scope.messages.push message

  $scope.newMessage = ->
    message =
      text: $scope.message.text
      from: 'me'

    socket.emit 'send:message', message.text, (date) ->
      message.date = date

    # add the message to our model locally
    $scope.messages.push message
    # clear message box
    $scope.message.text = ""

# Search Controller
ctrls.controller 'SearchCtrl', ($scope, socket)->
  $scope.songs = []  

  $scope.search = ->
    socket.emit 'search', $scope.query, (songs) ->
      $scope.songs = songs