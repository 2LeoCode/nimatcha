import std/strformat

import js/web_socket

proc main() =
  var socket = newWebSocket("ws://localhost:3000")
  echo fmt "{socket.protocol=}"
  echo fmt "{socket.binaryType=}"
  echo fmt "{socket.url=}"
  echo fmt "{socket.extensions=}"
  echo fmt "{socket.readyState=}"
  echo fmt "{socket.bufferedAmount=}"

when isMainModule:
  main()
