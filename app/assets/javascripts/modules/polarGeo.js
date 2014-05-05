var geoHelper = (function(){
  var _calculateDistance = function distance(lat1, lon1, lat2, lon2) {
    var radlat1 = Math.PI * lat1/180
    var radlat2 = Math.PI * lat2/180
    var radlon1 = Math.PI * lon1/180
    var radlon2 = Math.PI * lon2/180
    var theta = lon1-lon2
    var radtheta = Math.PI * theta/180
    var dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);
    dist = Math.acos(dist)
    dist = dist * 180/Math.PI
    dist = dist * 60 * 1.1515
    return dist

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
    inRange: _inRange
  }
}())




