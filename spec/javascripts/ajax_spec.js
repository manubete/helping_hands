describe("Ajax functionality", function(){

  var roomListDomSelectors = {
      roomList: '.room-list',
      roomListTemplate: '#room-list-template'
    }

  var configuration = { type: 'get',
                        url: '/room_list',
                        dataType: 'text'
                      };

  var roomListView = new RoomListApp.RoomListView(roomListDomSelectors);
  roomList = ['']

  xit("should make an Ajax request to the correct URL", function(){
    spyOn($, "ajax");
    roomListView.drawRoomList(roomList);
    expect($.ajax.mostRecentCall.args[0]["url"]).toEqual(configuration.url)
  });
})