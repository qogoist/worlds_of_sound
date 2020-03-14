#include "I2Cdev.h"
#include "MPU6050.h"

#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
#include "Wire.h"
#endif

#include<OSCBundle.h>
#include<OSCBoards.h>

#ifdef BOARD_HAS_USB_SERIAL
#include <SLIPEncodedUSBSerial.h>
SLIPEncodedUSBSerial SLIPSerial( thisBoardsSerialUSB );
#else
#include <SLIPEncodedSerial.h>
 SLIPEncodedSerial SLIPSerial(Serial);
#endif

MPU6050 accelgyro;

MIDI_CREATE_DEFAULT_INSTANCE();

int16_t ax, ay, az;
double length;
double fx, fy, fz;
int s1, s2, s3, s4, s5, s6;

void setup()
{
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    Wire.begin();
#elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
    Fastwire::setup(400, true);
#endif

    SLIPSerial.begin(38400);
    accelgyro.initialize();
    accelgyro.setXAccelOffset(472);
    accelgyro.setYAccelOffset(350);
    accelgyro.setZAccelOffset(1344);
}

void loop()
{
    accelgyro.getAcceleration(&ax, &ay, &az);

    length = sqrt(pow(ax, 2) + pow(ay, 2) + pow(az, 2));

    fx = ax / length;
    fy = ay / length;
    fz = az / length;

    s1 = round(mapValue(fy, 1, -1, 0, 100));
    s6 = round(mapValue(fy, -1, 1, 0, 100));
    s2 = round(mapValue(fz, 1, -1, 0, 100));
    s5 = round(mapValue(fz, -1, 1, 0, 100));
    s4 = round(mapValue(fx, 1, -1, 0, 100));
    s3 = round(mapValue(fx, -1, 1, 0, 100));

    OSCBundle bndl;
    
    bndl.add("/cube1/side1").add(s1);
    bndl.add("/cube1/side2").add(s2);
    bndl.add("/cube1/side3").add(s3);
    bndl.add("/cube1/side4").add(s4);
    bndl.add("/cube1/side5").add(s5);
    bndl.add("/cube1/side6").add(s6);


    SLIPSerial.beginPacket();  
        bndl.send(SLIPSerial);
    SLIPSerial.endPacket(); 
    bndl.empty();
    
    delay(20);

    // Serial.print("X: "); Serial.print(fx); Serial.print("\t");
    // Serial.print("Y: "); Serial.print(fy); Serial.print("\t");
    // Serial.print("Z: "); Serial.print(fz); Serial.print("\t");
    // Serial.print("s1: "); Serial.print(s1); Serial.print("\t");
    // Serial.print("s6: "); Serial.print(s6); Serial.print("\t");
    // Serial.print("s2: "); Serial.print(s2); Serial.print("\t");
    // Serial.print("s5: "); Serial.print(s5); Serial.print("\t");
    // Serial.print("s3: "); Serial.print(s3); Serial.print("\t");
    // Serial.print("s4: "); Serial.print(s4); Serial.print("\n");
}

double mapValue(double value, double in_min, double in_max, double out_min, double out_max)
{
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}