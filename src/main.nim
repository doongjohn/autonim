# TODO: only include nimscript compatible modules
# https://nim-lang.github.io/Nim/nims.html

import
  std/options,
  std/locks,
  std/os,
  winim/lean,
  input,
  interpreter,
  nimscripter


proc ctrlcHandler {.noconv.} =
  deinitLock(lock)
  deinitInputHook()
  echo "[autonim] exit"
  quit()


proc messageLoop =
  # windows message loop
  # https://en.wikipedia.org/wiki/Message_loop_in_Microsoft_Windows
  var msg: MSG
  while GetMessage(msg, 0, 0, 0) > 0:
    TranslateMessage(msg)
    DispatchMessage(msg)


proc main =
  echo "[autonim] initializing..."
  setControlCHook(ctrlcHandler)

  initLock(lock)
  setCurrentDir(getAppDir())

  setupIntrAuto()
  setupIntrMain()

  # load main script
  let mainScript = scriptApiFile & scriptApiFileMain & readFile("./scripts/main.nims")
  let intr = initIntrMain(NimScriptFile mainScript)
  echo "[autonim] script loaded: \"./scripts/main.nims\""

  # load automation scripts
  loadAutomationScripts()

  # set mouse callback
  input.mouseEventCallback = proc(event: MouseEventData) =
    intr.invoke(onMouseEvent, event)

  # set keyboard callback
  input.keyboardEventCallback = proc(event: KeyboardEventData) =
    intr.invoke(onKeyboardEvent, event)

  initInputHook()
  echo "[autonim] initialized!"

  # start message loop
  messageLoop()


main()
