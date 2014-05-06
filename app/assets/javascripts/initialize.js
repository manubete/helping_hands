BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
ROOM_LIST_PATH = BASE_URL + 'room_list/'

$('document').ready( function(){
  PolarBear.initialize()
} );

PolarBear = {
  initialize: function(){
    this.drawLandingPage()
    this.checkGeoLocation()
    this.fireRoomListEvents()
  },

  drawLandingPage: function(){
     $.ajax({
      type: 'get',
      url: '/landing_page',
      dataType: "text"
     }).done(function(data){
       $(".other_stuff").html(data)

     })
  },


  checkGeoLocation: function(){
    if(navigator.geolocation){
      navigator.geolocation.getCurrentPosition(geoHelper.success, geoHelper.failure, geoHelper.defaultOps)
    } else {
      console.log("the fails")
    }
  },

  fireRoomListEvents: function() {
    $(document).on("geoDataReceived", function(){
      this.bindRoomListener();
      this.prepareRoomListMVC()
    }.bind(this))
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
    var roomListView = new RoomListApp.RoomListView(roomListDomSelectors)
    var roomList = new RoomListApp.RoomList()
    var roomListController = new RoomListApp.RoomListController(roomList, roomListView)
    roomListController.listeners()
  },

  prepareRoomMVC: function(chatRoomUrl){
    var roomDomSelectors = {
      room: '.room',
      roomTemplate: '#room-template'
    }
    var roomView = new ChatRoomApp.RoomView(roomDomSelectors)
    var room = new ChatRoomApp.Room(chatRoomUrl)
    var roomController = new ChatRoomApp.RoomController(room, roomView)
    var roomName = {name: roomController.model.chatRoomUrl}
    roomController.drawRoom(roomName)

  }
}



