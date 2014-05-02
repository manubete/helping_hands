function RoomLinker(){
  var roomPath = $(location).attr('pathname').split('/').pop();
  this.roomAddress = 'https://luminous-fire-2873.firebaseio.com/room' + roomPath
  this.firebaseServer = new Firebase(this.roomAddress)
}

RoomLinker.prototype = {

  bindButtons: function() {
    self = this;
    $('#messageInput').keypress(function (e) {
      if (e.keyCode == 13) {
        var name = $('#nameInput').val();
        var text = $('#messageInput').val();
        self.firebaseServer.push({name:name, text:text});
        $('#messageInput').val('');
      }
    });

    self.firebaseServer.limit(10).on('child_added', function (snapshot) {
      var message = snapshot.val();
      $('<div/>').text(message.text).prepend($('<em/>')
      .text(message.name+': ')).appendTo($('#messagesDiv'));
      $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
    });
  }
}