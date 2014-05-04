var firebaseHelper = (function() {

  var _accessRoom = function(roomUrl){
      console.log(roomUrl + " courtesy of firebase Helper ")
      console.log()
      var chosenChatRoomServer = new Firebase(roomUrl)
  }

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
    chatRoom.push({user_token: userToken, message: userMessage})
  }

  return {
    accessRoom: function(roomUrl){
      _accessRoom(roomUrl)
    },
    createRoom: _createRoom,
    pushToFirebase: function(firebaseUrl, userToken, userMessage){
      _pushToFirebase(firebaseUrl, userToken, userMessage)
    },
  }

}())


