proc onMouseEvent*(event: MouseEventData) =
  # TODO: make mouse event api
  discard

type UserKeyboardEvent = tuple
  condition: proc(keyCode: DWORD): bool
  onScriptInactive: proc()
  onScriptRunning: proc()

var eventKeyDown = newSeq[UserKeyboardEvent]()
var eventKeyUp = newSeq[UserKeyboardEvent]()

var shift = false
var ctrl = false
var alt = false

proc onKeyDown(condition: proc(keyCode: DWORD): bool, onScriptInactive: proc(), onScriptRunning = proc() {.closure.} = discard) =
  eventKeyDown.add (
    condition,
    onScriptInactive,
    onScriptRunning
  )

proc onKeyUp(condition: proc(keyCode: DWORD): bool, onScriptInactive: proc(), onScriptRunning = proc() {.closure.} = discard) =
  eventKeyUp.add (
    condition,
    onScriptInactive,
    onScriptRunning
  )

proc onKeyboardEvent*(event: KeyboardEventData) =
  if event.keyState == WM_KEYDOWN:
    case event.keyCode:
    of Key_LShift: shift = true
    of Key_LCtrl: ctrl = true
    of Key_LAlt: alt = true
    else: discard

    for e in eventKeyDown:
      if e.condition(event.keyCode):
        if isScriptExecuting():
          e.onScriptRunning()
        else:
          e.onScriptInactive()

  if event.keyState == WM_KEYUP:
    case event.keyCode:
    of Key_LShift: shift = false
    of Key_LCtrl: ctrl = false
    of Key_LAlt: alt = false
    else: discard

    for e in eventKeyUp:
      if e.condition(event.keyCode):
        if isScriptExecuting():
          e.onScriptRunning()
        else:
          e.onScriptInactive()
