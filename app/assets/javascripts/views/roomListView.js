function RoomListView(domSelectors){
  this.roomList = domSelectors["roomList"]
  this.roomListTemplate = domSelectors["room-list-template"]
}

RoomListView.prototype = {
  drawRoomList: function(roomList){
     var source   = $("#room-template").html();
     var template = Handlebars.compile(source);
     $(".room-list").html(template(json));
  }
}