RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
<<<<<<< HEAD
    self = this;
    console.log('listening to custom event')
=======
>>>>>>> User can see roomlist and click on individual rooms. User can post messages.

    $(document).on('gotData', this.summonRooms.bind(this) )

    $('.room-list').on("click", function(e) {
      if ($(event.target) && $(event.target).hasClass("individual_room")) {
<<<<<<< HEAD
        self.sendInfoToChatRoom($(event.target).data('id'));
      }
    })
=======
        this.sendInfoToChatRoom($(event.target).data('id'));
      }
    }.bind(this))
>>>>>>> User can see roomlist and click on individual rooms. User can post messages.
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