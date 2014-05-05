RoomListApp.RoomList = function(name){
  console.log('creating cusom event...')
  new CustomEvent('gotData')
  this.dataRef = new Firebase(BASE_URL);
  this.dataRef.on('value', this.returnDatabase.bind(this));
}

RoomListApp.RoomList.prototype = {
  returnDatabase: function( snapshot ){
   this.database = snapshot.val()
   console.log('triggering custom event...')
   $.event.trigger('gotData')
  },
  returnRooms: function( fireBaseData ){
    var roomNames = Object.keys( fireBaseData)
    var roomArray = []
    for(var i = 0; i < roomNames.length; i++){
      roomArray.push({name: roomNames[i]})
    }
    return roomArray
  }
}
