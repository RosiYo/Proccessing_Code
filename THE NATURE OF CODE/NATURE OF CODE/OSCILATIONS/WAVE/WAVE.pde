float angle = 0;
float aVel = 0.1;
float startAngle = 0;

void setup(){
  size(1000,600);
  stroke(100, 100, 255, 200);
}

void draw(){
  background(255);
  angle = startAngle;
  beginShape();
  
  for(float x = 0; x <= width; x += 28){
    float y = map(sin(angle), -1, 1, 100, height-100);
    vertex(x, y);
    angle += aVel;
  }
  
  endShape();
  startAngle += 0.02;
}
