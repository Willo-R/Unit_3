color aliceBlue = #D9F0FF;
color lightBlue = #A3D5FF;
color skyBlue = #83C9F4;
color slateBlue = #6F73D2;
color glaucous = #7681B3;
color white = #FFFFFF;
color selectedColor;

void setup() {
  size(900, 900);
  strokeWeight(5);
  stroke(glaucous);
  selectedColor = slateBlue;
}

void draw() {
  background(aliceBlue);

  //buttons
  if (dist(150, 100, mouseX, mouseY) < 75) {
    stroke(white);
  }
  else{
    stroke(glaucous);
  }
  
  fill(lightBlue);
  circle(150, 100, 150);
  
  if (dist(450, 100, mouseX, mouseY) < 75) {
    stroke(white);
  }
  else{
    stroke(glaucous);
  }

  fill(skyBlue);
  circle(450, 100, 150);

  if (dist(750, 100, mouseX, mouseY) < 75) {
    stroke(white);
  }
  else{
    stroke(glaucous);
  }

  fill(slateBlue);
  circle(750, 100, 150);

  //indicator
  stroke(glaucous);
  fill(selectedColor);
  rect(100, 300, 700, 500);
}

void mouseReleased() {
  if (dist(150, 100, mouseX, mouseY) < 75) {
    selectedColor = lightBlue;
  }

  if (dist(450, 100, mouseX, mouseY) < 75) {
    selectedColor = skyBlue;
  }

  if (dist(750, 100, mouseX, mouseY) < 75) {
    selectedColor = slateBlue;
  }
}
