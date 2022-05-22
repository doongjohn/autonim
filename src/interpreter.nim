import std/locks
import std/options
import std/tables
import std/strutils
import std/strformat
import std/times
import std/random
import std/os
import winim/lean as winlean
import wAuto
import input
import interpreter/wrapper
import nimscripter

var lock*: Lock
var automationThread: Thread[string]
var automationRunning = false
var automationExecute = false

var usedScripts = initTable[string, string]()
const scriptApiFile* = staticRead("./interpreter/api.nims") & '\n'

proc setupIntrAuto*()
proc setupIntrMain*()
proc initIntrAuto(script: NimScriptFile | NimScriptPath): Option[Interpreter]
proc initIntrMain*(script: NimScriptFile | NimScriptPath): Option[Interpreter]

proc automation(scriptName: string) {.thread.} =
  var intr {.threadvar.}: Interpreter

  {.cast(gcsafe).}:
    once:
      rng = initRand(getTime().toUnix * 1000000000 + getTime().nanosecond)

      var combined = scriptApiFile
      for k, v in usedScripts:
        combined.add "var pp_{k}: proc() {{.nimcall.}}\n".fmt
        combined.add "proc {k}* = pp_{k}()\n".fmt
        combined.add "block:\n"
        combined.add "  include \"{v}\"\n".fmt
        combined.add "  pp_{k} = execute\n".fmt

      # TODO: handle error
      intr = initIntrAuto(NimScriptFile combined).get()

    intr.invokeDynamic(scriptName)
    withLock lock:
      automationRunning = false
      automationExecute = false

proc use(scriptName: string) =
  let scriptPath = "./scripts/{scriptName}.nims".fmt

  if scriptName == "main":
    echo "[autonim] script \"main\" is not allowed"
    return

  if not scriptPath.fileExists:
    echo "[autonim] file does not exists: \"{scriptPath}\"".fmt
    return

  echo "[autonim] script loaded: \"{scriptPath}\"".fmt
  usedScripts[scriptName] = scriptPath

proc isAutomationRunning: bool =
  withLock lock:
    result = automationRunning

proc isAutomationExecuting: bool =
  withLock lock:
    result = automationExecute

proc automationRun(scriptName: string) =
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

proc automationStop =
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

var addins_auto: VMAddins
var addins_main: VMAddins

proc setupIntrAuto* =
  commonExport(autonimAuto)

  exportTo(
    autonimAuto,
    wrapper.randomInt,
    wrapper.randomFloat,
    isAutomationRunning,
  )

  addins_auto = implNimScriptModule(autonimAuto)

proc setupIntrMain* =
  commonExport(autonimMain)

  exportTo(
    autonimMain,
    use,
    isAutomationExecuting,
    automationRun,
    automationStop,
  )

  addCallable(autonimMain):
    proc onMouseEvent(event: MouseEventData)
    proc onKeyboardEvent(event: KeyboardEventData)

  addins_main = implNimScriptModule(autonimMain)

proc initIntrAuto(script: NimScriptFile | NimScriptPath): Option[Interpreter] =
  return loadScript(
    script = script,
    addins = addins_auto,
    stdPath = "./stdlib"
  )

proc initIntrMain*(script: NimScriptFile | NimScriptPath): Option[Interpreter] =
  return loadScript(
    script = script,
    addins = addins_main,
    stdPath = "./stdlib"
  )
