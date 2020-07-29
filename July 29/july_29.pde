/**
 *DES INV 23 Summer 2020
 * Kahini Achrekar
 * Homework 3: Simple Game
 **/

import processing.sound.*;
import processing.serial.*;

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
float speed = 2; //inital descend speed
int score = 0; // inital game score
float offset = 0.0; // initial noise value
int state = 0; //gameplay state tracker
int timer = 1800; //30 second timer

//Arduino variables
Serial myPort;        // The serial port
int xDial = 1;         // horizontal position of the basket
float inByte = 0;


void setup() {
  size(500, 500);
  xPosition = random(75, 425); 
  sakura = loadImage("unnamed.png"); // falling object
  basket = loadImage("basket.png"); //catching object
  cbbg = loadImage("cbbg.jpg"); //background image
  file = new SoundFile(this, "one.aif"); //score sound effect
  bgMusic = new SoundFile(this, "bgmusic.mp3"); //background music
  bgMusic.amp(0.2); //background music volume
  bgMusic.play();

  myPort = new Serial(this, Serial.list()[15], 9600);
  myPort.bufferUntil('\n');
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
  rect(0, 0, 75, 20); //timer box
  rect(430, 0, 500, 20); //score box
  textAlign(LEFT);
  textSize(15);
  fill(255);
  text("Time: " + int(timer/60), 5, 15); // timer text
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
  image(basket, inByte, 410, 120, 120);

  // scoring and reset
  if (inByte >= xPosition-50 && inByte <= xPosition+75 && yPosition > 460 ) {
    score = score+1;
    file.play(4.0, 1.0); //flower collected sound effect
    // position and speed reset
    yPosition = 0;
    xPosition = random(500);
    speed= random(2, 5);
  }

  //reset for missed flower position
  if (yPosition > 470) {
    file.play(2.0, 1.0); //flower missed sound effect
    //position and speed reset
    yPosition = 0;
    xPosition= random(480);
    speed = random(2, 6);
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
  if (score>9) {
    fill(0);
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
