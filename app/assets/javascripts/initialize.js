$('document').ready( function(){
  BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
  PolarBear.initialize()
  room = new RoomList()
} );

PolarBear = {
  initialize: function(){
    this.checkGeoLocation()
  },
 checkGeoLocation: function(){
  if ("geolocation" in navigator){
    navigator.geolocation.getCurrentPosition(geoHelper.success, geoHelper.failure, geoHelper.defaultOps)
  } else {
    console.log("the fails")
  }
 }
}