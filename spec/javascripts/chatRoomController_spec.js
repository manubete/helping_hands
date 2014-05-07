describe("chatRoomController", function(){

   var roomDomSelectors = {
      room: '.room',
      roomTemplate: '#room-template'
    }

    // Instantiates a room, model and controller
    var roomView = new ChatRoomApp.RoomView(roomDomSelectors)
    var room = new ChatRoomApp.Room('https://luminous-fire-2873.firebaseio.com/jasmine_room')
    var roomController = new ChatRoomApp.RoomController(room, roomView)


  it("chatRoom Controller has a chatRoom model", function(){
    expect(roomController.model).toEqual(room)
  })


  it("chatRoom Controller has a chatRoom view", function(){
    expect(roomController.view).toEqual(roomView)
  })
  //assert template using the show route


})