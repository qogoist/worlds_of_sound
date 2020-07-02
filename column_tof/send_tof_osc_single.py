#!/usr/bin/env python3
#SETTINGS
SERVER_IP = "255.255.255.255"
SERVER_PORT = 6001
UPDATE_TIME_MICROS = 66000
INTER_MEASUREMENT_PERIOD_MILLIS = 70


import time
import sys
import signal
import board
import neopixel

import VL53L1X

from pythonosc import osc_message_builder
from pythonosc import udp_client

print("""send_tof_osc.py

Press Ctrl+C to exit.

""")

# Open and start the VL53L1X sensor.
# If you've previously used change-address.py then you
# should use the new i2c address here.
# If you're using a software i2c bus (ie: HyperPixel4) then
# you should `ls /dev/i2c-*` and use the relevant bus number.
tof = VL53L1X.VL53L1X(i2c_bus=1, i2c_address=0x29)
tof.open()

# Lower timing budgets allow for faster updates, but sacrifice accuracy
tof.set_timing(UPDATE_TIME_MICROS, INTER_MEASUREMENT_PERIOD_MILLIS)

tof.start_ranging(1)  # Start ranging
                      # 0 = Unchanged
                      # 1 = Short Range
                      # 2 = Medium Range
                      # 3 = Long Range

running = True

# Setup OSC Client
# First Argument is the server ip-adress and second one is the UDP port on wich the server listens
client = udp_client.SimpleUDPClient(SERVER_IP, SERVER_PORT, True)

def exit_handler(signal, frame):
    global running
    running = False
    tof.stop_ranging()
    print()
    sys.exit(0)
# Attach a signal handler to catch SIGINT (Ctrl+C) and exit gracefully
signal.signal(signal.SIGINT, exit_handler)

# Setup Neopixel LED Strip
leds = neopixel.NeoPixel(board.D18, 60)


# Main loop
while running:
    distance_in_mm = tof.get_distance()
    client.send_message("/column1/height", distance_in_mm)
    print("OSC message sent, distance was {}mm".format(distance_in_mm))