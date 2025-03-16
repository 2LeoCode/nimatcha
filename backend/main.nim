import std/[async, asyncdispatch, asynchttpserver, paths, nativesockets, strformat]

const frontendPath = currentSourcePath().Path.parentDir() /../
    "frontend".Path

proc handler(req: Request) {.async.} =
  echo "Incoming request"
  try:
    case req.url.path
    of "", "/":
      await req.respond(Http200, readFile (frontendPath /
        "index.html".Path).string, newHttpHeaders {
          "Content-Type": "text/html"
        })
    of "/main.js":
      await req.respond(Http200, readFile (frontendPath / "target".Path /
        "client.js".Path).string, newHttpHeaders {
          "Content-Type": "text/javascript"
        })
    of "/style.css":
      await req.respond(Http200, readFile (frontendPath /
        "style.css".Path).string, newHttpHeaders {"Content-Type": "text/css"})
  except ref Exception as e:
    echo "Error:", e.msg

proc main() {.async.} =
  var server = newAsyncHttpServer()
  echo "listening on 3000"
  await server.serve(3000.Port, handler)

when isMainModule:
  echo fmt "Serving frontend on path {frontendPath}"
  waitFor main()
