$('document').ready(function(){
  BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'

  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(geoHelper.success, geoHelper.failure, geoHelper.defaultOps)
  } else {
    console.log("the fails") // BUGBUG
  }


  dataRef = new Firebase(BASE_URL);
  var helper = function(snapshot) {
    snapshot.val();
  }
  thing = dataRef.on('value', helper)

  // room = new Room('skippers')
  // var roomLinker = new RoomLinker
  // roomLinker.bindButtons()
});
