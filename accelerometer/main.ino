//both libs can be found in the Arduino I2C dev libs, reffer REDME
#include "I2Cdev.h"
#include "MPU6050.h"

//the standard Arduino I2C lib, dosen't need to be downloadet seperadly
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    #include "Wire.h"
#endif

//initialize the on the standard I2C adress of the MPU6050
MPU6050 accelgyro;

//define vars for accelerometer values
int16_t acc_x, acc_y, acc_z;

void setup() {
    //start I2C communication
    #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
        Wire.begin();
    #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
        Fastwire::setup(400, true);
    #endif

    //start serial communication
    Serial.begin(9600);

    //initialize accelerometer
    accelgyro.initialize();

    //verify connection
    Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
}

void loop() {
    //get acceleration data
    accelgyro.getAcceleration(&acc_x, &acc_y, &acc_z);

    Serial.print(acc_x); Serial.print(" \t ");
    Serial.print(acc_y); Serial.print(" \t ");
    Serial.println(acc_z);
}