proc execute =
  echo "fast click"
  while isScriptRunning():
    down()
    sleep(random(10 .. 30))
    up()
    sleep(random(50 .. 70))
  echo "fast click end"
