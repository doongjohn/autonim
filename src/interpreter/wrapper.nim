import std/random
import winim/lean
import wAuto

# init random state
# this variable is only for the automation thread
var rng* {.threadvar.}: Rand

proc randomInt*(min, max: int): int =
  # this function is only for the automation thread
  # ISSUE: can't pass generic type as an argument...?
  return rng.rand(min .. max)

proc randomFloat*(min, max: float): float =
  # this function is only for the automation thread
  return rng.rand(min .. max)

proc an_optGet*(key: string): int =
  return opt(key)

proc an_optSet*(key: string, value: int): int =
  return opt(key, value)

proc an_killWin*(window: Window, byProcess: bool) =
  kill(window, byProcess)

# BUG: this results fatal error
proc an_killProc*(process: Process): bool =
  return kill(process)

type
  EnumWindowCallback = proc (hwnd: HWND): bool

  EnumData = object
    callback: EnumWindowCallback
    isBreak: bool

proc enumChildrenProc(hwnd: HWND, data: LPARAM): WINBOOL {.stdcall.} =
  let pData = cast[ptr EnumData](data)
  pData[].isBreak = pData[].callback(hwnd)
  return not pData[].isBreak

proc enumChildren(callback: EnumWindowCallback) =
  # Enumerates all top-level windows.
  # The callback return true to stop enumeration.
  var data = EnumData(callback: callback)
  EnumWindows(enumChildrenProc, cast[LPARAM](addr data))

proc getTopLevelWindows*: seq[Window] =
  var list = newSeq[Window]()
  enumChildren do (hwnd: HWND) -> bool:
    list.add(Window hwnd)
    false
  return list

proc an_getClientPosition*(window: Window, pos: wPoint = (0, 0)): wPoint =
  return wAuto.getClientPosition(window, pos)

proc an_getClientPositionXY*(window: Window, x: int, y: int): wPoint =
  return wAuto.getClientPosition(window, x, y)

proc an_sendToActiveWindow*(
  text: string,
  raw = false,
  window = Window 0,
  attach = false,
  restoreCapslock = false
) =
  send(text, raw, window, attach, restoreCapslock)

template isPrimaryMouseLeft: bool =
  GetSystemMetrics(SM_SWAPBUTTON) == 0

proc down*(button = mbLeft) =
  var eventCode =
    case button:
      of mbLeft: MOUSEEVENTF_LEFTDOWN
      of mbRight: MOUSEEVENTF_RIGHTDOWN
      of mbMiddle: MOUSEEVENTF_MIDDLEDOWN
      of mbPrimary:
        if isPrimaryMouseLeft(): MOUSEEVENTF_LEFTDOWN else: MOUSEEVENTF_RIGHTDOWN
      of mbSecondary:
        if isPrimaryMouseLeft(): MOUSEEVENTF_RIGHTDOWN else: MOUSEEVENTF_LEFTDOWN
  mouse_event(eventCode, 0, 0, 0, 0)

proc up*(button = mbLeft) =
  var eventCode =
    case button:
      of mbLeft: MOUSEEVENTF_LEFTUP
      of mbRight: MOUSEEVENTF_RIGHTUP
      of mbMiddle: MOUSEEVENTF_MIDDLEUP
      of mbPrimary:
        if isPrimaryMouseLeft(): MOUSEEVENTF_LEFTUP else: MOUSEEVENTF_RIGHTUP
      of mbSecondary:
        if isPrimaryMouseLeft(): MOUSEEVENTF_RIGHTUP else: MOUSEEVENTF_LEFTUP
  mouse_event(eventCode, 0, 0, 0, 0)

proc an_clickDrag*(
  button: MouseButton,
  pos1, pos2: wPoint,
  speed: range[0 .. 100] = 10
) =
  wAuto.clickDrag(button, pos1, pos2, speed)
