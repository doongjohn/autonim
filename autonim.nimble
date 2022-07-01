# Package
version       = "0.1.0"
author        = "doongjohn"
description   = "windows automation using nimscript"
license       = "MIT"
srcDir        = "src"
namedBin["main"] = "autonim"


# Dependencies
requires "nim >= 1.7.1"
requires "winim"
requires "wauto"
requires "nimscripter"

task mingw, "build it with mingw":
  exec "nim c -d:mingw -d:release -o:autonim src/main.nim"
