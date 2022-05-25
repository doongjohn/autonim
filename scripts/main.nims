use "hello"
use "goodbye"

onKeyUp do(keyCode: DWORD) -> bool:
  keyCode == Key_N
do():
  automationRun "hello"

onKeyUp do(keyCode: DWORD) -> bool:
  keyCode == Key_N
do():
  automationRun "goodbye"
do():
  automationStop()
