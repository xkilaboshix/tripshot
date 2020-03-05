App.room = App.cable.subscriptions.create("RoomChannel", {
  room: $('chatroom').data('room_id'),
  connected: function() {
    // 最後に実行したいアクションをここに
    // Called when the subscription is ready for use on the server
    // ここで最下部までスクロールするように指定
    // var a = document.documentElement;
    // var y = a.scrollHeight - a.clientHeight;
    // window.scroll(0, y);
    var height = 0;
  $('.message').each( function() {
  height += ($(this).height());
  });
   $("html, body").scrollTop(height);
  
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(message) {
    const messages = document.getElementById('messages');
    messages.innerHTML += message;
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function(content) {
    const room_id = $('#chatroom').data('room_id');
    const user_id = $('#user_id').data('user_id');
    return this.perform('speak', {message: content, room_id: room_id, user_id: user_id});
  }
});

$(document).on('click', "#button", function() {
  const input = document.getElementById('chat-input');
  let content = input.value;
  if (content !== "") {
    App.room.speak(content);
    content = '';
  }
});