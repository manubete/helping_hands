RoomListApp.RoomList = function(name){
  new CustomEvent('gotFirebaseRoomsData')
  this.roomListFromFirebase = firebaseHelper.createFireBase(BASE_URL + ROOM_LIST_PATH);
  this.roomListFromFirebase.on('value', this.returnDatabase.bind(this));
}

RoomListApp.RoomList.prototype = {
  returnDatabase: function( snapshot ){
   this.database = snapshot.val()
   $.event.trigger('gotFirebaseRoomsData')
  },
<<<<<<< HEAD
  returnRooms: function( fireBaseData ){
    var roomNames = Object.keys( fireBaseData)
=======
  returnRooms: function( fireBaseRoomsData){
    var roomNames = Object.keys(fireBaseRoomsData)
>>>>>>> modified firebase nesting structure
    var roomArray = []
    for(var i = 0; i < roomNames.length; i++){
      roomArray.push({name: roomNames[i]})
    }
    return roomArray
  }
}

