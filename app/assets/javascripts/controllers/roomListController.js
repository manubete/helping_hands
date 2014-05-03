function RoomListController(model, view){
  this.model = model
  this.view = view
}

RoomListController.prototype = {

  summonRooms: function(){
    debugger
    var rooms = this.model.returnRooms( this.model.database )
    this.view.drawRoomList(rooms)
  }
}