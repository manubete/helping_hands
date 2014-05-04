BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
$('document').ready( function(){
  PolarBear.initialize()
} );

PolarBear = {
  initialize: function(){
    this.checkGeoLocation()
    this.prepareMVC()
  },
  checkGeoLocation: function(){
    if ("geolocation" in navigator){
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
    var roomListController = new RoomListController(roomList, roomListView)
    roomListController.listeners()
  }
}