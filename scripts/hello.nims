proc execute =
  echo "hello script"

  # Open "Run" box
  send("#r")

  # Start notepad.exe
  send("notepad{enter}")

  # Wait the window
  let notepad = waitAny(window.className == "Notepad" and window.isActive)

  # Send some words
  send("μλ, μΈμ!{enter}")

  # Drag the mouse cursor to select
  clickDrag(pos1 = notepad.clientPosition(20, 120), pos2 = notepad.clientPosition(20, 100))

  # Copy it
  send("^c{right}")

  # Paste 10 times slowly
  opt("SendKeyDelay", 250)
  send("^{v 10}")

  # Terminates the process
  kill(notepad)
