#include <MegaServo.h>

#define NBR_SERVOS     33	  // the number of servos, up to 48 for Mega, 12 for other boards
#define FIRST_SERVO_PIN 13
MegaServo Servos[NBR_SERVOS] ; // max servos is 48 for mega, 12 for other boards
int pos = 0;      // variable to store the servo position 

void setup() {

  // initialize serial communication:
  Serial.begin(9600);
  Serial1.begin(9600);

  // initialize the LED pin as an output:
  pinMode(13, OUTPUT);   	//set pin 13 as output
  
}

void loop() {
  if (Serial.available()) {
    int inByte = Serial.read();
    Serial1.write(inByte); 
   }    
   
     while(Serial1.available()){  //is there anything to read?
	char getData = Serial1.read();  //if yes, read it

// if it's a capital H (ASCII 72), turn on the LED and motors on:
  if(getData == 'a'){
   digitalWrite(13, HIGH);
   
    for(int i=0; i < NBR_SERVOS; i++)
      Servos[i].attach(FIRST_SERVO_PIN +i);      
    
    for( int i =0; i < MAX_SERVOS; i++){ 
      Servos[i].write( map(pos, 0,0,0,179));     // tell servo to go to position  
        delay(50); 
    }
    
    for( int i =0; i < MAX_SERVOS; i++){ 
      Servos[i].write( map(pos, 0,0,179,0));     // tell servo to go to position  
      delay(50);
    }

 }else if(getData == 'b'){
   digitalWrite(13, LOW);
   
   for(int i=0; i < NBR_SERVOS; i++)
     Servos[i].detach();      
}
  }
  
}
