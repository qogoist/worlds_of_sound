#!/usr/bin/env python3
#SETTINGS
SERVER_IP = "255.255.255.255" # PC with Max and Abelton or Broadcast
PI_IP = "10.13.37.12" #Address of the PI
SERVER_PORT = 6003
CUTOFF_HEIGHT = 1500
OSC_ADDRESS_RECIVE_LEDS = "/column3/leds"
OSC_ADDRESS_RECIVE_CUTOFF = "/column3/cutoff"
OSC_ADDRESS_SEND = "/column3/height"
UPDATE_TIME_MICROS = 66000
INTER_MEASUREMENT_PERIOD_MILLIS = 70


import time
import sys
import signal
import board
import neopixel
import colorsys
import asyncio

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

#convert HSV to RGB and Scale
def hsv2rgb(h,s,v):
    return tuple(round(i * 255) for i in colorsys.hsv_to_rgb(h,s,v))

# Function to call when OSC changes cutoff height
def set_cutoff(osc_address, args):
    CUTOFF_HEIGHT = args
    print("Cutoff height set to {}mm".format(args))
# Function to call when a osc message arrives
def manipulate_leds(osc_address, h, s, v):
    rgb_values = hsv2rgb(h, s, v) #colorsys expects percent in 0 to 1 as float
    leds.fill(rgb_values)
    leds.show()
    print("LEDs Manipulated")
    print("Hue {}".format(h))
    print("Saturation {}".format(s))
    print("Value {}".format(v))

# Bind osc adress to function
dispatcher = dispatcher.Dispatcher()
dispatcher.map(OSC_ADDRESS_RECIVE_LEDS, manipulate_leds)
dispatcher.map(OSC_ADDRESS_RECIVE_CUTOFF, set_cutoff)

# Setup OSC Client
# First Argument is the server ip-address and second one is the UDP port on wich the server listens
client = udp_client.SimpleUDPClient(SERVER_IP, SERVER_PORT, True)

running = True

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
async def loop():
    while running:
        distance_in_mm = tof.get_distance()
        if distance_in_mm >= CUTOFF_HEIGHT:
            distance_in_mm = -1
        client.send_message(OSC_ADDRESS_SEND, distance_in_mm)
        print("OSC message sent, distance was {}mm".format(distance_in_mm))
        await asyncio.sleep(0)


async def init_main():
    # Setup and Start OSC Server
    server = osc_server.AsyncIOOSCUDPServer((PI_IP, SERVER_PORT), dispatcher, asyncio.get_event_loop())
    transport, protocol = await server.create_serve_endpoint()

    await loop()  # Enter main loop of program

    transport.close()  # Clean up serve endpoint


asyncio.run(init_main())