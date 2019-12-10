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

bool side1 = false;
bool side2 = false;
bool side3 = false;
bool side4 = false;

bool isSending1 = false;
bool isSending2 = false;
bool isSending3 = false;
bool isSending4 = false;

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
        //Serial.print("Distance: ");
        //Serial.println(distance);

        if (distance > 0)
        {
            switch (i + 1)
            {
            case 1:
                if (!isSending1)
                {
                    side1 = !side1;

                    if (side1)
                        MIDI.sendNoteOn(i + 1, 127, 10);
                    //Serial.println(i + 1);
                    else
                        MIDI.sendNoteOn(5 * (i + 1), 127, 10);
                    //Serial.println(5 * (i + 1));
                }


                isSending1 = true;
                break;

            case 2:
                if (!isSending2)
                {
                    side2 = !side2;

                    if (side2)
                        MIDI.sendNoteOn(i + 1, 127, 10);
                    //Serial.println(i + 1);
                    else
                        MIDI.sendNoteOn(5 * (i + 1), 127, 10);
                    //Serial.println(5 * (i + 1));
                }


                isSending2 = true;
                break;

            case 3:
                if (!isSending3)
                {
                    side3 = !side3;

                    if (side3)
                        MIDI.sendNoteOn(i + 1, 127, 10);
                    //Serial.println(i + 1);
                    else
                        MIDI.sendNoteOn(5 * (i + 1), 127, 10);
                    //Serial.println(5 * (i + 1));
                }


                isSending3 = true;
                break;

            case 4:
                if (!isSending4)
                {
                    side4 = !side4;

                    if (side4)
                        MIDI.sendNoteOn(i + 1, 127, 10);
                    //Serial.println(i + 1);
                    else
                        MIDI.sendNoteOn(5 * (i + 1), 127, 10);
                    //Serial.println(5 * (i + 1));
                }


                isSending4 = true;
                break;

            default:
                break;
            }
        }
        else
        {
            switch (i + 1)
            {
            case 1:
                isSending1 = false;
                break;

            case 2:
                isSending2 = false;
                break;

            case 3:
                isSending3 = false;
                break;

            case 4:
                isSending4 = false;
                break;

            default:
                break;
            }
        }
    }
}