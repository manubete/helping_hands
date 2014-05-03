describe("RoomList Thing", function(){

  xit("should access data from Firebase", function(){

  });

  it("should return the rooms in Firebase", function(){
    var roomList = new RoomList()
    var rooms = roomList.returnRooms( database )
    expect(rooms).toEqual( ['room1', 'room2', 'skippers'] )
  });
})