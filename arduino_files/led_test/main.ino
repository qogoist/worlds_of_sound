#include <FastLED.h>
#include <SPI.h>
#include <WiFiNINA.h>
#include <WifiUdp.h>
#include <OSCBundle.h>
#include <OSCMessage.h>
#include <OSCBoards.h>

#define NUM_LEDS 54
#define LED_PIN 7

CRGB leds[NUM_LEDS];

int status = WL_IDLE_STATUS;
#include "secrets.h"
char ssid[] = SECRET_SSID;
char pass[] = SECRET_PASS;
IPAddress ip;
unsigned int localPort = 2390;
char packetBuffer[255]; //Holds incoming packets

WiFiUDP Udp;

void setup()
{
    Serial.begin(9600);
    while (!Serial)
        ;

    Serial.println("Starting");
    FastLED.addLeds<WS2812, LED_PIN, GRB>(leds, NUM_LEDS);

    for (int dot = 0; dot < NUM_LEDS; dot++)
    {
        leds[dot] = CRGB::HotPink;
    }
    FastLED.show();
    delay(1000);

    turnAllOff();
    delay(1000);

    // check for the WiFi module:
    if (WiFi.status() == WL_NO_MODULE)
    {
        for (int dot = 0; dot < NUM_LEDS; dot++)
        {
            leds[dot] = CRGB::Red;
        }
        FastLED.show();
        Serial.println("Failed to initialize IMU!");
        // don't continue
        while (true)
            ;
    }

    // ip.fromString(IP);
    // WiFi.config(ip);

    // attempt to connect to Wifi network:
    while (status != WL_CONNECTED)
    {
        Serial.println("Connecting to wifi");

        // Connect to WPA/WPA2 network. Change this line if using open or WEP network:
        status = WiFi.begin(ssid, pass);

        for (int dot = 0; dot < NUM_LEDS; dot++)
        {
            leds[dot] = CRGB::Yellow;
            FastLED.show();
            delay(200);
        }
        delay(1000);
        turnAllOff();
        delay(1000);
    }

    Serial.println("Connected to wifi");
    printWifiStatus();

    for (int dot = 0; dot < NUM_LEDS; dot++)
    {
        leds[dot] = CRGB::Green;
    }
    FastLED.show();

    Udp.begin(localPort);
    delay(2000);

    turnAllOff();
}

void loop()
{
    OSCBundle bundleIN;

    int packetSize = Udp.parsePacket();
    if (packetSize)
    {
        Serial.println("Message Received!");
        while (packetSize--)
            bundleIN.fill(Udp.read());

        if (!bundleIN.hasError())
        {
            bundleIN.dispatch("/side1", s1_dispatch, 0);
            bundleIN.dispatch("/side2", s2_dispatch, 0);
            bundleIN.dispatch("/side3", s3_dispatch, 0);
            bundleIN.dispatch("/side4", s4_dispatch, 0);
            bundleIN.dispatch("/side5", s5_dispatch, 0);
            bundleIN.dispatch("/side6", s6_dispatch, 0);
        }
    }
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

    for (int dot = 0; dot < 9; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void s2_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    for (int dot = 9; dot < 18; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void s3_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    for (int dot = 18; dot < 27; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void s4_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    for (int dot = 27; dot < 36; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void s5_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    for (int dot = 36; dot < 45; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void s6_dispatch(OSCMessage &msg)
{
    int h = msg.getInt(0);
    int s = msg.getInt(1);
    int v = msg.getInt(2);

    for (int dot = 45; dot < 54; dot++)
    {
        leds[dot].setHSV(h, s, v);
    }
    FastLED.show();
}

void turnAllOff()
{
    for (int dot = 0; dot < NUM_LEDS; dot++)
    {
        leds[dot] = CRGB::Black;
    }
    FastLED.show();
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
