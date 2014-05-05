//  Needs to split up into different files for MVC

RoomController = function(model, view){
  this.model = model
  this.view = view
  new CustomEvent('gotData')
}

RoomController.prototype = {
  drawRoom: function(roomName){
    self = this
    console.log("creating custom chatroom drawn event")
    this.view.drawChatRoom(roomName);
    $(document).on('ajax-back', this.bindMessageListeners.bind(this) )


  },
  bindMessageListeners: function(){
    self = this;
   $(document).bind('keypress',pressed);

   function pressed(e){
      if (e.keyCode == 13){
        var name = $('#nameInput').val();
        var text = $("#messageInput").val();

        firebaseHelper.pushToFirebase(self.model.chatRoomUrl, name, text);
        $("#messageInput").val('');
       }
   };

    self.model.firebaseServer.limit(10).on('child_added', function (snapshot){
      var message = snapshot.val();
      $('<div>').text(message.text).prepend($('<em/>')
        .text(message.user_token+': '+message.message)).appendTo($('#messagesDiv'));
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
function RoomView(domSelectors){
  this.room = domSelectors["room"]
  this.roomTemplate = domSelectors["room-template"]
}

RoomView.prototype = {
  drawChatRoom: function(roomName){
       var roomName = roomName
       self = this
       $.ajax({
        type: 'get',
        url:'/room/1',
        dataType: "text"
       }).done(function(data){
          var template = Handlebars.compile(data)
          $(".room-list").html(template(roomName));
          $(".room-list").attr("class", "chatroom");
          console.log("sup")
          $.event.trigger("ajax-back")
       })
    }

}