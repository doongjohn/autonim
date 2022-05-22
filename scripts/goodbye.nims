proc execute =
  echo "goodbye script"
  echo "loop start"
  while isAutomationRunning():
    down()
    sleep(10)
    up()
    sleep(1000)
  echo "loop end"
