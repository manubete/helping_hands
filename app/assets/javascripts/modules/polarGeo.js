var geoHelper = (function(){
  var _calculateDistance = function distance(lat1, lon1, lat2, lon2) {
    var radlat1 = Math.PI * lat1/180
    var radlat2 = Math.PI * lat2/180
    var radlon1 = Math.PI * lon1/180
    var radlon2 = Math.PI * lon2/180
    var theta = lon1-lon2
    var radtheta = Math.PI * theta/180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
    var dist = Math.acos(dist)
    var dist = dist * 180/Math.PI
    var dist = dist * 60 * 1.1515
    return dist
  }

  var _parseRoomsToDisplayEligibleRooms = function() {
    roomListFirebaseObject = firebaseHelper.createFireBase(BASE_URL + ROOM_LIST_PATH)
    var roomListJson = firebaseHelper.getFirebaseValue(roomListFirebaseObject)
    var roomNames = Object.keys(roomListJson)
    var roomLocationArray = _getRoomLocations(roomNames)

    var eligibleRoomsArray = []
    for (var i = 0; i < roomLocationArray.length; i++){
      if (_roomIsEligible(roomLocationArray[i])) {
        eligibleRoomsArray.push(roomLocationArray[i])
      }
    }
    return eligibleRoomsArray

  }

  var _roomIsEligible = function(roomObject) {
    var userLocation = [cookieFactory.getValue('user-Latitude'), cookieFactory.getValue('user-Longitude')]
    var roomLocation = [roomObject['roomLatitude'], roomObject['roomLongitude']]

    //Return _inRange
    if (_inRange(userLocation, roomLocation)) {
      return true
    } else {
      return false
    }
  }

  var _getRoomLocations = function(roomNames) {
    var roomLocationArray = []
    for (var i = 0; i < roomNames.length; i++){
      var roomLatitude = _getRoomLatitude(roomNames[i])
      var roomLongitude = _getRoomLongitude(roomNames[i])
      roomLocationArray.push({name: roomNames[i], roomLatitude: roomLatitude, roomLongitude: roomLongitude})
    }
    return roomLocationArray
  }

  var _getRoomLatitude = function(roomName) {
    var roomLatitudeUrl = BASE_URL + ROOM_LIST_PATH + roomName + '/location/latitude'
    var roomLatitudeFirebase = firebaseHelper.createFireBase(roomLatitudeUrl)
    var latitude = firebaseHelper.getFirebaseValue(roomLatitudeFirebase)

    return latitude
  }

  var _getRoomLongitude = function(roomName) {
    var roomLongitudeUrl = BASE_URL + ROOM_LIST_PATH + roomName + '/location/longitude'
    var roomLongitudeFirebase = firebaseHelper.createFireBase(roomLongitudeUrl)
    var longitude = firebaseHelper.getFirebaseValue(roomLongitudeFirebase)

    return longitude
  }

  var _inRange = function (location1, location2) {

    var acceptable_range = .5 // this is the range variable to set

    var lat1 = location1[0]
    var lat2 = location2[0]
    var lon1 = location1[1]
    var lon2 = location2[1]

    var distance = _calculateDistance(lat1, lon1, lat2, lon2)

    if (distance < acceptable_range){
      return true
    } else {
      return false
    }

  }

  var _default = { enableHighAccuracy: true, timeout: 1000, maximumAge: 0}
  var _success = function(position){
      cookieFactory.createCookie(position.coords.latitude, position.coords.longitude)
  }
  var _failure = function(position){ return "Sorry, we couldn't find you" }


  return {
    failure: _failure,
    success: _success,
    defaultOps: _default,
    calculateDistance: _calculateDistance,
    inRange: _inRange,
    parseRoomsToDisplayEligibleRooms: _parseRoomsToDisplayEligibleRooms
  }
}())

















