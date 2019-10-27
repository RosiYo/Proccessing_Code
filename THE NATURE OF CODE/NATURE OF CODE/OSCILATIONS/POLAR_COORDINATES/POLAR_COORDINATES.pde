float a = 0.0;

float aVel = 0;
float xoff = 0;
float x, y, r, px, py, aAcc;

void setup(){
  size(600,600);
  background(0);
  stroke(255, 150);
}

void draw(){
  translate(width/2, height/2);
  
  aAcc = map(noise(xoff), 0, 1, -0.01, 0.01);
  r = map(noise(xoff + 1000), 0, 1, 0, width/2);
  x = r * sin(a);
  y = r * cos(a);
  
  beginShape();
  
  if(frameCount > 1){
    line(x, y, px, py);
  }
  
  endShape();
  
  px = x;
  py = y;
  aVel += aAcc;
  a += aVel;
  xoff += 0.1;
  
  aVel = constrain(aVel, 0, 0.4);
}
