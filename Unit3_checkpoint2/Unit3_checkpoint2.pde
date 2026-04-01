color gray = #dad7cd;
color sage = #a3b18a;
color fern = #588157;
color hunterGreen = #3A5A40;
color pineTeal = #344E41;

color selectedColor;

void setup(){
  size(900, 900);
  strokeWeight(5);
  stroke(pineTeal);
  selectedColor = (gray);
}

void draw(){
  background(gray);
  
  //buttons
  tactile(100, 100, 250, 200);
  fill(sage);
  rect(100, 100, 150, 100);
  
  tactile(375, 100, 525, 200);
  fill(fern);
  rect(375, 100, 150, 100);
  
  tactile(650, 100, 800, 200);
  fill(hunterGreen);
  rect(650, 100, 150, 100);
  
  //indicator
  stroke(pineTeal);
  fill(selectedColor);
  ellipse(450, 575, 700, 550);

}

void tactile(int x, int y, int w, int h){
  if(mouseX > x && mouseX < w && mouseY > y && mouseY < h){
    stroke(255);
  }
  else{
    stroke(pineTeal);
  }
}

void mouseReleased() {
  if (mouseX > 100 && mouseX < 250 && mouseY > 100 && mouseY < 200) {
    selectedColor = sage;
  }

  if (mouseX > 375 && mouseX < 525 && mouseY > 100 && mouseY < 200) {
    selectedColor = fern;
  }

  if (mouseX > 650 && mouseX < 800 && mouseY > 100 && mouseY < 200){
    selectedColor = hunterGreen;
  }
}
