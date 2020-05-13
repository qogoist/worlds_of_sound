import time
import sys
import signal

import VL53L1X

from pythonosc import osc_message_builder
from pythonosc import udp_client

UPDATE_TIME_MICROS = 66000
INTER_MEASUREMENT_PERIOD_MILLIS = 70

print("""send_tof_osc.py

Press Ctrl+C to exit.

""")

# Open and start the VL53L1X sensor.
# If you've previously used change-address.py then you
# should use the new i2c address here.
# If you're using a software i2c bus (ie: HyperPixel4) then
# you should `ls /dev/i2c-*` and use the relevant bus number.
tof_1 = VL53L1X.VL53L1X(i2c_bus=1, i2c_address=0x29)
tof_2 = VL53L1X.VL53L1X(i2c_bus=1, i2c_address=0x33)
tof_1.open()
tof_2.open()

# Lower timing budgets allow for faster updates, but sacrifice accuracy
tof_1.set_timing(UPDATE_TIME_MICROS, INTER_MEASUREMENT_PERIOD_MILLIS)
tof_2.set_timing(UPDATE_TIME_MICROS, INTER_MEASUREMENT_PERIOD_MILLIS)

tof_1.start_ranging(1)  # Start ranging
                      # 0 = Unchanged
                      # 1 = Short Range
                      # 2 = Medium Range
                      # 3 = Long Range
tof_2.start_ranging(1)  # Start ranging

running = True

# Setup OSC Client
# First Argument is the server ip-adress and second one is the UDP port on wich the server listens
client = udp_client.SimpleUDPClient("10.17.42.10", 5005)

def exit_handler(signal, frame):
    global running
    running = False
    tof_1.stop_ranging()
    tof_2.stop_ranging()
    print()
    sys.exit(0)
# Attach a signal handler to catch SIGINT (Ctrl+C) and exit gracefully
signal.signal(signal.SIGINT, exit_handler)



# Main loop
while running:
    distance_in_mm = tof_1.get_distance()
    distance_in_mm_2 = tof_2.get_distance()
    client.send_message("/col/1", distance_in_mm)
    print("OSC message sent, distance1 was {}mm".format(distance_in_mm))
    print("OSC message sent, distance2 was {}mm".format(distance_in_mm_2))
    time.sleep(0.1)