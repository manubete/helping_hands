//  Needs to split up into different files for MVC

function RoomController(model, view){
  this.model = model
  this.view = view
}

RoomController.prototype = {

}

////////

function Room(chatRoomUrl){
  this.chatRoomUrl = chatRoomUrl
  //NEED TO ADD IN LOCATION OF ROOM
}

Room.prototype = {

}

//////////

function RoomView(roomDomSelectors){
  this.messageInput = roomDomSelectors["messageInput"]
}

RoomView.prototype = {

}