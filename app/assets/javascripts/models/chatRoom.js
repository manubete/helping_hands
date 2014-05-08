ChatRoomApp.Room = function(chatRoomUrl, roomPath){
  this.chatRoomUrl = chatRoomUrl
  this.firebaseServer = firebaseHelper.createFireBase(chatRoomUrl)
  this.assignUserToRoom(chatRoomUrl, roomPath)
}

ChatRoomApp.Room.prototype = {
  assignUserToRoom: function(chatRoomUrl, roomPath){
    firebaseHelper.setUserToRoom(chatRoomUrl, roomPath)
  },
  randomizeColor: function(){
    var colors = ["pink", "purple", "blue", "orange", "green", "moss", "brown", "dark-purple", "light-blue", "grey"]
    this.color = colors[Math.floor(Math.random()*colors.length)];
  }
}