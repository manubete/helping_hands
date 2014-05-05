var firebaseHelper = (function() {
  var _createFireBase = function(firebaseUrl) {
    var newFirebase = new Firebase(firebaseUrl)
    return newFirebase
  }

  var _createRoom = function() {
    var roomPath = _makeRoomName()
    var newRoomUrl = BASE_URL + roomPath
    var newRoom = new Firebase(newRoomUrl)

    var roomsLatitude = new Firebase(BASE_URL + ROOM_LIST_PATH + roomPath + '/location/latitude')
    var roomLat = cookieFactory.getValue("user-Latitude");
    roomsLatitude.set(Number(roomLat))

    var roomsLongitude = new Firebase(BASE_URL + ROOM_LIST_PATH + roomPath + '/location/longitude')
    var roomLong = cookieFactory.getValue("user-Longitude");
    roomsLongitude.set(Number(roomLong))

    return roomPath
  }

  var _makeRoomName = function() {
    var randomName = Faker.Name.firstName() + Math.floor((Math.random() * 10) + 1);
    return randomName
  }


  var _pushToFirebase = function(firebaseUrl, userToken, userMessage){
    var chatRoom = new Firebase(firebaseUrl)
    chatRoom.push({user_token: cookieFactory.getValue('user-token'), message: userMessage})
  }

  var _bindChatWindowButtons = function(firebaseServer) {
    var chatRoom = firebaseServer
    chatRoom.limit(10).on('child_added', function (snapshot) {
      var message = snapshot.val();
      $('<div>').text(message.user_token+': '+message.message).fadeIn().appendTo($('#messagesDiv'));
      $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
    })
  }
  var _createFirebaseUserLocations = function(fbInfo) {
    var userLatLong = cookieFactory.getUserLocation()
    var fireBasePath = BASE_URL + '/room_list/' + fbInfo.roomPath + "/user_locations"
    var userLocation = new Firebase( fireBasePath )
    userLocation.push(userLatLong)
  }


  return {
    createFireBase: _createFireBase,
    createRoom: _createRoom,
    pushToFirebase: _pushToFirebase,
    bindChatWindowButtons: _bindChatWindowButtons,
    createFirebaseUserLocations: _createFirebaseUserLocations
  }

}())


