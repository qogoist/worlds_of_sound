#!/usr/bin/env python3
# SETTINGS
from pythonosc import osc_server
from pythonosc import dispatcher
from pythonosc import udp_client
from pythonosc import osc_message_builder
import VL53L1X
import asyncio
import colorsys
import neopixel
import board
import signal
import sys
import time

SERVER_IP = "255.255.255.255"  # PC with Max and Abelton or Broadcast
PI_IP = "10.13.37.10"  # Address of the PI
SERVER_PORT = 6001
COLUMN = "/column1"
OSC_ADDRESS_RECIVE_LEDS = COLUMN + "/leds"
OSC_ADDRESS_RECIVE_CUTOFF = COLUMN + "/cutoff"
OSC_ADDRESS_RECIVE_MIN_BRIGHTNESS = COLUMN + "/min_brightness"
OSC_ADDRESS_RECIVE_MAX_BRIGHTNESS = COLUMN + "/max_brightness"
OSC_ADDRESS_SEND = COLUMN + "/height"
UPDATE_TIME_MICROS = 66000
INTER_MEASUREMENT_PERIOD_MILLIS = 70

cutoff_height = 1500
value_h = 0
value_s = 1
value_v = 0
min_brightness = 0
max_brightness = 1


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

# convert HSV to RGB and Scale
def hsv2rgb(h, s, v):
    return tuple(round(i * 255) for i in colorsys.hsv_to_rgb(h, s, v))

# map value
def map_value(value, in_min, in_max, out_min, out_max):
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

# Function to call when OSC changes cutoff height
def set_cutoff(osc_address, args):
    global cutoff_height
    cutoff_height = args
    print("Cutoff height set to {}mm".format(args))

# Function to call when OSC changes cutoff height
def set_max_brightness(osc_address, args):
    global max_brightness
    max_brightness = args
    print("Max Brightness set to {}".format(args))

# Function to call when OSC changes cutoff height
def set_min_brightness(osc_address, args):
    global min_brightness
    min_brightness = args
    print("Min Brightness set to {}".format(args))

# Function to call when a osc message arrives
def manipulate_leds(osc_address, h, s, v):
    global value_h, value_s, value_v
    value_h = h
    value_s = s
    value_v = v
    print("LEDs Manipulated")
    print("Hue {}".format(h))
    print("Saturation {}".format(s))
    print("Value {}".format(v))


# Bind osc adress to function
dispatcher = dispatcher.Dispatcher()
dispatcher.map(OSC_ADDRESS_RECIVE_LEDS, manipulate_leds)
dispatcher.map(OSC_ADDRESS_RECIVE_CUTOFF, set_cutoff)
dispatcher.map(OSC_ADDRESS_RECIVE_MIN_BRIGHTNESS, set_min_brightness)
dispatcher.map(OSC_ADDRESS_RECIVE_MAX_BRIGHTNESS, set_max_brightness)

# Setup OSC Client
# First Argument is the server ip-address and second one is the UDP port on wich the server listens
client = udp_client.SimpleUDPClient(SERVER_IP, SERVER_PORT, True)

running = True


def exit_handler(signal, frame):
    leds.fill((0, 0, 0))
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
    global cutoff_height, value_h, value_s, value_v, min_brightness, max_brightness
    while running:
        distance_in_mm = tof.get_distance()
        if distance_in_mm >= cutoff_height:
            distance_in_mm = -1
            rgb = (0, 0, 0)
        else:
            value_v = map_value(distance_in_mm, 0, cutoff_height,
                                min_brightness, max_brightness)
            rgb = hsv2rgb(value_h, value_s, value_v)
        client.send_message(OSC_ADDRESS_SEND, distance_in_mm)
        print("OSC message sent, distance was {}mm".format(distance_in_mm))
        leds.fill(rgb)
        leds.show()
        await asyncio.sleep(0.1)


async def init_main():
    # Setup and Start OSC Server
    server = osc_server.AsyncIOOSCUDPServer(
        (PI_IP, SERVER_PORT), dispatcher, asyncio.get_event_loop())
    transport, protocol = await server.create_serve_endpoint()

    await loop()  # Enter main loop of program

    transport.close()  # Clean up serve endpoint


asyncio.run(init_main())
