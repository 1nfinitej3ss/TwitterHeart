#include <MegaServo.h>
// test sketch for MegaServo library
// this will sweep all servos back and forth once, then position according to voltage on potPin


//#define FIRST_SERVO_PIN  23  
//MegaServo Servos[MAX_SERVOS] ; // max servos is 32 for mega, 8 for other boards
#define NBR_SERVOS     33	  // the number of servos, up to 48 for Mega, 12 for other boards
#define FIRST_SERVO_PIN 13
MegaServo Servos[NBR_SERVOS] ; // max servos is 48 for mega, 12 for other boards

int pos = 0;      // variable to store the servo position 

void setup()
{
  
//     for( int i =0; i < MAX_SERVOS; i++)
//     Servos[i].attach( FIRST_SERVO_PIN +i, 800, 2200);
  for(int i=0; i < NBR_SERVOS; i++)
    Servos[i].attach(FIRST_SERVO_PIN +i);  


}

void loop()
{
    
    for( int i =0; i < MAX_SERVOS; i++){ 
      Servos[i].write( map(pos, 0,0,0,179));     // tell servo to go to position  
        delay(30); 
    }
    
    for( int i =0; i < MAX_SERVOS; i++){ 
      Servos[i].write( map(pos, 0,0,179,0));     // tell servo to go to position  
      delay(30);
    }
}
