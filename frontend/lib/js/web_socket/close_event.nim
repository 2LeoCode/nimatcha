import std/dom

import ../include_patterns

type CloseEvent* {.importjs.} =
  ref object of Event

type CloseCode* = range[1000u16..4999u16]

using ev: CloseEvent

proc code*(ev): CloseCode {.importjs: propertyPat.}

proc reason*(ev): cstring {.importjs: propertyPat.}

proc wasClean*(ev): bool {.importjs: propertyPat.}
