float x;
float y;

void setup(){
  size(200,200);
  background(0);
}

void draw(){
  translate(width/2,height/2);
  float xSpeed = random(-1,1);
  float ySpeed = random(-1,1);
  stroke(255);
  point(x , y);
  x = x + xSpeed;
  y = y + ySpeed;
}
