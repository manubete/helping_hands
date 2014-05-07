describe("chatRoomList Model", function(){

  var chatRoomUrl = 'https://luminous-fire-2873.firebaseio.com/jasmine_room'
    var chatRoom = new ChatRoomApp.Room(chatRoomUrl)

  it("ChatRoom Models have a url", function(){
    expect(chatRoom.chatRoomUrl).toEqual(chatRoomUrl)
  })

    it("ChatRoom Models have a firebase server object", function(){
    expect(typeof chatRoom.firebaseServer).toEqual("object")
  })

})