void setup(){
  fullScreen();
}

void draw(){
  background(255);
  drawTriangle(width/2, height/2, 300, 0);
}

void drawTriangle(float x, float y, float radius, float rotationAngle){
  if(radius >= 10){
    pushMatrix();
      rotate(rotationAngle);
      if(radius < 75) fill(50);
      else noFill();
      stroke(0);
      
      triangle(x, y - radius, x + radius, y + radius, x - radius, y + radius);
      
      drawTriangle(x + radius/2, y + radius/2, radius/2, PI);
      drawTriangle(x - radius/2, y + radius/2, radius/2, PI);
      drawTriangle(x, y - radius/2, radius/2, PI);
    popMatrix();
  }
}
