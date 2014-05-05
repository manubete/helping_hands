ChatRoomApp.RoomView = function (domSelectors){
  this.room = domSelectors["room"]
  this.roomTemplate = domSelectors["room-template"]
}

ChatRoomApp.RoomView.prototype = {
  drawChatRoom: function(roomName){
       var roomName = roomName
       self = this
       $.ajax({
        type: 'get',
        url:'/chatrooms/1',
        dataType: "text"
       }).done(function(data){
          var template = Handlebars.compile(data)
          $(".room-list").html(template(roomName));
          $("#create_room_button").html('');
          $(".room-list").attr("class", "chatroom");
          $.event.trigger("ajax-back")
       })
  }
}