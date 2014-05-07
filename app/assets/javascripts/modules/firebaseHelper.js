var firebaseHelper = (function() {
  var _createFireBase = function(firebaseUrl) {
    var newFirebase = new Firebase(firebaseUrl)
    return newFirebase
  }

  var _getFirebaseValue = function(firebaseObject) {
    var val;
    firebaseObject.on('value', function(snapshot) {
      val = snapshot.val()
    })
    return val
  }

  var _updateFireBase = function(firebaseUrl, options) {
    var firebaseRoom = new Firebase(firebaseUrl)
    firebaseRoom.set({latitude: options.latitude, longitude: options.longitude})
  }

  var _createRoom = function() {
    var roomPath = _makeRoomName()
    var newRoomUrl = BASE_URL + roomPath
    var newRoom = new Firebase(newRoomUrl)

    var roomsLatitude = new Firebase(ROOM_LIST_PATH + roomPath + '/location/latitude')
    var roomLat = cookieFactory.getValue("user-Latitude");
    roomsLatitude.set(Number(roomLat))

    var roomsLongitude = new Firebase(ROOM_LIST_PATH + roomPath + '/location/longitude')
    var roomLong = cookieFactory.getValue("user-Longitude");
    roomsLongitude.set(Number(roomLong))

    var availableIconsUrl = ROOM_LIST_PATH + roomPath + '/available_icons'
    var availableIconsFirebase = new Firebase(availableIconsUrl)
    availableIconsFirebase.set({user1: 'red', user2: 'blue', user3: 'purple', user4: 'green', user5: 'pink'})

    return roomPath
  }

  var _makeRoomName = function() {
    var randomName = Faker.Name.firstName() + Math.floor((Math.random() * 10) + 1);
    return randomName
  }

  var _pushToFirebase = function(firebaseUrl, userMessage){
    var self = this;
    var chatRoom = new Firebase(firebaseUrl)
    chatRoom.push({userColor: self.userColor, message: userMessage})
  }

  var _bindChatWindowButtons = function(firebaseServer) {
    var self = this;
    var chatRoom = firebaseServer
    chatRoom.limit(10).on('child_added', function (snapshot) {
      var message = snapshot.val();
      $('<div class="elevencol">').text(self.userColor+': '+message.message).fadeIn().appendTo($('#messagesDiv'));
      $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
    })
  }
  // testin this function. add it to a basicHelper module?
  Object.size = function(obj) {
      var size = 0, key;
      for (key in obj) {
          if (obj.hasOwnProperty(key)) size++;
      }
      return size;
  };

  var _createFirebaseUserLocations = function(fbInfo) {
    var userLatLong = cookieFactory.getUserLocation()
    var fireBasePath = BASE_URL + '/room_list/' + fbInfo.roomPath + "/user_locations"
    var userLocation = new Firebase( fireBasePath )
    userLocation.push(userLatLong)
  }

  var _getFirebaseUserLocations = function(room) {
    var fireBasePath = BASE_URL + '/room_list/' + room + "/user_locations"
    var usersLocation = new Firebase( fireBasePath )
    usersLocation.on('value', function(snapshot){
      $.event.trigger( 'gotLocations' , { userLocation: snapshot.val(), roomName: room } )
      Object.userLocations = snapshot.val()
    })
  }

  var _setUserToRoom = function(chatRoomUrl, roomPath){

    // Adds the user to the 'present users' list
    var userPresenceListUrl = ROOM_LIST_PATH + roomPath + '/presentUsers'
    var userPresenceFirebase = firebaseHelper.createFireBase(userPresenceListUrl)
    var justPushed = userPresenceFirebase.push({user_token: cookieFactory.getValue('user-token')})

    // Sets the user to be deleted from the 'presence' list when he disconnects
    var userId = justPushed.name()
    var userToDelete = new Firebase(userPresenceListUrl + '/' + userId)
    userToDelete.onDisconnect().remove()

    // Retrieves list of available user icons, comes in as a hash
    var availableIconsUrl = ROOM_LIST_PATH + roomPath + '/available_icons'
    var availableIconsFirebase = new Firebase(availableIconsUrl)
    var availableIconsHash = _getFirebaseValue(availableIconsFirebase)

    // Picks a random key from the hash
    var numberOfAvailableIcons = Object.size(availableIconsHash)
    var randomIndexInHash = Math.floor(Math.random() * (numberOfAvailableIcons)+1);
    var identifiedKeyInHash = 'user' + randomIndexInHash
    var colorForUser = availableIconsHash[identifiedKeyInHash]
    this.userColor = colorForUser

    // Identify the key in the hash and make a firebase reference to it
    var usersKeyUrl = availableIconsUrl + '/' + identifiedKeyInHash
    var usersKeyFirebase = new Firebase(usersKeyUrl)

    // Delete that element from the hash since the user is chatting
    usersKeyFirebase.remove()

    // When he disconnects, add it back to the hash
    usersKeyFirebase.onDisconnect().set(colorForUser)
  }

  var _getUserCount = function(roomName){
    var userPresenceListUrl = ROOM_LIST_PATH + roomName + '/presentUsers'
    var userPresenceFirebase = firebaseHelper.createFireBase(userPresenceListUrl)
    var userCount = Object.size(_getFirebaseValue(userPresenceFirebase))
    return userCount
  }

  return {
    createFireBase: _createFireBase,
    createRoom: _createRoom,
    getFirebaseValue: _getFirebaseValue,
    pushToFirebase: _pushToFirebase,
    updateFireBase: _updateFireBase,
    bindChatWindowButtons: _bindChatWindowButtons,
    setUserToRoom: _setUserToRoom,
    createFirebaseUserLocations: _createFirebaseUserLocations,
    getFirebaseUserLocations: _getFirebaseUserLocations,
    getUserCount: _getUserCount
  }
}())
