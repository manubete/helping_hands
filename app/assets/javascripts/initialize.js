BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
$('document').ready( function(){
  PolarBear.initialize()
} );

PolarBear = {
  initialize: function(){
    // makes sure the asynchronous call comes back

    this.checkGeoLocation()
    // this.prepareMVC()
    this.bindRoomListener();
    this.prepareRoomListMVC()
  },
  checkGeoLocation: function(){
   // if ("geolocation" in navigator)
       if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(geoHelper.success, geoHelper.failure, geoHelper.defaultOps)
    } else {
      console.log("the fails")
    }
  },
  bindRoomListener: function() {
    var self = this;
    new CustomEvent('readyToMakeRoom', {'chatRoomUrl': ''})
    $(document).on('readyToMakeRoom', function(event, chatRoomUrl) {
      self.prepareRoomMVC(chatRoomUrl)
    })

  },
  prepareRoomListMVC: function(){
    var roomListDomSelectors = {
      roomList: '.room-list',
      roomListTemplate: '#room-list-template'
    }
    var roomListView = new RoomListView(roomListDomSelectors)
    var roomList = new RoomList()
    var roomListController = new RoomListController(roomList, roomListView)
    roomListController.listeners()
  },

  prepareRoomMVC: function(chatRoomUrl){
    var roomDomSelectors = {
      messageInput: '#message-input'

      //TEMPLATE
    }

    var roomView = new RoomView(roomDomSelectors)
    var room = new Room(chatRoomUrl)
    var roomController = new RoomController(room, roomView)
  }
}
