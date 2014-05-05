ChatRoomApp.Room = function(chatRoomUrl){
  this.chatRoomUrl = chatRoomUrl
  this.firebaseServer = firebaseHelper.createFireBase(chatRoomUrl)
}

ChatRoomApp.Room.prototype = {

}