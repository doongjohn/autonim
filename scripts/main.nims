use "hello"
use "goodbye"

onKeyUp do(keyCode: DWORD, shift, ctrl, alt: bool) -> bool:
  keyCode == Key_N
do():
  scriptRun "hello"

onKeyUp do(keyCode: DWORD, shift, ctrl, alt: bool) -> bool:
  keyCode == Key_F
do():
  scriptRun "goodbye"
do():
  scriptStop()
