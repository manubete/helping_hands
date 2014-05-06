RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
    $(document).on('gotFirebaseRoomsData', this.summonRooms.bind(this) )
    $('.room-list').on("click", ".individual_room", this.handleUserRoomAssignment.bind(this))

    $('#create_room').on("click", function() {
      this.sendUserToChatroom(firebaseHelper.createRoom())
    }.bind(this))
  },

  summonRooms: function(){
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  },
  getInfoFromChatroom: function(roomPath){
    firebaseHelper.getFirebaseUserLocations(roomPath)
  },
  sendUserToChatroom: function(roomPath){
    var firebaseRoomUrl = BASE_URL + roomPath
    $.event.trigger("readyToMakeRoom", firebaseRoomUrl)
  },
  sendInfoToChatRoom: function(roomPath) {
    firebaseHelper.createFirebaseUserLocations({
      roomPath: roomPath
    })
  },
  handleUserRoomAssignment: function() {
    var $room = $(event.target)
    var chatroom = $room.data('id')

    this.getInfoFromChatroom(chatroom);
    if (Object.userLocations < 3) {
      this.sendInfoToChatRoom(chatroom);
    }
    this.sendUserToChatroom(chatroom)
  }

}

// when we send information to the firebase, we also need to get previous room information back.
// lets create a custom event when asking for the firebase data, trigger it once we've gotten it. and
// listen for it in the chatrooms controller.