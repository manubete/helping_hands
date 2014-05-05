describe("RoomList Thing", function(){

  it("should return the rooms in Firebase", function(){
    var roomList = new RoomListApp.RoomList()
    var rooms = roomList.returnRooms( dummyFirebaseDatabase )
    expect(rooms).toEqual( [{ name : 'Carey1' }, { name : 'Gregg3' }, { name : 'roomQuarterMileAway' }, { name : 'room_list' }, { name : 'skippers' }, { name : 'IndiaRoom' }, { name : 'Rosalia2' }, { name : 'Abelardo2' }, { name : 'sanJoseRoom' }, { name : 'Izabella5' }])
  });
})