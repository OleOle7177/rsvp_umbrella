import socket from "./socket"

(function() {
  let id = $('#id').data('id');
  if (!id)
    return;

  let channel = socket.channel("event:" + id, {});

  channel.join()
    .receive("ok", resp => { console.log("Successfully joined: " + id, resp)})
    .receive("error", resp => { console.log("Unable to join", resp)});
})();
