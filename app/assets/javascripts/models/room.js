function RoomList(name) {
  this.dataRef = new Firebase(BASE_URL);
  this.dataRef.on('value', this.returnDatabase.bind(this));
}

RoomList.prototype = {
  returnDatabase: function( snapshot ){
    console.log(this)
   this.database = snapshot.val()
  }
}