RoomListApp.RoomListController = function(model, view){
  this.model = model
  this.view = view
}

RoomListApp.RoomListController.prototype = {
  listeners: function(){
    $(document).on('gotFirebaseRoomsData', this.summonRooms.bind(this) )
    $('.room-list').on("click", ".individual_room", this.handleUserRoomAssignment.bind(this))
    $(document).on('gotLocations', this.updateGeoLocation.bind(this))
    $('.room-list').on("click", '#create_room', function() {
      this.createChatRoom(firebaseHelper.createRoom())
    }.bind(this))
  },
  updateGeoLocation: function(e, eventData) {
    var firebaseUrl = ROOM_LIST_PATH + eventData.roomName + '/location'
    var objects = []
    for(var i in eventData.userLocation) {
      objects.push(eventData.userLocation[i])
    }
    var centroid = geoHelper.getCentroid(objects)
    firebaseHelper.updateFireBase(firebaseUrl, { latitude: centroid.latitude, longitude: centroid.longitude })
  },
  summonRooms: function(){
    var activeRooms = geoparseHelper.parseRoomsToDisplayEligibleRooms()

    this.view.drawRoomList(activeRooms)
  },
  getInfoFromChatroom: function(roomPath){
    firebaseHelper.getFirebaseUserLocations(roomPath)
  },
  createChatRoom: function(roomPath){
    this.sendUserToChatroom(roomPath)
  },
  sendUserToChatroom: function(roomPath){
    var firebaseRoomUrl = BASE_URL + roomPath
    $.event.trigger("readyToMakeRoom", roomPath)
  },

  sendInfoToChatRoom: function(roomPath) {
    // if(Object.userLocations.keys < 3) {
      firebaseHelper.createFirebaseUserLocations({
        roomPath: roomPath
      })
    // }
  },

  handleUserRoomAssignment: function() {
    var $room = $(event.target)
    var chatroom = $room.data('id')
    var test = this.objectToArray(Object.userLocations)
    if(test.length < 3){
      this.sendInfoToChatRoom(chatroom);
      this.getInfoFromChatroom(chatroom);
    }
    this.sendUserToChatroom(chatroom)
  },
  objectToArray: function(object){
    var collection = []
    for(var i in object){
      collection.push(i)
    }
    return collection
  }
}

