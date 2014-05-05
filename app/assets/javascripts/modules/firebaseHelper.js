var firebaseHelper = (function() {


  var _createRoom = function(userLocation) {
    var roomPath = geoHelper.randomizeString
    var newRoomUrl = BASE_URL + roomPath
    var newRoom = new Firebase(newRoomUrl)

    var roomsLocation = new Firebase(newRoomUrl+'/location')
    roomsLocation.push(userLocation);
    return newRoomUrl
  }


  var _pushToFirebase = function(firebaseUrl, userToken, userMessage) {
    var chatRoom = new Firebase(firebaseUrl)

    chatRoom.push({user_token: cookieFactory.getValue('user-token'), message: userMessage})
  }

  return {
    createRoom: _createRoom,
    pushToFirebase: _pushToFirebase
  }

}())


