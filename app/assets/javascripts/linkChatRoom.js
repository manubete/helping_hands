

$(document).ready(function() {




  // $('.room_info').on('click', function(event) {
  //   this.roomNumber = $(event.target).data('temp')
  // })


    messagesRef = new Firebase('https://luminous-fire-2873.firebaseio.com/room3')
    $('#messageInput').keypress(function (e) {
    if (e.keyCode == 13) {
      var name = $('#nameInput').val();
      var text = $('#messageInput').val();
      messagesRef.push({name:name, text:text});
      $('#messageInput').val('');
    }
  });
  messagesRef.limit(10).on('child_added', function (snapshot) {
    var message = snapshot.val();
    $('<div/>').text(message.text).prepend($('<em/>')
      .text(message.name+': ')).appendTo($('#messagesDiv'));
    $('#messagesDiv')[0].scrollTop = $('#messagesDiv')[0].scrollHeight;
  });
  // }


})




