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
        MIDI.sendNoteOn(1, 127, 1);
    }

    if (acc_x > thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 2 is up
        // Serial.println("2");
        MIDI.sendNoteOn(2, 127, 1);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z < thr_z_minus) {//trigger if 3 is up
        // Serial.println("3");
        MIDI.sendNoteOn(3, 127, 1);
    }

    if (acc_x < thr_x_plus && acc_x < thr_x_minus && acc_y < thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 4 is up
        // Serial.println("4");
        MIDI.sendNoteOn(4, 127, 1);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y > thr_y_plus && acc_y > thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 5 is up
        // Serial.println("5");
        MIDI.sendNoteOn(5, 127, 1);
    }

    if (acc_x < thr_x_plus && acc_x > thr_x_minus && acc_y < thr_y_plus && acc_y < thr_y_minus && acc_z < thr_z_plus && acc_z > thr_z_minus) {//trigger if 6 is up
        // Serial.println("6");
        MIDI.sendNoteOn(6, 127, 1);
    }
}