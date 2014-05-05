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
    var roomListView = new RoomListApp.RoomListView(roomListDomSelectors)
    var roomList = new RoomListApp.RoomList()
    var roomListController = new RoomListApp.RoomListController(roomList, roomListView)
    roomListController.listeners()
  },

  prepareRoomMVC: function(chatRoomUrl){
    // Sets the labels of the chatRoom Dom elements
    var roomDomSelectors = {
      room: '.room',
      roomTemplate: '#room-template'
    }

    // Instantiates a room, model and controller
    var roomView = new ChatRoomApp.RoomView(roomDomSelectors)
    var room = new ChatRoomApp.Room(chatRoomUrl)
    var roomController = new ChatRoomApp.RoomController(room, roomView)


    //creates a JSON object to insert a name into the room
     var roomName = {name: roomController.model.chatRoomUrl}

     // draw the room
    roomController.drawRoom(roomName)

  }
}