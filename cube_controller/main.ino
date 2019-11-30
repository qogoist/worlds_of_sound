//both libs can be found in the Arduino I2C dev libs, reffer REDME
#include "I2Cdev.h"
#include "MPU6050.h"

//the Arduino MIDI lib
#include <MIDI.h>

//the standard Arduino I2C lib, dosen't need to be downloadet seperadly
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    #include "Wire.h"
#endif

//orientation detection threshold
const int thr_x_plus = 15000;
const int thr_x_minus = -15000;
const int thr_y_plus = 15000;
const int thr_y_minus = -15000;
const int thr_z_plus = 15000;
const int thr_z_minus = -15000;

int side = 0;

//initialize the on the standard I2C adress of the MPU6050
MPU6050 accelgyro;

//initialize the MIDI lib
MIDI_CREATE_DEFAULT_INSTANCE();

//initialize vars for accelerometer values
int16_t acc_x, acc_y, acc_z;

void setup() {
    //start I2C communication
    #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
        Wire.begin();
    #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
        Fastwire::setup(400, true);
    #endif

    //stat MIDI communication
    MIDI.begin();

    //start serial communication
    Serial.begin(115200);

    //initialize accelerometer
    accelgyro.initialize();

    //verify connection
    Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
}

void loop() {
    //get acceleration data
    accelgyro.getAcceleration(&acc_x, &acc_y, &acc_z);

    // Serial.print(acc_x); Serial.print(" \t ");
    // Serial.print(acc_y); Serial.print(" \t ");
    // Serial.println(acc_z);

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z > thr_z_plus && acc_z > thr_z_minus) {//trigger if 1 is up
        // Serial.println("1");
        isSide(1);
    }

    if (acc_x > thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 2 is up
        // Serial.println("2");
        isSide(2);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z < thr_z_minus) {//trigger if 3 is up
        // Serial.println("3");
        isSide(3);
    }

    if (acc_x < thr_x_plus && acc_x < thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 4 is up
        // Serial.println("4");
        isSide(4);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y > thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 5 is up
        // Serial.println("5");
        isSide(5);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y < thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 6 is up
        // Serial.println("6");
        isSide(6);
    }
}

bool isSide(int currentSide)
{
    if (side != currentSide)
    {
        MIDI.sendNoteOff(60, 0 , 1);
        side = currentSide;
        MIDI.sendNoteOn(60, side * 20 - 10, 1); //Should send 10, 30, 50, 70, 90, 110, depending on side 1-6
    }
}