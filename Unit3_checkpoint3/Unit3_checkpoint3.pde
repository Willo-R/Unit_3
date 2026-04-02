float sliderY;
color teaGreen = #CCFFCB;
color frozenWater = #38023B;

void setup(){
  size(900,900);
  strokeWeight(5);
  sliderY= 450;
  fill(teaGreen);
  stroke(frozenWater);
}
 
void draw(){
  
  background(255);
  
  line(100, 100, 100, 800); 
  circle(100, sliderY, 50);
}

void controlSlider(){
  pushMatrix();
  if(mouseY > 100 && mouseY < 800 && mouseX > 75 && mouseX < 125){
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
