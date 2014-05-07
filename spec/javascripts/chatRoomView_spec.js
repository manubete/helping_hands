describe("chatRoomView", function(){

  var roomDomSelectors = {
      room: '.room',
      roomTemplate: '#room-template'
    }

  var chatRoomView = new ChatRoomApp.RoomView(roomDomSelectors)

    it("ChatRoom View has a room DOM selector", function(){
      expect(chatRoomView.room).toEqual('.room')
    })

     it("ChatRoom View has a roomTemplate DOM selector", function(){
      expect(chatRoomView.roomTemplate).toEqual('#room-template')
    })



  })