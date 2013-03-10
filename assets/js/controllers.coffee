"use strict"

ctrls = angular.module("subile.controllers", [])

ctrls.controller 'AppCtrl', ($scope, $http) ->


ctrls.controller 'SearchCtrl', ($scope, socket)->
  $scope.songs = []

  $scope.play = (song)->
    console.log song

  $scope.search = ->    
    socket.emit 'search', $scope.query, (songs) ->
      $scope.songs = songs