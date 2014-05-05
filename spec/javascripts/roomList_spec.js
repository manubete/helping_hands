describe("RoomList Thing", function(){

  //x makes the test pending
  xit("should access data from Firebase", function(){

  });

  xit("should return the rooms in Firebase", function(){
    var roomList = new RoomList()
    var rooms = roomList.returnRooms( database )
    expect(rooms).toEqual( ['room1', 'room2', 'skippers'] )
  });
})