BASE_URL = 'https://luminous-fire-2873.firebaseio.com/'
ROOM_LIST_PATH = BASE_URL + 'room_list/'


$('document').ready( function(){
  PolarBear.initialize()
} );

PolarBear = {
  initialize: function(){

    //makes a landing page that fades off on geosuccess
     this.landingPage()
    // makes sure the asynchronous call comes back
    this.checkGeoLocation()


     // rebinding stuff based on gedata success
     $(document).on('geoDataReceived', this.indexPage.bind(this) )
     $(document).on('geoDataReceived', this.bindRoomListener.bind(this) )
     $(document).on('geoDataReceived', this.prepareRoomListMVC.bind(this) )

  },
   landingPage: function(){
    console.log("landing page")
    // changing the room list class so it fits the landing page
    $('section').removeClass('room-list').addClass('room-list-landing')

    // changing the create room button class so it fits the landing page
    $('.create-room').removeClass('create-room').addClass('create-room-landing')

    //change the logo class so it fits the landing page
    $('.logo').removeClass('logo').addClass('logo-landing')

    //add the motto
    jQuery('<section/>', {
    id: 'motto',
    rel: 'external',
    text: 'PolarBear, big enough to break the Ice'
}).appendTo('.room-list-landing');

  },
  indexPage: function(){
    console.log("index page")
    // changing the room list class so it fits the index page
    $('section').removeClass('room-list-landing').addClass('room-list')

    // changing the create room button class so it fits the index page
    $('.create-room-landing').removeClass('create-room-landing').addClass('create-room')

    //change the logo class so it fits the index page
    $('.logo-landing').removeClass('logo-landing').addClass('logo')

    //remove the motto
    $('#motto').remove()

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
