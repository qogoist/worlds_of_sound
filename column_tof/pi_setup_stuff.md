# Raspberry Pi TOF and OCD Setup Stuff

## Conections
* Connect TOF Sensor power and I2C to Raspberry Pi (look at pinout.jpeg for refference)

## Software setup raspberry pi
* flash the sd card with full [Raspian](https://www.raspberrypi.org/downloads/raspbian/) the desktop can be disabled later or directly after initial setup, the cli is all we realy need but the gui mekes setting up WiFi etc. a bit easier.
* Configure WiFi and set up a static IP-Adress to make it easier to connect to the pi via SSH and/or VNC to transfer Files and change settings without the need of a Monitor and Keyboard, Mouse
* Activate VNC, SSH and I2C in the settings menu
* Install Python Modules for TOF Sensor and OCD via the cli/terminal
* [TOF Module](https://github.com/pimoroni/vl53l1x-python)
``sudo pip3 install smbus2``
``sudo pip3 install vl53l1x``
* [OCD Module](https://github.com/attwad/python-osc)
``sudo pip3 install python-osc``
* [LED Module](https://github.com/adafruit/Adafruit_CircuitPython_NeoPixel)
``sudo pip3 install rpi_ws281x adafruit-circuitpython-neopixel``

## Copy and Modify files
* For now copy `send_tof_osc.py` to a convinient location and start it using the command `python3 <path to file>/send_tof_osc_single.py`