--backend: js
--o: target/client.js

task build, "compile client code":
  setCommand "js", "main.nim"
