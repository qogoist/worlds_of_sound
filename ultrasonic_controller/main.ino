#include <NewPing.h>
#include <MIDI.h>

#define SONAR_NUM 2
#define MAX_DISTANCE 50
#define multiplier 2

NewPing sonar[SONAR_NUM] = {
    NewPing(2, 3, MAX_DISTANCE),
    NewPing(8, 9, MAX_DISTANCE)};

MIDI_CREATE_DEFAULT_INSTANCE();

int avDist = 0;
int distArray[multiplier * SONAR_NUM];
int note = 0;
int deltaNote = 0;

//Sorting stuff
int ar_length = 0;

void setup()
{
    MIDI.begin();
    Serial.begin(115200);
}

void loop()
{
    avDist = 0;
    
    for (int i = 0; i < SONAR_NUM * multiplier; i++)
    {
        delay(30);
        distArray[i] = sonar[i%2].ping_cm();
    }

    ar_length = sizeof(distArray) / sizeof(distArray[0]);
    qsort(distArray, ar_length, sizeof(distArray[0]), sort_asc);

    avDist = distArray[ar_length / 2 + 1];
    

    if (avDist > 10 && avDist < MAX_DISTANCE)
    {
        deltaNote = map(avDist, 10, MAX_DISTANCE, 0, 127);

        if (deltaNote != note)
        {
            note = deltaNote;
            MIDI.sendNoteOn(note, 127, 1);
        }
    }

    //Serial.println(avDist);
}

int sort_asc(const void *cmp1, const void *cmp2)
{
    int a = *((int *)cmp1);
    int b = *((int *)cmp2);

    return a < b ? -1 : (a > b ? 1 : 0);
}