#!/usr/bin/env python3
#SETTINGS
SERVER_IP = "255.255.255.255"
SERVER_PORT = 6003
CUTOF_HEIGHT = 1500
OSC_ADDRESS_RECIVE = "/column3/leds"
OSC_ADDRESS_SEND = "/column3/height"
UPDATE_TIME_MICROS = 66000
INTER_MEASUREMENT_PERIOD_MILLIS = 70


import time
import sys
import signal
import board
import neopixel
import colorsys

import VL53L1X

from pythonosc import osc_message_builder
from pythonosc import udp_client
from pythonosc import dispatcher
from pythonosc import osc_server

print("""send_tof_osc.py

Press Ctrl+C to exit.

""")

# Setup Neopixel LED Strip
leds = neopixel.NeoPixel(board.D18, 60, auto_write=False)
leds.fill((0, 255, 0))
leds.show()

# Open and start the VL53L1X sensor.
# If you've previously used change-address.py then you
# should use the new i2c address here.
# If you're using a software i2c bus (ie: HyperPixel4) then
# you should `ls /dev/i2c-*` and use the relevant bus number.
tof = VL53L1X.VL53L1X(i2c_bus=1, i2c_address=0x29)
tof.open()

# Lower timing budgets allow for faster updates, but sacrifice accuracy
tof.set_timing(UPDATE_TIME_MICROS, INTER_MEASUREMENT_PERIOD_MILLIS)

tof.start_ranging(3)  # Start ranging
                      # 0 = Unchanged
                      # 1 = Short Range
                      # 2 = Medium Range
                      # 3 = Long Range

running = True

# Function to call when a osc message arrives
def manipulate_leds(osc_address, args):
    rgb_values = colorsys.hsv_to_rgb(args[0], args[1], args[2]) #colorsys expects percent in 0 to 1 as float
    leds.fill(rgb_values)
    leds.show()


# Setup OSC Client
# First Argument is the server ip-address and second one is the UDP port on wich the server listens
client = udp_client.SimpleUDPClient(SERVER_IP, SERVER_PORT, True)

# Setup and Start OSC Server
dispatcher = dispatcher.Dispatcher()
dispatcher.map(OSC_ADDRESS_RECIVE, manipulate_leds)
server = osc_server.BlockingOSCUDPServer((SERVER_IP, SERVER_PORT), dispatcher)

def exit_handler(signal, frame):
    leds.fill((0,0,0))
    leds.show()
    global running
    running = False
    tof.stop_ranging()
    print()
    sys.exit(0)
# Attach a signal handler to catch SIGINT (Ctrl+C) and exit gracefully
signal.signal(signal.SIGINT, exit_handler)




# Main loop
while running:
    distance_in_mm = tof.get_distance()
    if distance_in_mm >= CUTOF_HEIGHT:
        distance_in_mm = -1
    client.send_message(OSC_ADDRESS_SEND, distance_in_mm)
    print("OSC message sent, distance was {}mm".format(distance_in_mm))
    server.handle_request()