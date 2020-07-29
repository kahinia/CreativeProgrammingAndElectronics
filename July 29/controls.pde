//Key state detection for restart cue
void keyPressed() {
  reset();
}

// Arduino control input
void serialEvent (Serial myPort) {
  // get the ASCII string:
  String inString = myPort.readStringUntil('\n');

  if (inString != null) {
    // trim off any whitespace:
    inString = trim(inString);
    // convert to an int and map to the screen height:
    inByte = float(inString);
    println(inByte);
    inByte = map(inByte, 0, 1023, 0, width);
  }
}

//mouse state detection for game start cue
void mousePressed() {
  if (state==0) {
    state=1;
    gamePlay();
  }
}

/*
Alternative to Arduino controls
// Mouse tracking and translation
int  moveX;
void mouseMoved() { // basket controls
  moveX = mouseX;
}

*/
