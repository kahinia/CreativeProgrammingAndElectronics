/*
DESINV 23 Summer 2020
Kahini Achrekar
*/

void setup(){
  size(750,500);
  frameRate(2);
  smooth();
}

//baseline centers for the canvas
float centerX = 125;
float centerY = 125;

void draw() {
//position (0,0)
 openClose(centerX, centerY);
 
//position (1,0)
 pushMatrix();
 translate(250,0);
 openClose(centerX, centerY);
 popMatrix();
 
 //position (2,0)
 pushMatrix();
 translate(500,0);
 openClose(centerX, centerY);
 popMatrix();
 
 //position (0,1)
 pushMatrix();
 translate(250,0);
 openClose(centerX, centerY);
 popMatrix();
 
 //position (1,1)
 pushMatrix();
 translate(0,250);
 openClose(centerX, centerY);
 popMatrix();
 
 //position (2,1)
 pushMatrix();
 translate(250,250);
 openClose(centerX, centerY);
 popMatrix();
 
 // position (2,2)
 pushMatrix();
 translate(500,250);
 openClose(centerX, centerY);
 popMatrix();
}

//Funtion used to decide whether the eye will be open or closed
void openClose(float centerX, float centerY){
 float x = random(3);
 int intX = round(x);
 if(intX!=1){
  openEye(centerX, centerY); 
 } else {
   closedEye();
 } 
}

//Funtion used to draw the open eye and details
void openEye(float centerX, float centerY){
  //subsection background
  backing();
  //sclera
  fill(255,255,255);
  eyeShape();
  //iris
  fill(random(255),random(255), random(255));
  ellipse(centerX, centerY, 85, 85);
  //pupil
  fill(0,0,0);
  ellipse(centerX, centerY, 35, 35);
  //highlight
  fill(255,255,255);
  noStroke();
  ellipse(centerX+8,centerY-12,15,15);
}

//Function to draw the closed eye
void closedEye(){
  backing();
  fill(random(255),random(255), random(255));
  eyeShape();
}


//Function to draw the base eye shape for both opened and closed eyes
void eyeShape () {
  stroke(0,0,0);
  strokeWeight(3);
  beginShape();
  bezier(50, 130, 100, 65, 150, 65, 200, 130);
  bezier(50, 130, 100, 180, 150, 180, 200, 130);
  endShape();
}

//Background color selection
void backing(){
  noStroke();
  fill(random(255)+50,random(255)+50, random(255)+50);
  rect(0,0,250,250);
}
