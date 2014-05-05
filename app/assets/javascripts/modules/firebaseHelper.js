var firebaseHelper = (function() {
  var _createFireBase = function(firebaseUrl) {
    var newFirebase = new Firebase(firebaseUrl)
    return newFirebase
  }

  var _createRoom = function(userLocation) {
    var roomPath = geoHelper.randomizeString
    var newRoomUrl = BASE_URL + roomPath
    var newRoom = new Firebase(newRoomUrl)
    var roomsLocation = new Firebase(newRoomUrl+'/location')
    roomsLocation.push(userLocation);
    return newRoomUrl
  }

  var _pushToFirebase = function(firebaseUrl, userToken, userMessage){
    var chatRoom = new Firebase(firebaseUrl)
    chatRoom.push({user_token: cookieFactory.getValue('user-token'), message: userMessage})
  }

  var _bindChatWindowButtons = function(firebaseServer) {
    var chatRoom = firebaseServer
    chatRoom.limit(10).on('child_added', function (snapshot) {
      var message = snapshot.val();
      $('<div>').text(message.user_token+': '+message.message).fadeIn().appendTo($('#messagesDiv'));
      $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
    })
  }


  return {
    createFireBase: _createFireBase,
    createRoom: _createRoom,
    pushToFirebase: _pushToFirebase,
    bindChatWindowButtons: _bindChatWindowButtons
  }

}())


