var firebaseHelper = (function() {

  var _createRoom = function(userLocation) {
    var roomPath = geoHelper.randomizeString
    var newRoomUrl = 'https://luminous-fire-2873.firebaseio.com/' + roomPath
    var newRoom = new Firebase(newRoomUrl)

    // BASE_URL
    var roomsLocation = new Firebase(newRoomUrl+'/location')
    roomsLocation.push(userLocation);
    return newRoomUrl
  }

  var _pushToFirebase = function(firebaseUrl, userToken, userMessage)
    var chatRoom = new Firebase(firebaseUrl)
    chatRoom.push({user_token: userToken, message: userMessage})
  }

  return {
    createRoom: _createRoom
    pushToFirebase: _pushToFirebase
  }

}())


