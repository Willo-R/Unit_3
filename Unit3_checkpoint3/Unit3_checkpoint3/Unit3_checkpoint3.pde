float sliderY;
color teaGreen = #CCFFCB;
color frozenWater = #38023B;

float diameter = 0;
float colour = 0;

void setup(){
  size(900,900);
  strokeWeight(5);
  sliderY= 450;
  fill(teaGreen);
  stroke(frozenWater);
}
 
void draw(){
  
  background(255);
  
  fill(teaGreen);
  line(100, 100, 100, 800); 
  circle(100, sliderY, 100);
  
  //object
  diameter = map(sliderY, 100, 800, 0, 600);
  colour = map(sliderY, 100, 800, 0, 255);
  fill(0, colour, 0);
  circle(500, 450, diameter);
}

void controlSlider(){
  pushMatrix();
  if(mouseY > 100 && mouseY < 800 && mouseX > 50 && mouseX < 150){
    sliderY = mouseY;
  }
  popMatrix();
}

void mouseReleased(){
  
  controlSlider();
  
}

void mouseDragged(){

  controlSlider();
  
}
