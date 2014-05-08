var userFactory = (function(){
  //'this' is Window
  self = this;

  var _success = function(position){
    _createUserInfo(position.coords.latitude, position.coords.longitude)
    PolarBear.fireRoomListEvents()
  }

  var _createUserInfo = function(userLatitude, userLongitude){
    self.userValue = { userToken: _createUserToken(),
                       userLatitude: userLatitude,
                       userLongitude: userLongitude }
  }

  var _getUserValue = function(valueToFind) {
    var value = self.userValue[valueToFind]
    return value
  }

  var _createUserToken = function(possible){
    var text = "";
    var possible = possible || "ABCDEFGHIJKLMNOPQRSTUVWX YZabcdefghijklmnopqrstuvwxyz0123456789";
      for( var i=0; i < 15; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    return text;
  }

  var _failure = function(position) {
    return "Sorry, we couldn't find you"
  }

  var _defaultOps = {
    enableHighAccuracy: true, timeout: 1000, maximumAge: 0
  }

  return {
    success: _success,
    failure: _failure,
    defaultOps: _defaultOps,
    getUserValue: _getUserValue

  }

}())