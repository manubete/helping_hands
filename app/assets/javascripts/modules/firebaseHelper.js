var firebaseHelper = (function() {


  var _createRoom = function(userLocation) {
    var roomPath = geoHelper.randomizeString
    var newRoomUrl = BASE_URL + roomPath
    var newRoom = new Firebase(newRoomUrl)

    var roomsLocation = new Firebase(newRoomUrl+'/location')
    roomsLocation.push(userLocation);
    return newRoomUrl
  }

<<<<<<< HEAD

  var _pushToFirebase = function(firebaseUrl, userToken, userMessage) {
=======
  var _pushToFirebase = function(firebaseUrl, userToken, userMessage){
>>>>>>> User can see roomlist and click on individual rooms. User can post messages.
    var chatRoom = new Firebase(firebaseUrl)

    chatRoom.push({user_token: userToken, message: userMessage})
  }

  return {
    createRoom: _createRoom,
    pushToFirebase: _pushToFirebase
  }

}())


