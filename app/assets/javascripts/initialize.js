BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
$('document').ready( function(){
  PolarBear.initialize()
} );

PolarBear = {
  initialize: function(){
    // makes sure the asynchronous call comes back

    this.checkGeoLocation()

    // this.prepareMVC()
  },
  checkGeoLocation: function(){
   // if ("geolocation" in navigator)
       if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(geoHelper.success, geoHelper.failure, geoHelper.defaultOps)
    } else {
      console.log("the fails")
    }
  },
  prepareMVC: function(){
    var roomListDomSelectors = {
      roomList: '.room-list',
      roomListTemplate: '#room-list-template'
    }
    var roomListView = new RoomListView(roomListDomSelectors)
    var roomList = new RoomList()
    console.log( roomList )
    var roomListController = new RoomListController(roomList, roomListView)
    roomListController.summonRooms()
  }
}