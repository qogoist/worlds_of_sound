#include <NewPing.h>
#include <MIDI.h>

#define SONAR_NUM 4
#define MAX_DISTANCE 50
#define multiplier 2

NewPing sonar[SONAR_NUM] = {
    NewPing(2, 3, MAX_DISTANCE),
    NewPing(6, 5, MAX_DISTANCE),
    NewPing(8, 9, MAX_DISTANCE),
    NewPing(12, 11, MAX_DISTANCE)};

MIDI_CREATE_DEFAULT_INSTANCE();

int distance = 0;

void setup()
{
    MIDI.begin();
    Serial.begin(115200);
}

void loop()
{
    for (int i = 0; i < SONAR_NUM; i++)
    {
        delay(30);
        distance = sonar[i].ping_cm();

        if (distance != 0)
        {
            // Serial.print("Sensor ");
            // Serial.print(i);
            // Serial.print(": ");
            // Serial.println(distance);

            MIDI.sendNoteOn(i+1, 127, 10);
        }
    }
}