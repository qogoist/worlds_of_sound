#include <FastLED.h>
#include <SPI.h>

#define NUM_LEDS 54
#define LED_PIN 7
#define BRIGHTNESS 50

CRGB leds[NUM_LEDS];


float rate = 0;

void setup()
{
    Serial.println("Starting");
    FastLED.addLeds<WS2812, LED_PIN, GRB>(leds, NUM_LEDS);
    //FastLED.setBrightness(BRIGHTNESS);     //<= uncomment this if brightness is an issue.
}

void loop()
{
    fill_solid(leds, NUM_LEDS, CRGB::Green);
}