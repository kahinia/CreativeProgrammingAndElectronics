/*
DES INV 23 Summer 2020
Kahini Achrekar
Homework 3: Simple Game
*/

//loading images
PImage sakura;
PImage basket;
PImage cbbg;

//global variables
float xPosition;
float yPosition=0;
float speed = 2;
int score = 0;
float offset = 0.0;

void setup() {
  size(500,500);
  xPosition = random(75,425); 
  sakura = loadImage("unnamed.png"); // falling
  basket = loadImage("basket.png"); //catching
  cbbg = loadImage("cbbg.jpg"); //background
}

void draw() {
  background(cbbg);
  
  //noise for falling pattern
  offset = offset + 0.01;
  float n = noise(offset)*100;
  
  //falling objects
  image(sakura, xPosition+n, yPosition, 55, 55);
  yPosition = yPosition + speed;

  //basket  
  noCursor();
  image(basket, moveX, 430, 120, 120);
  
 // scoring and reset
  if(mouseX >= xPosition-50 && mouseX<= xPosition+75 && yPosition > 475 ) {
     score = score+1;
     yPosition = 0;
     xPosition = random(500);
     speed= random(1,5);
    }
    
//reset for missed flower position
  if (yPosition > 500){
    xPosition= random(500);
    speed = random(2,6);
    yPosition = 0;
  }
  
//score and instructions
  fill(0);
  rect(0,0, 100, 20);
  rect(410, 0, 500, 20);
  fill(255);
  textSize(15);
  text("Click to start", 3, 15);
  text("Score:", 420, 15);
  text(score, 480, 15);
    
// Game over procedure  
   if (score ==10){
     speed = 0;
     xPosition= 1000;
     yPosition = 1000;
     fill(255);
     text("GAME OVER", 230,250);    
  }   
}

// Mouse tracking and translation
int  moveX, moveY;
void mouseMoved() { // basket
  moveX = mouseX;
}
