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

//Orientation and motion variables
int16_t ax, ay, az;
int16_t gx, gy, gz;

void setup()
{
// join I2C bus (I2Cdev library doesn't do this automatically)
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    Wire.begin();
#elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
    Fastwire::setup(400, true);
#endif

    // initialize serial communication
    // (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
    // it's really up to you depending on your project)
    Serial.begin(115200);

    // initialize device
    Serial.println("Initializing I2C devices...");
    accelgyro.initialize();

    // verify connection
    Serial.println("Testing device connections...");
    Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");

    // use the code below to change accel/gyro offset values
    
    Serial.println("Updating internal sensor offsets...");
    // -76	-2359	1688	0	0	0
    Serial.print(accelgyro.getXAccelOffset()); Serial.print("\t"); // -76
    Serial.print(accelgyro.getYAccelOffset()); Serial.print("\t"); // -2359
    Serial.print(accelgyro.getZAccelOffset()); Serial.print("\t"); // 1688
    Serial.print(accelgyro.getXGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getYGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getZGyroOffset()); Serial.print("\t"); // 0
    Serial.print("\n");
    accelgyro.setXGyroOffset(220);
    accelgyro.setYGyroOffset(76);
    accelgyro.setZGyroOffset(-85);
    Serial.print(accelgyro.getXAccelOffset()); Serial.print("\t"); // -76
    Serial.print(accelgyro.getYAccelOffset()); Serial.print("\t"); // -2359
    Serial.print(accelgyro.getZAccelOffset()); Serial.print("\t"); // 1688
    Serial.print(accelgyro.getXGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getYGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getZGyroOffset()); Serial.print("\t"); // 0
    Serial.print("\n");
    
}

void loop()
{
    // read raw accel/gyro measurements from device
    accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);

    // these methods (and a few others) are also available
    //accelgyro.getAcceleration(&ax, &ay, &az);
    // accelgyro.getRotation(&gx, &gy, &gz);

    Serial.print("aX: "); Serial.print(ax); Serial.print("\t");
    Serial.print("aY: "); Serial.print(ay); Serial.print("\t");
    Serial.print("aZ: "); Serial.print(az); Serial.print("\t");
    Serial.print("gX: "); Serial.print(gx); Serial.print("\t");
    Serial.print("gY: "); Serial.print(gy); Serial.print("\t");
    Serial.print("gZ: "); Serial.println(gz);
}