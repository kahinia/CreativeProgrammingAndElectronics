/*
   DesInv 23 Summer 2020
   Kahini Achrekar
   Homework 6
   July 29, 2020

*/

void setup() {
  // initialize the serial communication:
  Serial.begin(9600);

}

void loop() {
  // send the value of analog input 0:
  Serial.println(analogRead(A0));
  // wait a bit for the analog-to-digital converter to stabilize after the last
  // reading:
  delay(2);

}
