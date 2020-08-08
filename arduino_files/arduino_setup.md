# Arduino Setup

## Setup

### Libraries
These libraries must be installed to flash the sketch onto the Arduino. *Note: The sketch as is is only compatible with the Arduino Nano 33 IOT*
* [FastLED](https://github.com/FastLED/FastLED) for LED stripes.
* **OSC:** [CNMAT OSC Library](https://github.com/CNMAT/OSC) for the Arduino, and the *CNMAT Externals* package in Max (can be installed via the package manager).
* [WiFiNINA](https://www.arduino.cc/en/Reference/WiFiNINA) to connect with the wifi chip built into the arduino nano 33 iot.
* [ArduinoLSM6DS3](https://www.arduino.cc/en/Reference/ArduinoLSM6DS3) to use the built in gyroscope and accelerometer.

## Configuration
Define the SSID as well as the password of your WIFI network in the secrets.h file. Here, you can also set the IP address your Arduino will occupy in your network, as well as a Target IP and Port (We suggest leaving the Target IP and Port as is if you want the messages to be broadcast through your network). Last but not least, set the message paths for the sides following the pattern `"/cubeX/sideY"`.

Once all the settings are configured you can upload the sketch to your Arduino.

## Usage
The Arduino should connect to the chosen network. Once it is connected you will see a green light flashing, if not, check your settings for any errors. 

The Arduino will continuously send OSC messages to the chosen IP and Port and can receive message under the chosen iP and Port 5000. Incoming messages should be OSC message following the format `/sideX/H S V`, where X is a number between 1 and 6, and H,S,V are hue, saturation, and value numbers between 0 and 255.