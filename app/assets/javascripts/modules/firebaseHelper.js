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

  return {
    createRoom: _createRoom
  }

}())


