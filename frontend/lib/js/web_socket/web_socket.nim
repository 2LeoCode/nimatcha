import std/dom
import ../include_patterns, close_event, message_event

type WebSocket* {.importjs.} =
  ref object of EventTarget
    binaryType*: cstring
    onclose*: proc (e: CloseEvent)
    onmessage*: proc (e: MessageEvent)
    onopen*: proc (e: Event)

type WebSocketReadyState* =
  enum
    wsrsConnecting
    wsrsOpen
    wsrsClosing
    wsrsClosed

using
  socket: WebSocket
  event: MessageEvent

proc newWebSocket*(url: cstring; protocols: seq[
    cstring] = @[]): WebSocket {.importjs: constructorPat(WebSocket).}

proc readyStateRaw(socket): range[0..4] {.importjs: propertyPat.}

proc bufferedAmount*(socket): uint64 {.importjs: propertyPat.}

proc extensions*(socket): cstring {.importjs: propertyPat.}

proc protocol*(socket): cstring {.importjs: propertyPat.}

proc readyState*(socket): WebSocketReadyState =
  readyStateRaw(socket).WebSocketReadyState

proc url*(socket): cstring {.importjs: propertyPat.}

proc close*(socket; code: CloseCode = 1000;
    reason: cstring = "") {.importjs: methodPat.}

proc send*(socket; data: cstring or Blob) {.importjs: methodPat.}

template addCloseListener*(socket; listener: proc (e: CloseEvent)) =
  socket.addEventListener("close", listener)

template removeCloseListener*(socket; listener: proc (e: CloseEvent)) =
  socket.removeListener("close", listener)

template addMessageListener*(socket; listener: proc (e: MessageEvent)) =
  socket.addEventListener("message", listener)

template removeMessageListener*(socket; listener: proc (e: MessageEvent)) =
  socket.removeListener("message", listener)

template addOpenListener*(socket; listener: proc (e: Event)) =
  socket.addEventListener("open", listener)

template removeOpenListener*(socket; listener: proc (e: Event)) =
  socket.removeListener("open", listener)
