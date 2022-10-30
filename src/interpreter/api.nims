const
  # WM_MOUSEFIRST = 0x0200
  WM_MOUSEMOVE = 0x0200
  WM_LBUTTONDOWN = 0x0201
  WM_LBUTTONUP = 0x0202
  WM_LBUTTONDBLCLK = 0x0203
  WM_RBUTTONDOWN = 0x0204
  WM_RBUTTONUP = 0x0205
  WM_RBUTTONDBLCLK = 0x0206
  WM_MBUTTONDOWN = 0x0207
  WM_MBUTTONUP = 0x0208
  WM_MBUTTONDBLCLK = 0x0209
  WM_MOUSEWHEEL = 0x020A
  WM_XBUTTONDOWN = 0x020B
  WM_XBUTTONUP = 0x020C
  WM_XBUTTONDBLCLK = 0x020D
  WM_MOUSEHWHEEL = 0x020e
  # WM_MOUSELAST = 0x020e
  WHEEL_DELTA = 120
  XBUTTON1 = 0x0001
  XBUTTON2 = 0x0002

  # WM_KEYFIRST = 0x0100
  WM_KEYDOWN = 0x0100
  WM_KEYUP = 0x0101
  WM_CHAR = 0x0102
  WM_DEADCHAR = 0x0103
  WM_SYSKEYDOWN = 0x0104
  WM_SYSKEYUP = 0x0105
  WM_SYSCHAR = 0x0106
  WM_SYSDEADCHAR = 0x0107
  WM_UNICHAR = 0x0109
  # WM_KEYLAST = 0x0109

  VK_CANCEL = 0x03
  VK_BACK = 0x08
  VK_TAB = 0x09
  VK_CLEAR = 0x0C
  VK_RETURN = 0x0D
  VK_SHIFT = 0x10
  VK_CONTROL = 0x11
  VK_MENU = 0x12
  VK_PAUSE = 0x13
  VK_CAPITAL = 0x14
  VK_KANA = 0x15
  VK_HANGEUL = 0x15
  VK_HANGUL = 0x15
  VK_JUNJA = 0x17
  VK_FINAL = 0x18
  VK_HANJA = 0x19
  VK_KANJI = 0x19
  VK_ESCAPE = 0x1B
  VK_CONVERT = 0x1C
  VK_NONCONVERT = 0x1D
  VK_ACCEPT = 0x1E
  VK_MODECHANGE = 0x1F
  VK_SPACE = 0x20
  VK_PRIOR = 0x21
  VK_NEXT = 0x22
  VK_END = 0x23
  VK_HOME = 0x24
  VK_LEFT = 0x25
  VK_UP = 0x26
  VK_RIGHT = 0x27
  VK_DOWN = 0x28
  VK_SELECT = 0x29
  VK_PRINT = 0x2A
  VK_EXECUTE = 0x2B
  VK_SNAPSHOT = 0x2C
  VK_INSERT = 0x2D
  VK_DELETE = 0x2E
  VK_HELP = 0x2F
  VK_LWIN = 0x5B
  VK_RWIN = 0x5C
  VK_APPS = 0x5D
  VK_SLEEP = 0x5F
  VK_NUMPAD0 = 0x60
  VK_NUMPAD1 = 0x61
  VK_NUMPAD2 = 0x62
  VK_NUMPAD3 = 0x63
  VK_NUMPAD4 = 0x64
  VK_NUMPAD5 = 0x65
  VK_NUMPAD6 = 0x66
  VK_NUMPAD7 = 0x67
  VK_NUMPAD8 = 0x68
  VK_NUMPAD9 = 0x69
  VK_MULTIPLY = 0x6A
  VK_ADD = 0x6B
  VK_SEPARATOR = 0x6C
  VK_SUBTRACT = 0x6D
  VK_DECIMAL = 0x6E
  VK_DIVIDE = 0x6F
  VK_F1 = 0x70
  VK_F2 = 0x71
  VK_F3 = 0x72
  VK_F4 = 0x73
  VK_F5 = 0x74
  VK_F6 = 0x75
  VK_F7 = 0x76
  VK_F8 = 0x77
  VK_F9 = 0x78
  VK_F10 = 0x79
  VK_F11 = 0x7A
  VK_F12 = 0x7B
  VK_F13 = 0x7C
  VK_F14 = 0x7D
  VK_F15 = 0x7E
  VK_F16 = 0x7F
  VK_F17 = 0x80
  VK_F18 = 0x81
  VK_F19 = 0x82
  VK_F20 = 0x83
  VK_F21 = 0x84
  VK_F22 = 0x85
  VK_F23 = 0x86
  VK_F24 = 0x87
  VK_NUMLOCK = 0x90
  VK_SCROLL = 0x91
  VK_OEM_NEC_EQUAL = 0x92
  VK_OEM_FJ_JISHO = 0x92
  VK_OEM_FJ_MASSHOU = 0x93
  VK_OEM_FJ_TOUROKU = 0x94
  VK_OEM_FJ_LOYA = 0x95
  VK_OEM_FJ_ROYA = 0x96
  VK_LSHIFT = 0xA0
  VK_RSHIFT = 0xA1
  VK_LCONTROL = 0xA2
  VK_RCONTROL = 0xA3
  VK_LMENU = 0xA4
  VK_RMENU = 0xA5
  VK_BROWSER_BACK = 0xA6
  VK_BROWSER_FORWARD = 0xA7
  VK_BROWSER_REFRESH = 0xA8
  VK_BROWSER_STOP = 0xA9
  VK_BROWSER_SEARCH = 0xAA
  VK_BROWSER_FAVORITES = 0xAB
  VK_BROWSER_HOME = 0xAC
  VK_VOLUME_MUTE = 0xAD
  VK_VOLUME_DOWN = 0xAE
  VK_VOLUME_UP = 0xAF
  VK_MEDIA_NEXT_TRACK = 0xB0
  VK_MEDIA_PREV_TRACK = 0xB1
  VK_MEDIA_STOP = 0xB2
  VK_MEDIA_PLAY_PAUSE = 0xB3
  VK_LAUNCH_MAIL = 0xB4
  VK_LAUNCH_MEDIA_SELECT = 0xB5
  VK_LAUNCH_APP1 = 0xB6
  VK_LAUNCH_APP2 = 0xB7
  VK_OEM_1 = 0xBA
  VK_OEM_PLUS = 0xBB
  VK_OEM_COMMA = 0xBC
  VK_OEM_MINUS = 0xBD
  VK_OEM_PERIOD = 0xBE
  VK_OEM_2 = 0xBF
  VK_OEM_3 = 0xC0
  VK_OEM_4 = 0xDB
  VK_OEM_5 = 0xDC
  VK_OEM_6 = 0xDD
  VK_OEM_7 = 0xDE
  VK_OEM_8 = 0xDF
  VK_OEM_AX = 0xE1
  VK_OEM_102 = 0xE2
  VK_ICO_HELP = 0xE3
  VK_ICO_00 = 0xE4
  VK_PROCESSKEY = 0xE5
  VK_ICO_CLEAR = 0xE6
  VK_PACKET = 0xE7
  VK_OEM_RESET = 0xE9
  VK_OEM_JUMP = 0xEA
  VK_OEM_PA1 = 0xEB
  VK_OEM_PA2 = 0xEC
  VK_OEM_PA3 = 0xED
  VK_OEM_WSCTRL = 0xEE
  VK_OEM_CUSEL = 0xEF
  VK_OEM_ATTN = 0xF0
  VK_OEM_FINISH = 0xF1
  VK_OEM_COPY = 0xF2
  VK_OEM_AUTO = 0xF3
  VK_OEM_ENLW = 0xF4
  VK_OEM_BACKTAB = 0xF5
  VK_ATTN = 0xF6
  VK_CRSEL = 0xF7
  VK_EXSEL = 0xF8
  VK_EREOF = 0xF9
  VK_PLAY = 0xFA
  VK_ZOOM = 0xFB
  VK_NONAME = 0xFC
  VK_PA1 = 0xFD
  VK_OEM_CLEAR = 0xFE

  Key_None = 0
  Key_Cancel = VK_CANCEL
  Key_Back = VK_BACK
  Key_Tab = VK_TAB
  Key_Clear = VK_CLEAR
  Key_Return = VK_RETURN
  Key_Enter = VK_RETURN
  Key_Shift = VK_SHIFT
  Key_Control = VK_CONTROL
  Key_Ctrl = VK_CONTROL
  Key_Menu = VK_MENU
  Key_Alt = VK_MENU
  Key_Pause = VK_PAUSE
  Key_Capital = VK_CAPITAL
  Key_Kana = VK_KANA
  Key_Hangeul = VK_HANGEUL
  Key_Hangul = VK_HANGUL
  Key_Junja = VK_JUNJA
  Key_Final = VK_FINAL
  Key_Hanja = VK_HANJA
  Key_Kanji = VK_KANJI
  Key_Escape = VK_ESCAPE
  Key_Esc = VK_ESCAPE
  Key_Convert = VK_CONVERT
  Key_NonConvert = VK_NONCONVERT
  Key_Accept = VK_ACCEPT
  Key_ModeChange = VK_MODECHANGE
  Key_Space = VK_SPACE
  Key_Prior = VK_PRIOR
  Key_PgUp = VK_PRIOR
  Key_Next = VK_NEXT
  Key_PgDn = VK_NEXT
  Key_End = VK_END
  Key_Home = VK_HOME
  Key_Left = VK_LEFT
  Key_Up = VK_UP
  Key_Right = VK_RIGHT
  Key_Down = VK_DOWN
  Key_Select = VK_SELECT
  Key_Print = VK_PRINT
  Key_Execute = VK_EXECUTE
  Key_Snapshot = VK_SNAPSHOT
  Key_Insert = VK_INSERT
  Key_Delete = VK_DELETE
  Key_Help = VK_HELP
  Key_LWin = VK_LWIN
  Key_RWin = VK_RWIN
  Key_Apps = VK_APPS
  Key_Sleep = VK_SLEEP
  Key_Numpad0 = VK_NUMPAD0
  Key_Numpad1 = VK_NUMPAD1
  Key_Numpad2 = VK_NUMPAD2
  Key_Numpad3 = VK_NUMPAD3
  Key_Numpad4 = VK_NUMPAD4
  Key_Numpad5 = VK_NUMPAD5
  Key_Numpad6 = VK_NUMPAD6
  Key_Numpad7 = VK_NUMPAD7
  Key_Numpad8 = VK_NUMPAD8
  Key_Numpad9 = VK_NUMPAD9
  Key_Multiply = VK_MULTIPLY
  Key_Add = VK_ADD
  Key_Separator = VK_SEPARATOR
  Key_Subtract = VK_SUBTRACT
  Key_Decimal = VK_DECIMAL
  Key_Divide = VK_DIVIDE
  Key_F1 = VK_F1
  Key_F2 = VK_F2
  Key_F3 = VK_F3
  Key_F4 = VK_F4
  Key_F5 = VK_F5
  Key_F6 = VK_F6
  Key_F7 = VK_F7
  Key_F8 = VK_F8
  Key_F9 = VK_F9
  Key_F10 = VK_F10
  Key_F11 = VK_F11
  Key_F12 = VK_F12
  Key_F13 = VK_F13
  Key_F14 = VK_F14
  Key_F15 = VK_F15
  Key_F16 = VK_F16
  Key_F17 = VK_F17
  Key_F18 = VK_F18
  Key_F19 = VK_F19
  Key_F20 = VK_F20
  Key_F21 = VK_F21
  Key_F22 = VK_F22
  Key_F23 = VK_F23
  Key_F24 = VK_F24
  Key_Numlock = VK_NUMLOCK
  Key_Scroll = VK_SCROLL
  Key_OemNecEqual = VK_OEM_NEC_EQUAL
  Key_OemFjJisho = VK_OEM_FJ_JISHO
  Key_OemFjMasshou = VK_OEM_FJ_MASSHOU
  Key_OemFjTouroku = VK_OEM_FJ_TOUROKU
  Key_OemFjLoya = VK_OEM_FJ_LOYA
  Key_OemFjRoya = VK_OEM_FJ_ROYA
  Key_LShift = VK_LSHIFT
  Key_RShift = VK_RSHIFT
  Key_LControl = VK_LCONTROL
  Key_RControl = VK_RCONTROL
  Key_LMenu = VK_LMENU
  Key_RMenu = VK_RMENU
  Key_LCtrl = VK_LCONTROL
  Key_RCtrl = VK_RCONTROL
  Key_LAlt = VK_LMENU
  Key_RAlt = VK_RMENU
  Key_BrowserBack = VK_BROWSER_BACK
  Key_BrowserForward = VK_BROWSER_FORWARD
  Key_BrowserRefresh = VK_BROWSER_REFRESH
  Key_BrowserStop = VK_BROWSER_STOP
  Key_BrowserSearch = VK_BROWSER_SEARCH
  Key_BrowserFavorites = VK_BROWSER_FAVORITES
  Key_BrowserHome = VK_BROWSER_HOME
  Key_VolumeMute = VK_VOLUME_MUTE
  Key_VolumeDown = VK_VOLUME_DOWN
  Key_VolumeUp = VK_VOLUME_UP
  Key_MediaNextTrack = VK_MEDIA_NEXT_TRACK
  Key_MediaPrevTrack = VK_MEDIA_PREV_TRACK
  Key_MediaStop = VK_MEDIA_STOP
  Key_MediaPlayPause = VK_MEDIA_PLAY_PAUSE
  Key_LaunchMail = VK_LAUNCH_MAIL
  Key_LaunchMediaSelect = VK_LAUNCH_MEDIA_SELECT
  Key_LaunchApp1 = VK_LAUNCH_APP1
  Key_LaunchApp2 = VK_LAUNCH_APP2
  Key_Oem1 = VK_OEM_1
  Key_OemPlus = VK_OEM_PLUS
  Key_OemComma = VK_OEM_COMMA
  Key_OemMinus = VK_OEM_MINUS
  Key_OemPeriod = VK_OEM_PERIOD
  Key_Oem2 = VK_OEM_2
  Key_Oem3 = VK_OEM_3
  Key_Oem4 = VK_OEM_4
  Key_Oem5 = VK_OEM_5
  Key_Oem6 = VK_OEM_6
  Key_Oem7 = VK_OEM_7
  Key_Oem8 = VK_OEM_8
  Key_OemAx = VK_OEM_AX
  Key_Oem102 = VK_OEM_102
  Key_IcoHelp = VK_ICO_HELP
  Key_Ico00 = VK_ICO_00
  Key_ProcessKey = VK_PROCESSKEY
  Key_IcoClear = VK_ICO_CLEAR
  Key_Packet = VK_PACKET
  Key_OemReset = VK_OEM_RESET
  Key_OemJump = VK_OEM_JUMP
  Key_OemPa1 = VK_OEM_PA1
  Key_OemPa2 = VK_OEM_PA2
  Key_OemPa3 = VK_OEM_PA3
  Key_OemWsctrl = VK_OEM_WSCTRL
  Key_OemCusel = VK_OEM_CUSEL
  Key_OemAttn = VK_OEM_ATTN
  Key_OemFinish = VK_OEM_FINISH
  Key_OemCopy = VK_OEM_COPY
  Key_OemAuto = VK_OEM_AUTO
  Key_OemEnlw = VK_OEM_ENLW
  Key_OemBacktab = VK_OEM_BACKTAB
  Key_Attn = VK_ATTN
  Key_Crsel = VK_CRSEL
  Key_Exsel = VK_EXSEL
  Key_Ereof = VK_EREOF
  Key_Play = VK_PLAY
  Key_Zoom = VK_ZOOM
  Key_Noname = VK_NONAME
  Key_Pa1 = VK_PA1
  Key_OemClear = VK_OEM_CLEAR
  Key_A = ord 'A'
  Key_B = ord 'B'
  Key_C = ord 'C'
  Key_D = ord 'D'
  Key_E = ord 'E'
  Key_F = ord 'F'
  Key_G = ord 'G'
  Key_H = ord 'H'
  Key_I = ord 'I'
  Key_J = ord 'J'
  Key_K = ord 'K'
  Key_L = ord 'L'
  Key_M = ord 'M'
  Key_N = ord 'N'
  Key_O = ord 'O'
  Key_P = ord 'P'
  Key_Q = ord 'Q'
  Key_R = ord 'R'
  Key_S = ord 'S'
  Key_T = ord 'T'
  Key_U = ord 'U'
  Key_V = ord 'V'
  Key_W = ord 'W'
  Key_X = ord 'X'
  Key_Y = ord 'Y'
  Key_Z = ord 'Z'
  Key_0 = ord '0'
  Key_1 = ord '1'
  Key_2 = ord '2'
  Key_3 = ord '3'
  Key_4 = ord '4'
  Key_5 = ord '5'
  Key_6 = ord '6'
  Key_7 = ord '7'
  Key_8 = ord '8'
  Key_9 = ord '9'

  InvalidWindow = Window 0

  wDefault = int32.low.int
  wDefaultPoint: wPoint = (wDefault, wDefault)


