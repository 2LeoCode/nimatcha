import std/typetraits

const
  propertyPat* = "#.$1"
  methodPat* = "#.$1(@)"

template constructorPat*[T: ref (object or tuple)](
  t: typedesc[T]): cstring = "new " & t.name & "(@)"
