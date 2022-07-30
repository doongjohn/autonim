use "hello"
use "fastclick"

onKeyUp do(keyCode: DWORD) -> bool:
  keyCode == Key_N
do():
  scriptRun "hello"

onKeyUp do(keyCode: DWORD) -> bool:
  ctrl and shift and alt and keyCode == Key_F
do():
  scriptRun "fastclick"
do():
  scriptStop()
