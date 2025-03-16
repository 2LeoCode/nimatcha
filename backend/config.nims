--backend: c
--o: target/server

task build, "compile server code":
  setCommand "c", "main.nim"
