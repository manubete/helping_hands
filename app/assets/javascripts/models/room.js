function RoomList(name) {
  this.users = BASE_URL + name + '/'
  this.base = new Firebase(BASE_URL);
}

RoomList.prototype = {
  all: function(){
    var rooms = new Firebase(BASE_URL);
    this.roomList = rooms.on('value', function(snapshot){ return snapshot.val() })
  }
}