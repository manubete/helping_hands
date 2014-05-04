//  Needs to split up into different files for MVC

RoomController = function(model, view){
  this.model = model
  this.view = view
}

RoomController.prototype = {
    drawRoom: function(roomName){
        this.view.drawChatRoom(roomName)
    },
    bindMessageListeners: function(){
      self = this;
     $("#messageInput").keypress(function (e){
        if (e.keycode == 13){
          var name = $('#nameInput').val();
          var text = $("#messageInput").val();
          firebaseHelper.pushToFirebase(self.model.chatRoomUrl, name, text);
          $("#messageInput").val('');
        }
     });

    self.model.firebaseServer.limit(10).on('child_added', function (snapshot){
        var message = snapshot.val();
        $('<div>').text(message.text).prepend($('<em/>')
          .text(message.name+':')).appendTo($('#messagesDiv'));
        debugger
        $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
      });

    }

}

//////

function Room(chatRoomUrl){
  this.chatRoomUrl = chatRoomUrl
  this.firebaseServer = new Firebase(this.chatRoomUrl)
  //this.chatRoomPosition = cookieFactory.readInfo
}

Room.prototype = {

}

//////////

// function RoomView(roomDomSelectors){
//   this.messageInput = roomDomSelectors["messageInput"]
// }

function RoomView(domSelectors){
  this.room = domSelectors["room"]
  this.roomTemplate = domSelectors["room-template"]
}

RoomView.prototype = {
  drawChatRoom: function(roomName){
       var roomName = roomName
       $.ajax({
        type: 'get',
        url:'/room/1',
        dataType: "text"
       }).done(function(data){
          var template = Handlebars.compile(data)
          $(".individual_room").remove()
          $(".room-list").add("div").addClass("room");
          $(".room").html(template(roomName))
       })
    }

}