use "hello"
use "goodbye"

onKeyUp do(keyCode: DWORD) -> bool:
  keyCode == Key_N
do():
  scriptRun "hello"

onKeyUp do(keyCode: DWORD) -> bool:
  keyCode == Key_F
do():
  scriptRun "goodbye"
do():
  scriptStop()
