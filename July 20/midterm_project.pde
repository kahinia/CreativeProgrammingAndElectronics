/**
*DES INV 23 Summer 2020
* Kahini Achrekar
* Midterm Project- Interactive Game
* 
* The objective of this game is to collect as many falling flowers as possible in 30 seconds. Players use their mouse to slide the flower basket at the bottom of the window to collect the
* cherry blossom flowers. If the players can collect 10 flowers they win!
**/

import processing.sound.*;

//loading images
PImage sakura;
PImage basket;
PImage cbbg;

//loading sounds
SoundFile file; // score sound
SoundFile bgMusic; //background music

//global variables
float xPosition; //flower X position tracker
float yPosition=0; // flower y position tracker
float speed = 2; //inital descent speed
int score = 0; // inital game score
float offset = 0.0; // initial noise value
int state = 0; //gameplay state tracker
int timer = 1800; //30 second timer


void setup() {
  size(500, 500);
  xPosition = random(75, 425); 
  sakura = loadImage("unnamed.png"); // falling object
  basket = loadImage("basket.png"); //catching object
  cbbg = loadImage("cbbg.jpg"); //background image
  file = new SoundFile(this, "one.aif"); //score sound effect
  bgMusic = new SoundFile(this, "bgmusic.mp3"); //background music
  bgMusic.amp(0.2);
  bgMusic.play();
}

void draw() {
  background(cbbg);
  //core game functionality
  if (state==0) {
    //startup page
    startup();
  } else if (state ==1) {
    //gameplay procedure
    gamePlay();
  } else if (state == 2) {
    // end of game procedure
    gameOver();
  }
  // timer and score display
  fill(0);
  rect(0,0,75,20); //timer box
  rect(430, 0, 500, 20); //score box
  textAlign(LEFT);
  textSize(15);
  fill(255);
  text("Time: " + int(timer/60), 5,15); // timer text
  text("Score:" + score, 435, 15); //score text

// time up, game state update
  if (timer ==0) {
    state= 2;
  }
}

//Initial screen for game upon startup 
void startup() {
  textAlign(CENTER); 
  text("Catch the falling flowers!", 230, 240);
  text("Move your mouse to catch the flowers!", 230, 260);
  text("Click to begin", 230, 280);
}

//Object and basket controls
void gamePlay() {
  //timer decrementer
    timer -=1;
    
  //noise for falling pattern
  offset = offset + 0.01;
  float n = noise(offset)*100;
  float xDelta = constrain(xPosition+n, 30, 470);

  //falling objects
  image(sakura, xDelta, yPosition, 55, 55);
  yPosition = yPosition + speed;

  //basket  
  noCursor();
  image(basket, moveX, 410, 120, 120);

  // scoring and reset
  if (mouseX >= xPosition-50 && mouseX<= xPosition+75 && yPosition > 460 ) {
    score = score+1;
    file.play(4.0, 1.0); //flower collected sound effect
   // position and speed reset
    yPosition = 0;
    xPosition = random(500);
    speed= random(3, 7);
  }

  //reset for missed flower position
  if (yPosition > 470) {
    file.play(2.0, 1.0); //flower missed sound effect
    //position and speed reset
    yPosition = 0;
    xPosition= random(480);
    speed = random(3, 7);
  }
}

// Game over procedure  
void gameOver() {
  speed = 0;
  xPosition= 1000;
  yPosition = 1000;
  textAlign(CENTER);
  textSize(20);
  fill(237, 119, 234);
  text("GAME OVER", 250, 240);
  fill(255);
  text("FINAL SCORE: " + score, 250, 265);
  text("Press any key to restart", 250, 290);
  if(score>9){
    fill(237, 119, 234);
    textSize(30);
    text("YOU WIN!", 250, 200);
  }
}

//Reset procedure for the game
void reset() {
  if (timer==0) {
    score = 0;
    state = 1;
    timer =1800;
  }
}

// Mouse tracking and translation
int  moveX;
void mouseMoved() { // basket controls
  moveX = mouseX;
}

//Key state detection for restart cue
void keyPressed() {
  reset();
}

//mouse state detection for game start cue
void mousePressed() {
  if (state==0) {
    state=1;
    gamePlay();
  }
}
