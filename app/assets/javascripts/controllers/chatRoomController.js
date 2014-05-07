ChatRoomApp.RoomController = function(model, view){
  this.model = model
  this.view = view
}

ChatRoomApp.RoomController.prototype = {
  drawRoom: function(roomName){
    this.view.drawChatRoom(roomName);
    $(document).on('ajax-back', this.bindMessageListeners.bind(this) )
  },
  bindMessageListeners: function(){
   var self = this;
   $(document).bind('keypress',pressed);

   function pressed(e){
      if (e.keyCode == 13){
        var text = $("#messageInput").val();
        firebaseHelper.pushToFirebase(self.model.chatRoomUrl, text);
        $("#messageInput").val('');
       }
   };

   firebaseHelper.bindChatWindowButtons(self.model.firebaseServer)
  },

}
