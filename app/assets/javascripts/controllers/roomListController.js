RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
    $(document).on('gotFirebaseRoomsData', this.summonRooms.bind(this) )
    $('.room-list').on("click", function(e) {
      if ($(event.target) && $(event.target).hasClass("individual_room")) {
        this.sendInfoToChatRoom($(event.target).data('id'));
        firebaseHelper.createFirebaseUserLocations({
          roomPath: $(event.target).data('id'),
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