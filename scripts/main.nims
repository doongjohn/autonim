use "hello"
use "fastclick"

onKeyUp do(keyCode: DWORD, shift, ctrl, alt: bool) -> bool:
  keyCode == Key_N
do():
  scriptRun "hello"

onKeyUp do(keyCode: DWORD, shift, ctrl, alt: bool) -> bool:
  keyCode == Key_OemPeriod and ctrl
do():
  scriptRun "fastclick"
do():
  scriptStop()
