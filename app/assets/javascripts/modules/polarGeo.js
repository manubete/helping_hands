var geoHelper = (function(){
  var _randomizeString = function() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for( var i=0; i < 15; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
  }

  var _default = { enableHighAccuracy: true, timeout: 1000, maximumAge: 0}
  var _success = function(position){
      document.cookie = _randomizeString()
      $.ajax({
        url: '/users',
        type: 'POST',
        data: { username: document.cookie, lat: position.coords.latitude, lon: position.coords.longitude }
      })
      .done(function(){console.log("ajax was goooood")}) //BUGBUG
      .fail(function(){console.log("ajax was baaaaaad")}) //BUGBUG
  }
  var _failure = function(position){ return "Sorry, we couldn't find you" }




  return {
    failure: _failure,
    success: _success,
    defaultOps: _default,
    randomizeString: _randomizeString
  }
}())




