RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
    $(document).on('gotFirebaseRoomsData', this.summonRooms.bind(this) )
    $('.room-list').on("click", function(e) {
      var chatroom = $(event.target).data('id')
      if ($(event.target) && $(event.target).hasClass("individual_room")) {
        this.sendInfoToChatRoom(chatroom);

        firebaseHelper.getFirebaseUserLocations(chatroom)

        firebaseHelper.createFirebaseUserLocations({
          roomPath: chatroom,
          userToken: cookieFactory.getValue('user-token')
        })
      }
    }.bind(this))

    $('#create_room').on("click", function() {
      this.sendInfoToChatRoom(firebaseHelper.createRoom())
    }.bind(this))
  },

  summonRooms: function(){
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  },

  sendInfoToChatRoom: function(roomPath) {
    var firebaseRoomUrl = BASE_URL + roomPath
    $.event.trigger("readyToMakeRoom", firebaseRoomUrl)
  }
}