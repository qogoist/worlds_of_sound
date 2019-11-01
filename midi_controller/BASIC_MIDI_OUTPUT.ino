#include <MIDI.h>
#include <Bounce2.h>
#include <Ultrasonic.h>

#define buttonPin1 6
#define buttonPin2 2
#define poti A0
#define ledPin 8

Bounce pushButton1 = Bounce(buttonPin1, 10);
Bounce pushButton2 = Bounce(buttonPin2, 10);

int potiValue = 0;
int deltaPoti = 0;

int ultrasonicValue = 0;
int deltaUltrasonic = 0;


Ultrasonic ultrasonic(7);

MIDI_CREATE_DEFAULT_INSTANCE();

void setup()
{
    pinMode(buttonPin1, INPUT_PULLUP);
    pinMode(ledPin, OUTPUT);

    MIDI.begin();
    Serial.begin(115200);
}

void loop()
{
    potiValue = analogRead(poti);

    ultrasonicValue = ultrasonic.MeasureInCentimeters();
    if (ultrasonicValue - deltaUltrasonic < -3 || ultrasonicValue - deltaUltrasonic > 3)
    {
        if (ultrasonicValue < 45)
        {
            int note = ultrasonicValue * 3;
            MIDI.sendNoteOn(note, 127, 3);
            
        }
        deltaUltrasonic = ultrasonicValue;
    }


    if (potiValue - deltaPoti < -3 || potiValue - deltaPoti > 3)
    {
        int note = potiValue / 8;
        MIDI.sendNoteOn(note, 127, 2);
        //MIDI.sendNoteOff(note, 127, 2);
        deltaPoti = potiValue;
    }

    if (pushButton1.update())
    {
        if (pushButton1.risingEdge())
        {
            digitalWrite(ledPin, LOW);

            MIDI.sendNoteOn(1, 127, 1);
        }

        if (pushButton1.fallingEdge())
        {
            digitalWrite(ledPin, HIGH);

            MIDI.sendNoteOff(1, 0, 1);
        }
    }

    if (pushButton2.update())
    {
        if (pushButton2.risingEdge())
        {
            digitalWrite(ledPin, LOW);

            MIDI.sendNoteOn(2, 127, 1);
        }

        if (pushButton2.fallingEdge())
        {
            digitalWrite(ledPin, HIGH);

            MIDI.sendNoteOff(2, 0, 1);
        }
    }
}