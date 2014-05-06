RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
    $(document).on('gotFirebaseRoomsData', this.summonRooms.bind(this) )
    $('.room-list').on("click", ".individual_room", this.handleUserRoomAssignment.bind(this))

    $('#create_room').on("click", function() {
      this.sendInfoToChatRoom(firebaseHelper.createRoom())
    }.bind(this))
  },

  summonRooms: function(){
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  },
  getInfoFromChatroom: function(roomPath){
    firebaseHelper.getFirebaseUserLocations(roomPath)
  },
  sendInfoToChatRoom: function(roomPath) {
    var firebaseRoomUrl = BASE_URL + roomPath

    console.log($.event.trigger("readyToMakeRoom", firebaseRoomUrl))

    firebaseHelper.createFirebaseUserLocations({
      roomPath: roomPath,
      userToken: cookieFactory.getValue('user-token')
    })
  },
  handleUserRoomAssignment: function() {
    var chatroom = $(event.target).data('id')
    this.sendInfoToChatRoom(chatroom);
    this.getInfoFromChatroom(chatroom);
  }

}

// when we send information to the firebase, we also need to get previous room information back.
// lets create a custom event when asking for the firebase data, trigger it once we've gotten it. and
// listen for it in the chatrooms controller.