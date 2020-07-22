
int sensorValue = 0; //initializing read valise from the potentiometer
int outputValue = 0; //initiallizing output value to the LED

void setup() {
  pinMode(8, OUTPUT); // digital out pin
  pinMode(5, OUTPUT); // digital out pin
  pinMode(3, OUTPUT); // digital out pin
  pinMode(A0, INPUT); // digital in pin
 
 Serial.begin(1000); //communication rate at 1000 bps
}

void loop() {

  int switchPosition = digitalRead(A0);


  if (switchPosition == HIGH ) {
    int state = random(4);
    switch (state) {
  case 1:
    digitalWrite(8, HIGH); // turn on the blue light
    break;
  case 2:
    digitalWrite(5, HIGH); // turn on the green light
    break;
  case 3:
    digitalWrite(3, HIGH); // turn on the red light
    break;
  default:
      digitalWrite(8, LOW);   // turn the LEDs off by default 
      digitalWrite(5, LOW);
      digitalWrite(3, LOW);
    break;
}
  } 
    else {
    digitalWrite(8, LOW);    // turn the LEDs off when switch is not pressed
    digitalWrite(5, LOW);
    digitalWrite(3, LOW);
  }

// analog controls for yellow light
  sensorValue = analogRead(A2); //analog input value from meter
  outputValue = map(sensorValue, 0, 1023, 0, 255); // map to range of the alnalgo out
  analogWrite(11, outputValue); //change the analog output value
  delay(150); // milliseconds before next loop begins
   
}
