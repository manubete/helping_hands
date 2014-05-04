function RoomListController(model, view){
  this.model = model
  this.view = view
}

RoomListController.prototype = {
  listeners: function(){
    console.log('listening to custom event')
    $(document).on('gotData', this.summonRooms.bind(this) )
    $(document).on('gotData', this.linkRooms())
  },
  summonRooms: function(){
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  },
  linkRooms: function() {
    debugger
    $('.individual_room').on('click', function(event) {
      var roomPath = $(event.target).data("id")


      // this is the room the user chose.
      // this is where we want to store the users
      // messages
      BASE_URL + roomPath
    })
  }

}