import RPi.GPIO as GPIO
import time
import subprocess

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)

print("Ready for input...")

while(True):
  GPIO.setup(12, GPIO.IN, pull_up_down=GPIO.PUD_UP)

  if GPIO.input(12) == 0:
      subprocess.call("./snap.sh")
      print("\n Ready for input...")

  time.sleep(0.1)
