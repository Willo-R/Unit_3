//ASK MR.P ABOUT LINE 270======================================
//ALSO ASK ABOUT SETTING THE COORDINATES FOR THE LOAD BUTTON===


color black = #000000;
color red = #FA0000;
color orange = #ffa500;
color yellow = #ffff00;
color green = #00FF00;
color blue = #0000ff;
color purple = #800080;
color white = #ffffff;
color lightGray = #D3D3D3;

//indicator
color currentColor;

//stamps
color stampColor;
color stampColor1;
color stampStroke;
color stampStroke1;

//slider
float thickness = 20;
float sliderX = 270;

//stamps
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
  
  //tennis stamp
  tennis = loadImage("tennis.png");
  tennisOn = false;
  stampColor = white;
  stampStroke = black;
  
  //ironman stamp
  ironman = loadImage("ironman.png");
  ironmanOn = false;
  stampColor1 = white;
  stampStroke1 = black;
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
  
  
  
  //slider==========================================================
  stroke(lightGray);
  sliderTactile(sliderX, 75, 10);
  line(250, 75, 330, 75);
  circle(sliderX, 75, 20);
  
  
  //indicator=====================================================
  thickness = map(sliderX, 250, 330, 10, 35);
  sizeX = map(sliderX, 250, 330, 20, 100);
  sizeY = map(sliderX, 250, 330, 20, 100);
  fill(currentColor);
  strokeWeight(2);
  stroke(black);
  circle(380, 75, thickness);
  
  
  //tennis========================================================
  stroke(stampStroke);
  stampTactile(445, 30, 90, 90, 0);
  fill(stampColor);
  rect(445, 30, 90, 90);
  image(tennis, 450, 35, 80, 80);
  
  
  //ironman========================================================
  stroke(stampStroke1);
  stampTactile(560, 30, 90, 90, 1);
  fill(stampColor1);
  rect(560, 30, 90, 90);
  image(ironman, 560, 30, 90, 90);
  
  
  
  //new button, load button, save button========================================================
  fill(black);
  
  stampTactile(720, 15, 90, 28, 2);
  rect(720, 15, 90, 28);
 
  stampTactile(720, 61, 90, 28, 2);
  rect(720, 61, 90, 28);
 
  stampTactile(720, 107, 90, 28, 2);
  rect(720, 107, 90, 28);
  
  textSize(25);
  textAlign(CENTER, CENTER);
  fill(white);
  text("New", 765, 29);
  text("Load", 765, 75);
  text("Save", 765, 121);
}










//color buttons tactile========================================================
void tactile(float x, int y, int r){
  if(dist(x, y, mouseX, mouseY) < r){
    stroke(white);
  }
  else{
    stroke(black);
  }
}



//slider tactile========================================================
void sliderTactile(float x, int y, int r){
  if(dist(x, y, mouseX, mouseY) < r){
    stroke(white);
    strokeWeight(3);
  }
  else{
    stroke(lightGray);
  }
}



//stampTactile========================================================
void stampTactile(int x, int y, int w, int h, int stampNum){
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
    if(stampNum == 0){
      stampColor = yellow;
    }
    if(stampNum == 1){
      stampColor1 = yellow;
    }
    
    if(stampNum > 1){
      stroke(white);
    }
  }
  else{
    stampColor = white;
    stampColor1 = white;
    stroke(black);
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
    if(ironmanOn){
      ironmanOn = !ironmanOn;
    }
  }
  if(tennisOn == false){
    stampStroke = black;
  }
  
  if(tennisOn && mouseY > 150){
    //tennis
    image(tennis, mouseX, mouseY, sizeX, sizeY);
    }
    
    
  //ironman button
  if(mouseX > 560 && mouseX < 650 && mouseY > 30 && mouseY < 120){
    ironmanOn = !ironmanOn;
    stampStroke1 = red;
    if(tennisOn){
      tennisOn = !tennisOn;
      //stampStroke = black;
    }
  }
  if(ironmanOn == false){
    stampStroke1 = black;
  }
  
  if(ironmanOn && mouseY > 150){
    //ironman
    image(ironman, mouseX, mouseY, sizeX, sizeY);
  }
  
  
  //new button
  if(mouseX > 720 && mouseY > 15 && mouseX < 810 && mouseY < 43){
    fill(white);
    rect(0, 150, 900, 900);
  }
  
  
  //load  button
  if(mouseX > 720 && mouseX < 810 && mouseY > 61 && mouseY < 89){
    selectInput("pick an image to load", "openImage");
  }
  
  
  //save button
  if(mouseX > 720 && mouseX < 810 && mouseY > 107 && mouseY < 135){
    selectOutput("Choose a name for your new image file", "saveImage");
  }
  
}


//load
void openImage(File f){
  if(f != null){
    int n = 0;
    while(n < 10){
      PImage pic = loadImage(f.getPath());
      image(pic, 0, 0);
      n = n + 1;
    }
  }
}



//save
void saveImage(File f){
  if(f != null){
    PImage canvas = get(0, 150, 900, 900);
    canvas.save(f.getAbsolutePath());
  }
}



void mouseDragged(){
  
  //squiggly line
  if(tennisOn == false && ironmanOn == false && mouseY > 150){
    stroke(currentColor);
    strokeWeight(thickness-6);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
  //tennis button
  if(tennisOn && mouseY > 150){
    //tennis
    image(tennis, mouseX, mouseY, sizeX, sizeY);
  }
  
  //ironman button
  if(ironmanOn && mouseY > 150){
    //ironman
    image(ironman, mouseX, mouseY, sizeX, sizeY);
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
