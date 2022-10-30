# references:
# https://docs.microsoft.com/en-us/windows/win32/learnwin32/keyboard-input

import
  std/tables,
  winim/lean,
  wAuto


# TODO: imporve the string representation
const keyNameTable = {
  wKey_Back: "BACKSPACE",
  wKey_Tab: "TAB",
  wKey_Clear: "CLEAR",
  wKey_Return: "ENTER",
  wKey_Shift: "SHIFT",
  wKey_Control: "CTRL",
  wKey_Menu: "ALT",
  wKey_Pause: "PAUSE",
  wKey_Capital: "CAPS LOCK",
  wKey_Hangul: "IME Hangul",
  wKey_Junja: "IME Junja",
  wKey_Final: "IME final",
  wKey_Hanja: "IME Hanja",
  wKey_Kanji: "IME Kanji",
  wKey_Escape: "ESC",
  wKey_Convert: "IME convert",
  wKey_NonConvert: "IME nonconvert",
  wKey_Accept: "IME accept",
  wKey_ModeChange: "IME mode change request",
  wKey_Space: "SPACEBAR",
  wKey_Prior: "PAGE UP",
  wKey_Next: "PAGE DOWN",
  wKey_End: "END",
  wKey_Home: "HOME",
  wKey_Left: "LEFT ARROW",
  wKey_Up: "UP ARROW",
  wKey_Right: "RIGHT ARROW",
  wKey_Select: "SELECT",
  wKey_Print: "PRINT",
  wKey_Execute: "EXECUTE",
  wKey_Snapshot: "PRINT SCREEN",
  wKey_Insert: "INSERT",
  wKey_Delete: "DELETE",
  wKey_Help: "HELP",
  wKey_LWin: "LEFT WINDOWS",
  wKey_RWin: "RIGHT WINDOWS",
  wKey_Apps: "APPLICATIONS",
  wKey_Sleep: "COMPUTER SLEEP",
  wKey_Numpad0: "NUMPAD 0",
  wKey_Numpad1: "NUMPAD 1",
  wKey_Numpad2: "NUMPAD 2",
  wKey_Numpad3: "NUMPAD 3",
  wKey_Numpad4: "NUMPAD 4",
  wKey_Numpad5: "NUMPAD 5",
  wKey_Numpad6: "NUMPAD 6",
  wKey_Numpad7: "NUMPAD 7",
  wKey_Numpad8: "NUMPAD 8",
  wKey_Numpad9: "NUMPAD 9",
  wKey_Multiply: "*",
  wKey_Add: "+",
  wKey_Separator: "SEPARATOR",
  wKey_Subtract: "-",
  wKey_Decimal: "DECIMAL",
  wKey_Divide: "/",
  wKey_F1: "F1",
  wKey_F2: "F2",
  wKey_F3: "F3",
  wKey_F4: "F4",
  wKey_F5: "F5",
  wKey_F6: "F6",
  wKey_F7: "F7",
  wKey_F8: "F8",
  wKey_F9: "F9",
  wKey_F10: "F10",
  wKey_F11: "F11",
  wKey_F12: "F12",
  wKey_F13: "F13",
  wKey_F14: "F14",
  wKey_F15: "F15",
  wKey_F16: "F16",
  wKey_F17: "F17",
  wKey_F18: "F18",
  wKey_F19: "F19",
  wKey_F20: "F20",
  wKey_F21: "F21",
  wKey_F22: "F22",
  wKey_F23: "F23",
  wKey_F24: "F24",
  wKey_Numlock: "NUMLOCK",
  wKey_OemNecEqual: "OEM NEC EQUAL",
  wKey_OemFjJisho: "JISHO",
  wKey_OemFjMasshou: "MASSHOU",
  wKey_OemFjTouroku: "TOUROKU",
  wKey_OemFjLoya: "Loya",
  wKey_OemFjRoya: "Roya",
  wKey_LShift: "L SFHT",
  wKey_RShift: "R SHFT",
  wKey_LControl: "L CTRL",
  wKey_RControl: "R CTRL",
  wKey_LMenu: "L ALT",
  wKey_BrowserBack: "R ALT",
  wKey_BrowserForward: "R ALT",
  wKey_BrowserRefresh: "R ALT",
  wKey_BrowserStop: "R ALT",
  wKey_BrowserSearch: "R ALT",
  wKey_BrowserFavorites: "R ALT",
  wKey_BrowserHome: "R ALT",
  wKey_VolumeMute: "R ALT",
  wKey_VolumeDown: "R ALT",
  wKey_VolumeUp: "R ALT",
  wKey_MediaNextTrack: "R ALT",
  wKey_MediaPrevTrack: "R ALT",
  wKey_MediaStop: "R ALT",
  wKey_MediaPlayPause: "R ALT",
  wKey_LaunchMail: "R ALT",
  wKey_LaunchMediaSelect: "R ALT",
  wKey_LaunchApp1: "R ALT",
  wKey_LaunchApp2: "R ALT",
  wKey_OemPlus: "+",
  wKey_OemComma: ",",
  wKey_OemMinus: "-",
  wKey_OemPeriod: ".",
  wKey_OemMinus: "-",
  wKey_Oem1: "OEM 1 ( ; )",
  wKey_Oem2: "OEM 2 ( / )",
  wKey_Oem3: "OEM 3 ( ~ )",
  wKey_Oem4: "OEM 4 ( [ )",
  wKey_Oem5: "OEM 5 ( \\ )",
  wKey_Oem6: "OEM 6 ( ] )",
  wKey_Oem7: "OEM 7 ( ' )",
  wKey_Oem8: "OEM 8",
  wKey_OemAx: "OEM AX",
  wKey_Oem102: "OEM 102",
  wKey_IcoHelp: "ICO HELP",
  wKey_Ico00: "ICO 00",
  wKey_ProcessKey: "PROCESS",
  wKey_IcoClear: "ICO CLEAR",
  wKey_Packet: "PACKET",
  wKey_OemReset: "OEM RESET",
  wKey_OemJump: "OEM JUMP",
  wKey_OemPa1: "OEM PA1",
  wKey_OemPa2: "OEM PA2",
  wKey_OemPa3: "OEM PA3",
  wKey_OemWsctrl: "OEM WSCTRL",
  wKey_OemCusel: "OEM CUSEL",
  wKey_OemAttn: "OEM ATTN",
  wKey_OemFinish: "OEM FINISH",
  wKey_OemCopy: "OEM COPY",
  wKey_OemAuto: "OEM AUTO",
  wKey_OemEnlw: "OEM ENLW",
  wKey_OemBacktab: "OEM BACKTAB",
  wKey_Attn: "ATTN",
  wKey_Crsel: "CRSEL",
  wKey_Exsel: "EXSEL",
  wKey_Ereof: "EREOF",
  wKey_Play: "PLAY",
  wKey_Zoom: "ZOOM",
  wKey_Noname: "NONAME",
  wKey_Pa1: "PA 1",
  wKey_OemClear: "OEM_CLEAR",
  wKey_A: "A",
  wKey_B: "B",
  wKey_C: "C",
  wKey_D: "D",
  wKey_E: "E",
  wKey_F: "F",
  wKey_G: "G",
  wKey_H: "H",
  wKey_I: "I",
  wKey_J: "J",
  wKey_K: "K",
  wKey_L: "L",
  wKey_M: "M",
  wKey_N: "N",
  wKey_O: "O",
  wKey_P: "P",
  wKey_Q: "Q",
  wKey_R: "R",
  wKey_S: "S",
  wKey_T: "T",
  wKey_U: "U",
  wKey_V: "V",
  wKey_W: "W",
  wKey_X: "X",
  wKey_Y: "Y",
  wKey_Z: "Z",
  wKey_0: "0",
  wKey_1: "1",
  wKey_2: "2",
  wKey_3: "3",
  wKey_4: "4",
  wKey_5: "5",
  wKey_6: "6",
  wKey_7: "7",
  wKey_8: "8",
  wKey_9: "9"
}.toTable()


