import std/[dom, jsffi]

import ../include_patterns

type MessageEvent* {.importjs.} =
  ref object of Event

using ev: MessageEvent

proc data*(ev): cstring or Blob {.importjs: propertyPat.}

proc origin*(ev): cstring {.importjs: propertyPat.}

proc lastEventId*(ev): cstring {.importjs: propertyPat.}

proc source*(ev): JsObject {.importjs: propertyPat.}

proc ports*(ev): JsObject {.importjs: propertyPat.}
