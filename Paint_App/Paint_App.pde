color black = #000000;
color red = #FA0000;
color orange = #ffa500;
color yellow = #ffff00;
color green = #00FF00;
color blue = #0000ff;
color purple = #800080;
color white = #ffffff;
color lightGray = #D3D3D3;

color currentColor;
color stampColor;
color stampStroke;
float thickness = 20;
float sliderX = 270;

PImage tennis;
boolean tennisOn;
PImage ironman;
boolean ironmanOn;
float sizeX;
float sizeY;

void setup(){
  size(900,900);
  background(255);
  currentColor = black;
  stampColor = white;
  stampStroke = black;
  tennis = loadImage("tennis.png");
  tennisOn = false;
  ironman = loadImage("ironman.png");
  ironmanOn = false;
}

void draw(){
  fill(white);
  
  //toolbar
  stroke(0);
  strokeWeight(2);
  fill(100);
  rect(0, 0, 900, 150);
  
  
  //colors
  tactile(50, 40, 20);
  fill(red);
  circle(50, 40, 40);
  
  tactile(50, 110, 20);
  fill(orange);
  circle(50, 110, 40);
  
  tactile(100, 40, 20);
  fill(yellow);
  circle(100, 40, 40);
 
  tactile(100, 110, 20);
  fill(green);
  circle(100, 110, 40);
 
  tactile(150, 40, 20);
  fill(blue);
  circle(150, 40, 40);
 
  tactile(150, 110, 20);
  fill(purple);
  circle(150, 110, 40);
 
  tactile(200, 40, 20);
  fill(white);
  circle(200, 40, 40);
  
  tactile(200, 110, 20);
  fill(black);
  circle(200, 110, 40); 
  
  //slider
  stroke(lightGray);
  sliderTactile(sliderX, 75, 10);
  line(250, 75, 330, 75);
  circle(sliderX, 75, 20);
  
  thickness = map(sliderX, 250, 330, 10, 35);
  sizeX = map(sliderX, 250, 330, 20, 100);
  sizeY = map(sliderX, 250, 330, 20, 100);
  
  //indicator
  fill(currentColor);
  strokeWeight(2);
  stroke(black);
  circle(380, 75, thickness);
  
  //stamp ===========================
  //tennis
  stroke(stampStroke);
  stampTactile(445, 30, 90, 90);
  fill(stampColor);
  rect(445, 30, 90, 90);
  image(tennis, 450, 35, 80, 80);
  
  //ironman
  stroke(stampStroke);
  stampTactile(560, 30, 90, 90);
  fill(stampColor);
  rect(560, 30, 90, 90);
  image(ironman, 565, 35, 80, 80);
  
  
  
  //new button
  fill(black);
  rect(800, 60, 70, 25);
}

void tactile(float x, int y, int r){
  if(dist(x, y, mouseX, mouseY) < r){
    stroke(white);
  }
  else{
    stroke(black);
  }
}

void sliderTactile(float x, int y, int r){
  if(dist(x, y, mouseX, mouseY) < r){
    stroke(white);
    strokeWeight(3);
  }
  else{
    stroke(lightGray);
  }
}

void stampTactile(int x, int y, int w, int h){
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    stampColor = yellow;
  }
  else{
    stampColor = white;
  }
}

void mouseReleased(){
  controlSlider();
  
  if(dist(50, 40, mouseX, mouseY) < 20){
    currentColor = red;
  }
  if(dist(50, 110, mouseX, mouseY) < 20){
    currentColor = orange;
  }
  if(dist(100, 40, mouseX, mouseY) < 20){
    currentColor = yellow;
  }
  if(dist(100, 110, mouseX, mouseY) < 20){
    currentColor = green;
  }
  if(dist(150, 40, mouseX, mouseY) < 20){
    currentColor = blue;
  }
  if(dist(150, 110, mouseX, mouseY) < 20){
    currentColor = purple;
  }
  if(dist(200, 40, mouseX, mouseY) < 20){
    currentColor = white;
  }
  if(dist(200, 110, mouseX, mouseY) < 20){
    currentColor = black;
  }
    
  //tennis button
  if(mouseX > 445 && mouseX < 535 && mouseY > 35 && mouseY < 115){
    tennisOn = !tennisOn;
    stampStroke = red;
  }
  if(tennisOn == false){
    stampStroke = white;
  }
  
  if(tennisOn && mouseY > 150){
    //tennis
    image(tennis, mouseX, mouseY, sizeX, sizeY);
    
    //ironman button
    if(mouseX > 445 && mouseX < 535 && mouseY > 35 && mouseY < 115){
    ironmanOn = !ironmanOn;
    stampStroke = red;
  }
  if(ironmanOn == false){
    stampStroke = white;
  }
  
  if(ironmanOn && mouseY > 150){
    //ironman
    image(ironman, mouseX, mouseY, sizeX, sizeY);
  }
  
  //new button
 
}

void mouseDragged(){
  
  //squiggly line
  if(tennisOn == false && mouseY > 150){
    stroke(currentColor);
    strokeWeight(thickness-6);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if(tennisOn && mouseY > 150){
    //tennis
    image(tennis, mouseX, mouseY, sizeX, sizeY);
  }
  
  controlSlider();
 
}


void controlSlider(){
  pushMatrix();
  if(mouseX > 250 && mouseX < 330 && mouseY > 65 && mouseY < 85){
    sliderX = mouseX;
  }
  popMatrix();
}
