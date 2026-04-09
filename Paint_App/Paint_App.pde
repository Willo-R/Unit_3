color black = #000000;
color red = #FA0000;
color orange = #ffa500;
color yellow = #ffff00;
color green = #00FF00;
color blue = #0000ff;
color purple = #800080;
color white = #ffffff;

color currentColor;
float thickness = 1;




void setup(){
  size(900,900);
  background(255);
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
}

void tactile(int x, int y, int r){
  if(dist(x, y, mouseX, mouseY) < r){
    stroke(255);
  }
  else{
    stroke(0);
  }
}

void mouseDragged(){
  line(pmouseX, pmouseY, mouseX, mouseY);
}
