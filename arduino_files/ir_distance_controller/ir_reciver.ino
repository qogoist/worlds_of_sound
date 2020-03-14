#include <MIDI.h>

#define ir A0
#define poti A1

MIDI_CREATE_DEFAULT_INSTANCE();

int ir_akt = 0;
int ir_map_akt = 0;
int ir_map_last = 0;
int ir_sum = 0;

int poti_akt = 0;
int poti_last = 0;

void setup()
{
    MIDI.begin();
    Serial.begin(115200);
}

void loop()
{
    //code for ir sens
    ir_sum = 0;
    for(int i=0; i<100; i++) {
        ir_sum = ir_sum+float(analogRead(ir));
    }
    ir_akt = ir_sum/100;

    if(ir_akt > 100 && ir_akt < 320) {
        ir_map_akt = map(ir_akt, 100, 320, 0, 127);
    }

    if(ir_map_akt - ir_map_last > 6 || ir_map_last - ir_map_akt > 6) {
        ir_map_last = ir_map_akt;
        MIDI.sendNoteOn(ir_map_akt, 127, 1);
    }

    //code for poti
    poti_akt = analogRead(poti);
    if(poti_akt - poti_last > 10 || poti_last - poti_akt > 10) {
        MIDI.sendNoteOn(map(poti_akt, 0, 1023, 0, 127), 127, 2);
        poti_last = poti_akt;
    }
}