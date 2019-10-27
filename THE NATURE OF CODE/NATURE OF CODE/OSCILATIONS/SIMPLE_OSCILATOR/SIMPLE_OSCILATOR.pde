float period = 120;
float amplitude = 300;

void setup(){
  size(800, 200);
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  float x = amplitude * sin(TWO_PI * frameCount/period);
  line(0, 0, x, 0);
  fill(100, 80);
  ellipse(x, 0, 20, 20);
}
