// window setup
void setup(){
  size(300,300);
  frameRate(5);
}

//variables for wave animation
int step= 1; //counter for if statement
int a = 1; //change in y position

void draw() {
  background(2, 188, 209);

  //sky
  fill(159, 250,255);
  noStroke();
  rect(0, 0, 300, 120);
  
  // (building)
  fill(250,250,250);
  rect(140, 100, 125, 30);
  rect(160, 80, 90, 20);
  
  // sun
  fill(250,236,25);
  stroke(250, 236, 25);
  strokeWeight(3);
  ellipse(40,40, 50,50);
  line(40,0, 40, 85);
  line(5,5, 75, 75);
  line(0,40,90,40);
  line(5,75, 75, 5);
  
  //balcony
  fill(224,224,224);
  stroke(224,224,224);
  rect(0,240,300,300);
  
  //hair
  fill(56,35,1);
  stroke(0,0,0);
  strokeWeight(1);
  arc(80, 210, 140, 200,radians(150), radians(390), OPEN);
  
  //face
  fill(227,177,98);
  noStroke();
  ellipse(80, 190, 100, 115);
  
  //mouth
  fill(255, 10, 0);
  arc(80, 210, 40, 40, 0, radians(180));
  
  //eyes
  fill(56,35,1);
  ellipse(60, 180, 10, 15);
  ellipse(100, 180, 10, 15);
  
  //body
  fill(255, 197, 196);
  ellipse(80,305, 90, 115);
  
  //birds
  stroke(255,255,255);
  strokeWeight(2);
  noFill();
  arc(140, 50, 40, 20, 1.5*PI, 2*PI);
  arc(180, 50, 40, 20, PI, 1.5*PI);
  arc(200, 40, 40, 20, 1.5*PI, 2*PI);
  arc(240, 40, 40, 20, PI, 1.5*PI);
  
  //waves?
  noFill();
  stroke(37, 151, 245);
  //row 1
  arc(160, 150+a, 30, 10, PI, 2*PI);
  arc(190, 150+a, 30, 10, PI, 2*PI);
  arc(220, 150+a, 30, 10, PI, 2*PI);
  arc(250, 150+a, 30, 10, PI, 2*PI);
  step+=1;
  a+=1;
  
  //row 2
  arc(175, 185+a, 30, 10, PI, 2*PI);
  arc(205, 185+a, 30, 10, PI, 2*PI);
  arc(235, 185+a, 30, 10, PI, 2*PI);
  arc(265, 185+a, 30, 10, PI, 2*PI);
  
  //row 3
  arc(185, 220+a, 30, 10, PI, 2*PI);
  arc(215, 220+a, 30, 10, PI, 2*PI);
  arc(245, 220+a, 30, 10, PI, 2*PI);
  arc(275, 220+a, 30, 10, PI, 2*PI);
  
  if (step>5){
    step = 0;
    a=1;
  }
}
