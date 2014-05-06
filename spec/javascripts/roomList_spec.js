describe("RoomList Thing", function(){

  stub_model = 'stub_model'
  stub_view = 'stub_view'

  roomListController = new RoomListApp.RoomListController(stub_model, stub_view)

  xit("should return the rooms in Firebase", function(){
    var roomList = new RoomListApp.RoomList()
    var rooms = roomList.returnRooms( dummyFirebaseDatabase )
    expect(rooms).toEqual( [{ name : 'Carey1' }, { name : 'Gregg3' }, { name : 'roomQuarterMileAway' }, { name : 'room_list' }, { name : 'skippers' }, { name : 'IndiaRoom' }, { name : 'Rosalia2' }, { name : 'Abelardo2' }, { name : 'sanJoseRoom' }, { name : 'Izabella5' }])
  });

  xit("expect parseRoomsToDisplayEligibleRooms to be called after calling summonRooms", function(){

    spyOn(roomListController, 'summonRooms');
    expect(geoparseHelper.parseRoomsToDisplayEligibleRooms).toHaveBeenCalled();
  })

  xit("should access data from Firebase", function(){

  });

  xit("should return the rooms in Firebase", function(){
    var roomList = new RoomList()
    var rooms = roomList.returnRooms( database )
    expect(rooms).toEqual( ['room1', 'room2', 'skippers'] )
  });

})
