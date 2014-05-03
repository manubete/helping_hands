function RoomView(domSelectors){
  this.roomList = domSelectors["roomList"]

}

RoomView.prototype = {
  drawRoom: function(json){
     var source   = $("#room-template").html();
     var template = Handlebars.compile(source);
     $(".room-list").html(template(json));
  }
}