import
  std/locks,
  std/options,
  std/tables,
  std/strutils,
  std/strformat,
  std/os,
  winim/lean as winlean,
  wAuto,
  input,
  interpreter/wrapper,
  nimscripter

var
  lock*: Lock
  automationThread: Thread[string]
  automationRunning = false
  automationExecute = false
  usedScripts = initTable[string, string]()
  automationIntr: Interpreter

const
  scriptApiFile* = staticRead("./interpreter/api.nims") & '\n'
  scriptApiFileMain* = staticRead("./interpreter/apimain.nims") & '\n'


proc setupIntrAuto*()
proc setupIntrMain*()
proc initIntrAuto(script: NimScriptFile | NimScriptPath): Option[Interpreter]
proc initIntrMain*(script: NimScriptFile | NimScriptPath): Option[Interpreter]


proc automation(scriptName: string) {.thread.} =
  {.cast(gcsafe).}:
    automationIntr.invokeDynamic(scriptName)
    withLock lock:
      automationRunning = false
      automationExecute = false


proc use(scriptName: string) =
  # the program will load the specified script

  let scriptPath = "./scripts/{scriptName}.nims".fmt

  if scriptName == "main":
    echo "[autonim] script \"main\" is not allowed"
    return

  if not scriptPath.fileExists:
    echo "[autonim] file does not exists: \"{scriptPath}\"".fmt
    return

  echo "[autonim] script loaded: \"{scriptPath}\"".fmt
  usedScripts[scriptName] = scriptPath


proc isScriptRunning: bool =
  withLock lock:
    result = automationRunning


proc isScriptExecuting: bool =
  withLock lock:
    result = automationExecute


proc scriptRun(scriptName: string) =
  var running: bool
  withLock lock:
    running = automationRunning or automationExecute

  if running:
    echo "[autonim] won't run \"{scriptName}\" (current script is not finished)"
    return

  if not usedScripts.hasKey scriptName:
    echo "[autonim] invalid script: \"{scriptName}\"".fmt
    return

  automationRunning = true
  automationExecute = true

  # TODO: use thread pool: https://github.com/status-im/nim-taskpools
  # start automation thread
  automationThread.createThread(automation, scriptName)


proc scriptStop =
  var running: bool
  withLock lock:
    running = automationRunning

  if running:
    withLock lock:
      automationRunning = false
    # NOTE: don't call thread.join here
    # because blocking the message loop is not a good idea
    # maybe make a sepreate thread for the message loop..?


template commonExport(moduleName: untyped) =
  exportTo(
    moduleName,

    # types
    winlean.LONG,
    winlean.DWORD,
    winlean.UINT_PTR,
    winlean.ULONG_PTR,
    winlean.WPARAM,
    winlean.HANDLE,
    winlean.HWND,
    winlean.POINT,
    winlean.MSLLHOOKSTRUCT,
    winlean.KBDLLHOOKSTRUCT,
    wAuto.wPoint,
    wAuto.Window,
    wAuto.Process,
    wAuto.MouseButton,
    input.MouseEventData,
    input.KeyboardEventData,

    # os
    sleep,
    execShellCmd,

    # automation
    wrapper.an_optGet,
    wrapper.an_optSet,
    wrapper.down,
    wrapper.up,
    wrapper.an_clickDrag,
    wAuto.getProcess,
    wrapper.an_killProc,
    wrapper.an_killWin,
    wAuto.isActive,
    wAuto.getClassName,
    wrapper.getTopLevelWindows,
    wrapper.an_getClientPosition,
    wrapper.an_getClientPositionXY,
    wrapper.an_sendToActiveWindow,
    input.keyCodeToString,
  )


var
  addinsAuto: VMAddins
  addinsMain: VMAddins


proc loadAutomationScripts* =
  var combined = scriptApiFile
  for k, v in usedScripts:
    combined.add "var pp_{k}: proc() {{.nimcall.}}\n".fmt
    combined.add "proc {k}* = pp_{k}()\n".fmt
    combined.add "block:\n"
    combined.add "  include \"{v}\"\n".fmt
    combined.add "  pp_{k} = execute\n".fmt

  # TODO: handle error
  automationIntr = initIntrAuto(NimScriptFile combined).get()


proc setupIntrAuto* =
  commonExport(autonimAuto)

  exportTo(
    autonimAuto,
    wrapper.randomInt,
    wrapper.randomFloat,
    isScriptRunning,
  )

  addinsAuto = implNimScriptModule(autonimAuto)


proc setupIntrMain* =
  commonExport(autonimMain)

  exportTo(
    autonimMain,
    use,
    isScriptExecuting,
    scriptRun,
    scriptStop,
  )

  addCallable(autonimMain):
    proc onMouseEvent(event: MouseEventData)
    proc onKeyboardEvent(event: KeyboardEventData)

  addinsMain = implNimScriptModule(autonimMain)


proc initIntrAuto(script: NimScriptFile | NimScriptPath): Option[Interpreter] =
  return loadScript(
    script = script,
    addins = addinsAuto,
    stdPath = "./stdlib"
  )


proc initIntrMain*(script: NimScriptFile | NimScriptPath): Option[Interpreter] =
  return loadScript(
    script = script,
    addins = addinsMain,
    stdPath = "./stdlib"
  )
