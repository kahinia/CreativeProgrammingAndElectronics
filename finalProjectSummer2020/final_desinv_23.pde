/*
  DesInv 23- Summer 2020
 Kahini Achrekar
 August 12, 2020
 
 This program is part of the Doodle Bot and ocntians the on screen controls for the robot. 
 */

import processing.serial.*;     //import the Serial Library     
Serial port;                    //create Serial object  

// global position and state tracking variables
int xPos = 0;
int yPos = 0;
int xDelta = 0;
int yDelta = 0;
int xORy = 1;


void setup()
{
  size(700, 700); // canvas size
  background(0); // background color
  frameRate(60); 
  //Port ID varies depending on user, adjust Serial.list()[] accordingly
  port = new Serial(this, Serial.list()[15], 9600);
  text("Doodle Bot Canvas", 300, 10);
  text("Press [space] to clear the frame", 500, 10);
  text("Click and drag to draw!", 10, 10);
}

void draw()
{
  smooth();
  noStroke();
  fill(255);


  if (mousePressed == true) {
    //location marker
    ellipse(mouseX, mouseY, 5, 5);

    // tracking relative changes in mouse position
    deltaPosition();
    //store previous mouse position
    xPos = mouseX;
    yPos = mouseY;

    // Commands for next action of vehicle
    if (xORy == 1) {
      if (yDelta >0) {
        forward();
      } else {
        backward();
      }
    } else if (xORy == 0) {
      if (xDelta >0) {
        right();
      } else {
        left();
      }
    } else {
      stop();
    }
  }
}

/*This function is used to determine the relative change in position of the vehicle. 
 It determines whether the vehicle will move forward or turn depending on if there is greater change in the x or y directions. 
 */
void deltaPosition() {
  xDelta = xPos- mouseX;
  yDelta = yPos- mouseY;
  if ((abs(yDelta)- abs(xDelta)) > 3 && yDelta != 0 && xDelta !=0) {
    xORy = 1; // prefernece for going forward or backwards
  } else if ((abs(yDelta) - abs(xDelta)) < 3 && yDelta != 0 && xDelta !=0) {
    xORy = 0;
  } else {
    xORy = 2;
  }
}

// Functions to send directions to Arduino using Serial output
void forward() {            
  port.write('f');
}            
void backward() {            
  port.write('b');
}            
void right() {            
  port.write('r');
}            
void left() {            
  port.write('l');
}            
void stop() {            
  port.write('s');
}  

void keyPressed() {
  if(key == ' '){
    reset();
  }
}
void reset() {
  background(0);
}
