/*
   Blue Danube Instrument
   Kahini Achrekar
   DesInv 23- SUmmer 2020

   The Blue Danube by Johann Strauss II
   Simplified Score: makingmusicfun.net

*/

#include "pitches.h"
#include <Servo.h>

Servo myservo;  
int pos = 0;    // variable to store the servo position

// notes in the melody:
int melodyOne[] = {
  NOTE_C4, NOTE_C4, NOTE_E4, NOTE_G4, NOTE_G4, 0, NOTE_G5, NOTE_G5, 0 , NOTE_E5, NOTE_E5, 0
};

int melodyTwo[] = {
  NOTE_C4, NOTE_C4, NOTE_E4, NOTE_G4, NOTE_G4, 0, NOTE_G5, NOTE_G5, 0 , NOTE_F5, NOTE_F5, 0
};

int melodyThree[] = {
  NOTE_B4, NOTE_B4, NOTE_D4, NOTE_A4, NOTE_A4, 0, NOTE_A5, NOTE_A5, 0 , NOTE_F5, NOTE_F5, 0
};

int melodyFour[] = {
  NOTE_B4, NOTE_B4, NOTE_D4, NOTE_A4, NOTE_A4, 0, NOTE_A5, NOTE_A5, 0 , NOTE_E5, NOTE_E5, 0
};

// note durations: 4 = quarter note, 8 = eighth note, etc.:
int noteDurations[] = {
  4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
};

void setup() {
   myservo.attach(11); 

}


void loop() {
  int switchOne = digitalRead(2);
  int switchTwo = digitalRead(3);
  int switchThree = digitalRead(5);
  int switchFour = digitalRead(6);

  if (switchOne == HIGH) {
    // iterate over the notes of the melody:
    for (int thisNote = 0; thisNote < 12; thisNote++) {

      // to calculate the note duration
      int noteDuration = 1000 / noteDurations[thisNote];
      tone(8, melodyOne[thisNote], noteDuration);
      int pauseBetweenNotes = noteDuration * 1.30;
      delay(pauseBetweenNotes);
      // stop the tone playing:
      noTone(8);
    }
  }

    if (switchTwo == HIGH) {
      // iterate over the notes of the melody:
      for (int thisNote = 0; thisNote < 12; thisNote++) {

        // to calculate the note duration
        int noteDuration = 1000 / noteDurations[thisNote];
        tone(8, melodyTwo[thisNote], noteDuration);
        int pauseBetweenNotes = noteDuration * 1.30;
        delay(pauseBetweenNotes);
        // stop the tone playing:
        noTone(8);
      }
    }

      if (switchThree == HIGH) {
        // iterate over the notes of the melody:
        for (int thisNote = 0; thisNote < 12; thisNote++) {

          // to calculate the note duration
          int noteDuration = 1000 / noteDurations[thisNote];
          tone(8, melodyThree[thisNote], noteDuration);
          int pauseBetweenNotes = noteDuration * 1.30;
          delay(pauseBetweenNotes);
          // stop the tone playing:
          noTone(8);
        }
      }

        if (switchFour == HIGH) {
          // iterate over the notes of the melody:
          for (int thisNote = 0; thisNote < 12; thisNote++) {

            // to calculate the note duration
            int noteDuration = 1000 / noteDurations[thisNote];
            tone(8, melodyFour[thisNote], noteDuration);
            int pauseBetweenNotes = noteDuration * 1.30;
            delay(pauseBetweenNotes);
            // stop the tone playing:
            noTone(8);
          }
        }

        for (pos = 0; pos <= 60; pos += 1) { 
    // in steps of 1 degree
    myservo.write(pos);             
    delay(15);                       
  }
  for (pos = 60; pos >= 0; pos -= 1) { 
    myservo.write(pos);             
    delay(15);                       
  }
        
      }