template keyCodeToString*(keyCode: int): string =
  keyNameTable[keyCode]


type
  # TODO: make user friendly api
  MouseEventData* = object
    point: POINT
    mouseCode: WPARAM
    mouseData: DWORD

  KeyboardEventData* = object
    keyState: WPARAM
    keyCode: DWORD


var
  mouseHook: HHOOK
  keyboardHook: HHOOK
  mouseEventCallback*: proc(event: MouseEventData)
  keyboardEventCallback*: proc(event: KeyboardEventData)


proc mouseHookCb(code: int32, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.} =
  if lParam > 0:
    var mouseStructPtr = cast[PMSLLHOOKSTRUCT](lParam)
    mouseEventCallback(MouseEventData(
      point: mouseStructPtr[].pt,
      mouseCode: wParam,
      mouseData: mouseStructPtr[].mouseData,
    ))
  return CallNextHookEx(mouseHook, code, wParam, lParam)


proc keyboardHookCb(code: int32, wParam: WPARAM, lParam: LPARAM): LRESULT {.stdcall.} =
  if lParam > 0:
    keyboardEventCallback(KeyboardEventData(
      keyState: wParam,
      keyCode: (cast[PKBDLLHOOKSTRUCT](lParam))[].vkCode
    ))
  return CallNextHookEx(keyboardHook, code, wParam, lParam)


proc initInputHook* =
  # NOTE: execute this code right before the message loop!
  # otherwise your computer will lag
  mouseHook = SetWindowsHookExW(WH_MOUSE_LL, mouseHookCb, 0, 0)
  keyboardHook = SetWindowsHookExW(WH_KEYBOARD_LL, keyboardHookCb, 0, 0)


proc deinitInputHook* =
  UnhookWindowsHookEx(mouseHook)
  UnhookWindowsHookEx(keyboardHook)
