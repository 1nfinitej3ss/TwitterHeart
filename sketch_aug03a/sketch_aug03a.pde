#include <Servo.h> 

Servo Motor;

void setup() 
{ 
 Motor.attach(9);
} 

void loop()
{

 Motor.write(2000);              //Driving Servos Stop
 delay(1500);
 Motor.write(-500);              //Driving Servos Stop
 delay(1500);
}

