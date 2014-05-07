ChatRoomApp.Room = function(chatRoomUrl, roomPath){
  this.chatRoomUrl = chatRoomUrl
  this.firebaseServer = firebaseHelper.createFireBase(chatRoomUrl)
  this.assignUserToRoom(chatRoomUrl, roomPath)
}

ChatRoomApp.Room.prototype = {
  assignUserToRoom: function(chatRoomUrl, roomPath){
    firebaseHelper.setUserToRoom(chatRoomUrl, roomPath)
  }
}