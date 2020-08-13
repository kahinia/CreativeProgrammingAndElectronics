/*
  DesInv 23- Summer 2020
  Kahini Achrekar
  August 12, 2020
  
  This program is part of the Doodle Bot and ocntians the communication and commands for the bot. 
*/
const int in1 13                                                                          
const int in2 12                                                                           
const int in3 8                                                                           
const int in4 9                                                                          
const int motorASpeedPin 11                  
const int motorBSpeedPin 10                  
char val;          
             
//Forward drives both motors                
void forward(int x, int y, int motorSpeed, int speedPin) {                  
 digitalWrite(x, HIGH);                  
 digitalWrite(y, LOW);                  
 analogWrite(speedPin, motorSpeed);                  
}             
                 
///Drives both motors backwards         
               
void backward(int x, int y, int motorSpeed, int speedPin) {                  
 digitalWrite(x, LOW);                  
 digitalWrite(y, HIGH);                  
 analogWrite(speedPin, motorSpeed);                  
}                  
            
void right(int motorSpeed) {                  
 forward(in1, in2, motorSpeed, motorASpeedPin);                  
 backward(in3, in4, motorSpeed, motorBSpeedPin);                  
}               
               
void left(int motorSpeed) {                  
 forward(in3, in4, motorSpeed, motorBSpeedPin);                  
 backward(in1, in2, motorSpeed, motorASpeedPin);                  
}               
               
void stopAll() {                  
 digitalWrite(in1, LOW);                  
 digitalWrite(in2, LOW);                  
 digitalWrite(in3, LOW);                  
 digitalWrite(in4, LOW);                  
}                 
             
void setup() {                  
 for (int i = 3 ; i <= 5 ; i++) {                  
   pinMode(i, OUTPUT);                  
 }                  
 for (int i = 7 ; i <= 9 ; i++) {                  
   pinMode(i, OUTPUT);                  
 }                  
 Serial.begin(9600);    
 // Manual motor testing via serial              
 Serial.println("Enter 'f' for FORWARD, or 'b' for BACKWARD");                  
 Serial.println("or 'r' for RIGHT, or 'l' for LEFT, or 's' to STOP all motors. ");                  
}                 
             
void loop() { 
 // Reads in Serial input from Processing and outputs to the vehicle                 
 if (Serial.available() > 0) {                  
   val = Serial.read();                  
 }                  
 if (val == 'f') {                  
   forward(in1, in2, 200, motorASpeedPin);                  
   forward(in3, in4, 200, motorBSpeedPin);                  
   Serial.println("forward");                  
 }                  
 if (val == 'b') {                  
   backward(in1, in2, 200, motorASpeedPin);                  
   backward(in3, in4, 200, motorBSpeedPin);                  
   Serial.println("backward");                  
 }                  
 if (val == 'r') {                  
   right(200);                  
   Serial.println("right");                  
 }                  
 if (val == 'l') {                  
   left(200);                  
   Serial.println("left");                  
 }                  
 if (val == 's') {                  
   stopAll();                  
   Serial.println("stopAll");                  
 }                  
} 
