function RoomListController(model, view){
  this.model = model
  this.view = view
}

RoomListController.prototype = {
  listeners: function(){
    console.log('listening to custom event')
    $(document).on('gotData', this.summonRooms.bind(this) )
  },
  summonRooms: function(){
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  },

}