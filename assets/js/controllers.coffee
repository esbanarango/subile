"use strict"

ctrls = angular.module("subile.controllers", [])

ctrls.controller 'AppCtrl', ($scope, $http) ->


ctrls.controller 'SearchCtrl', ($scope)->
  $scope.songs = [
    Url: "http://tinysong.com/16RSj"
    SongID: 29402335
    SongName: "Motel"
    ArtistID: 1385168
    ArtistName: "Karma Fox"
    AlbumID: 4693575
    AlbumName: "Mas que un deseo"
  ,
    Url: "http://tinysong.com/Znj1"
    SongID: 29402306
    SongName: "Seis meses"
    ArtistID: 1385168
    ArtistName: "Karma Fox"
    AlbumID: 4693575
    AlbumName: "Mas que un deseo"
  ,
    Url: "http://tinysong.com/FrRw"
    SongID: 29402319
    SongName: "Se que volveras"
    ArtistID: 1385168
    ArtistName: "Karma Fox"
    AlbumID: 4693575
    AlbumName: "Mas que un deseo"
  ,
    Url: "http://tinysong.com/AHi0"
    SongID: 25191036
    SongName: "Vacaciones que olvidar"
    ArtistID: 1385168
    ArtistName: "Karma Fox"
    AlbumID: 4276889
    AlbumName: "Karma Fox"
  ,
    Url: "http://tinysong.com/QQ1q"
    SongID: 29402278
    SongName: "Nuestro sueño"
    ArtistID: 1385168
    ArtistName: "Karma Fox"
    AlbumID: 4693575
    AlbumName: "Mas que un deseo"  
  ]