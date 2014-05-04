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

      //   $(document).on('.ajax-back', function(e) {
      //     if ($(document).hasClass("ajax-check")) {
      //     console.log("it lives")
      //     }
      //   });
      // }

        // $(document).on('ajax-back', function() {console.log("it got triggered")} )
        $(document).on('ajax-back', this.bindMessageListeners.bind(this) )


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
          console.log("sup")
          $.event.trigger("ajax-back")


       })
    }

}