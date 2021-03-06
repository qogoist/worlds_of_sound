#include <OSCBundle.h>
#include <OSCBoards.h>
#include <OSCMessage.h>
#include <Arduino_LSM6DS3.h>
#include <SPI.h>
#include <WiFiNINA.h>
#include <WifiUdp.h>
#include <FastLED.h>

#define NUM_LEDS 54
#define LED_PIN 10
#define BRIGHTNESS 50
CRGB rawleds[NUM_LEDS];
CRGBSet leds(rawleds, NUM_LEDS);
CRGBSet side1(leds(0, 8));
CRGBSet side2(leds(9, 17));
CRGBSet side3(leds(18, 26));
CRGBSet side4(leds(27, 35));
CRGBSet side5(leds(36, 44));
CRGBSet side6(leds(45, 53));

float ax, ay, az;
int s1, s2, s3, s4, s5, s6;
int currentSide;
int currentSideTreshold = 50;

int status = WL_IDLE_STATUS;
#include "secrets.h"
char ssid[] = SECRET_SSID;
char pass[] = SECRET_PASS;
IPAddress targetIp;
IPAddress ip;
uint16_t targetPort = TARGET_PORT;
unsigned int localPort = 5000;

WiFiUDP Udp;

void setup()
{
    Serial.begin(9600);
    // while (!Serial);

    FastLED.addLeds<WS2812, LED_PIN, GRB>(leds, NUM_LEDS);
    FastLED.setBrightness(BRIGHTNESS);

    fill_solid(leds, NUM_LEDS, CRGB::HotPink);
    FastLED.show();
    FastLED.delay(1000);

    turnAllOff();
    FastLED.delay(1000);

    // check for IMU module:
    if (!IMU.begin())
    {
        Serial.println("Failed to initialize IMU!");

        for (int dot = 0; dot < NUM_LEDS; dot++)
        {
            leds[dot] = CRGB::Red;
        }
        FastLED.show();

        while (1)
            ;
    }

    // check for the WiFi module:
    if (WiFi.status() == WL_NO_MODULE)
    {
        Serial.println("Communication with WiFi module failed!");

        for (int dot = 0; dot < NUM_LEDS; dot++)
        {
            leds[dot] = CRGB::Red;
        }
        FastLED.show();

        // don't continue
        while (true);
    }

    ip.fromString(IP);
    WiFi.config(ip);

    // attempt to connect to Wifi network:
    while (status != WL_CONNECTED)
    {
        Serial.print("Attempting to connect to SSID: ");
        Serial.println(ssid);
        // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
        status = WiFi.begin(ssid, pass);

        for (int dot = 0; dot < NUM_LEDS; dot++)
        {
            leds[dot] = CRGB::Yellow;
            FastLED.show();
            FastLED.delay(200);

            leds[dot] = CRGB::Black;
            FastLED.show();
        }
        FastLED.delay(1000);
        turnAllOff();
        FastLED.delay(1000);
    }
    Serial.println("Connected to wifi");
    printWifiStatus();

    fill_solid(leds, NUM_LEDS, CRGB::Green);
    FastLED.show();

    Serial.println("\nStarting connection to server...");
    Serial.println(Udp.begin(localPort));
    targetIp.fromString(TARGET_IP);

    FastLED.delay(2000);
    turnAllOff();
}

void loop()
{
    //Get acceleration data if available
    if (IMU.accelerationAvailable())
    {
        IMU.readAcceleration(ax, ay, az);
    }

    //Map the values of the vector to the sides of the cube.
    s1 = round(mapValue(ay, 1, -4, 0, 127));
    s6 = round(mapValue(ay, -1, 4, 0, 127));
    s2 = round(mapValue(az, 1, -4, 0, 127));
    s5 = round(mapValue(az, -1, 4, 0, 127));
    s4 = round(mapValue(ax, 1, -4, 0, 127));
    s3 = round(mapValue(ax, -1, 4, 0, 127));

    //Determine which side is on top and set to currentSide
    if (s1 >= currentSideTreshold)
    {
        currentSide = 1;
    }
    else if (s2 >= currentSideTreshold)
    {
        currentSide = 2;
    }
    else if (s3 >= currentSideTreshold)
    {
        currentSide = 3;
    }
    else if (s4 >= currentSideTreshold)
    {
        currentSide = 4;
    }
    else if (s5 >= currentSideTreshold)
    {
        currentSide = 5;
    }
    else if (s6 >= currentSideTreshold)
    {
        currentSide = 6;
    }

    //Creating the OSC Bundle
    OSCBundle bndlOut;
    bndlOut.add(SIDE1).add((float)s1);
    bndlOut.add(SIDE2).add((float)s2);
    bndlOut.add(SIDE3).add((float)s3);
    bndlOut.add(SIDE4).add((float)s4);
    bndlOut.add(SIDE5).add((float)s5);
    bndlOut.add(SIDE6).add((float)s6);
    bndlOut.add(SIDECURRENT).add(currentSide);

    //Send the OSC package via UDP to the defined IP and Port
    Udp.beginPacket(targetIp, targetPort);
    bndlOut.send(Udp);
    Udp.endPacket();
    bndlOut.empty();

    OSCBundle bndlIN;

    int packetSize = Udp.parsePacket();
    if (packetSize)
    {
        Serial.println("Message Received!");
        while (packetSize--)
            bndlIN.fill(Udp.read());

        if (!bndlIN.hasError())
        {
            bndlIN.dispatch("/side1", s1_dispatch, 0);
            bndlIN.dispatch("/side2", s2_dispatch, 0);
            bndlIN.dispatch("/side3", s3_dispatch, 0);
            bndlIN.dispatch("/side4", s4_dispatch, 0);
            bndlIN.dispatch("/side5", s5_dispatch, 0);
            bndlIN.dispatch("/side6", s6_dispatch, 0);
        }
    }
}

double mapValue(double value, double in_min, double in_max, double out_min, double out_max)
{
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}

void printWifiStatus()
{
    // print the SSID of the network you're attached to:
    Serial.print("SSID: ");
    Serial.println(WiFi.SSID());

    // print your board's IP address:
    IPAddress ip = WiFi.localIP();
    Serial.print("IP Address: ");
    Serial.println(ip);

    // print the received signal strength:
    long rssi = WiFi.RSSI();
    Serial.print("signal strength (RSSI):");
    Serial.print(rssi);
    Serial.println(" dBm");
}

void turnAllOff()
{
    fill_solid(leds, NUM_LEDS, CHSV(0, 0, 0));
    FastLED.show();
}

// SIDE 1: 0 - 8
// SIDE 2: 9 - 17
// SIDE 3: 18 - 26
// SIDE 4: 27 - 35
// SIDE 5: 36 - 44
// SIDE 6: 45 - 53

void s1_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side1, 9, CHSV(h, s, v));
    FastLED.show();
}

void s2_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side2, 9, CHSV(h, s, v));
    FastLED.show();
}

void s3_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side3, 9, CHSV(h, s, v));
    FastLED.show();
}

void s4_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side4, 9, CHSV(h, s, v));
    FastLED.show();
}

void s5_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side5, 9, CHSV(h, s, v));
    FastLED.show();
}

void s6_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    fill_solid(side6, 9, CHSV(h, s, v));
    FastLED.show();
}