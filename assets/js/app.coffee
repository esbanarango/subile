"use strict"

app = angular.module("subile", ["subile.controllers", "subile.filters", "subile.directives", "subile.services"])
app.config ["$routeProvider", ($routeProvider) ->
  
]

$ ->
  socket = io.connect()

  socket.on 'connect', ->

    # send a join event with your name
    socket.emit 'join', 'guest'

    # show the chat
    $('#chat').show()

    socket.on 'announcement', (msg) ->
      li = $('<li>', 'class': 'announcement')
      li.html(msg)
      $('#messages').append li

  addMessage = (from, text) ->
    li = $('<li>', 'class': 'message')
    li.html "<b>#{from}</b>: #{text}"
    $('#messages').append li
    li

  input = $('#input')
  $('#form').submit (e) ->
    li = addMessage 'me', input.val()
    e.preventDefault()
    socket.emit 'text', input.val(), (date) ->
      li.addClass('confirmed')
      li.attr('title', date)

    # reset the input
    input.val ''
    input.focus()

  socket.on 'text', addMessage

  # Plays a song
  playing = $('#playing')
  play = (song) ->
    return unless song
    playing.html "<hr><b>Now Playing: </b> #{song.ArtistName}  #{song.SongName}<br>"
    iframe = $('<iframe>', 
      'src': song.Url
      'frameborder':'0'
      )
    playing.append iframe

  socket.on 'song', play

  # Search form
  results = $('#results')
  $('#dj').show()
  $('#dj').submit (e) ->
    e.preventDefault()
    results.html('')
    socket.emit 'search', $('#s').val(), (songs,dj) ->
      console.log songs
      for song in songs
        ((song)->
          result = $('<li>')
          result.html("#{song.ArtistName} - <b> #{song.SongName} ")
          if dj
            a = $('<a></a>','href': '#')
            a.html('Select')
            a.on 'click', ->
              socket.emit 'song', song
              play song
              return false
            result.append a
          results.append result
        )(song)

  socket.on 'elected', ->
    $('#dj').attr 'class','isDJ'