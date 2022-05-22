use "hello"
use "goodbye"

proc onMouseEvent*(event: MouseEventData) =
  discard

proc onKeyboardEvent*(event: KeyboardEventData) =
  if event.keyState == WM_KEYUP and event.data.vkCode == Key_N:
    if not isAutomationExecuting():
      echo "run"
      automationRun "hello"

  if event.keyState == WM_KEYUP and event.data.vkCode == Key_F:
    if isAutomationExecuting():
      automationStop()
    else:
      automationRun "goodbye"