when declared(randomInt):
  proc random(minmax: Slice[int]): int =
    randomInt(minmax.a, minmax.b)

  proc random(minmax: Slice[float]): float =
    randomFloat(minmax.a, minmax.b)


proc opt(key: string, value: int): int {.discardable.} =
  an_optSet(key, value)


proc opt(key: string): int =
  an_optGet(key)


proc clickDrag(
  button = mbLeft,
  pos1, pos2 = wDefaultPoint,
  speed: range[0..100] = 10
) =
  an_clickDrag(
    button,
    pos1, pos2,
    speed
  )


proc process(window: Window): Process =
  getProcess(window)


proc kill(process: Process): bool {.discardable.} =
  an_KillProc(process)


proc kill(window: Window, byProcess = true) =
  an_KillWin(window, byProcess)


# TODO: add timeout
template waitAny(condition: untyped): Window =
  block:
    var result = InvalidWindow
    block loop:
      while true:
        let windows = getTopLevelWindows()
        if windows.len == -1:
          break
        for window {.inject.} in windows:
          if condition:
            result = window
            break loop
    result


proc className(window: Window): string =
  getClassName(window)


proc clientPosition(window: Window, pos: wPoint = (0, 0)): wPoint =
  an_getClientPosition(window, pos)


proc clientPosition(window: Window, x, y: int): wPoint =
  an_getClientPositionXY(window, x, y)


proc send(
  text: string,
  raw = false,
  window = InvalidWindow,
  attach = false,
  restoreCapslock = false
) =
  an_sendToActiveWindow(
    text,
    raw,
    window,
    attach,
    restoreCapslock
  )
