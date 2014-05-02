var geoHelper = (function(){
  var _default = { enableHighAccuracy: true, timeout: 1000, maximumAge: 0}
  var _success = function(position){
      $.ajax({
        url: '/users',
        type: 'POST',
        data: { lat: position.coords.latitude, lon: position.coords.longitude }
      })
      .done(function(){console.log("ajax was goooood")}) //BUGBUG
      .fail(function(){console.log("ajax was baaaaaad")}) //BUGBUG
  }
  var _failure = function(position){console.log("geo failed")} //BUGBUG

  return {
    failure: _failure,
    success: _success,
    defaultOps: _default
  }
}())
