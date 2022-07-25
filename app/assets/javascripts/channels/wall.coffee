App.wall = App.cable.subscriptions.create "WallChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("Connected to WallChannel")

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    wall = document.getElementById('wall')

    wall.innerHTML +=
        "<h2>" + data.title "</h2>"

    wall.innerHTML +=
        "<p>" + data.content + "</p>"

