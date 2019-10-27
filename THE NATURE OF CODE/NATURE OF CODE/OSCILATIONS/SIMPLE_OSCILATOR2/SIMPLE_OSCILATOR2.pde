float period = 120;
float amplitude = 300;

PVector Angle;
PVector Velocity;

void setup(){
  size(800, 800);
  Angle = new PVector();
  Velocity = new PVector(random(0.01,0.1), random(0.01,0.1));
}

void draw(){
  background(255);
  translate(width/2, height/2);
  
  float x = amplitude * sin(Angle.x);
  float y = amplitude * sin(Angle.y);
  
  line(0, 0, x, y);
  fill(100, 80);
  ellipse(x, y, 20, 20);
  
  Angle.x += Velocity.x;
  Angle.y += Velocity.y;
}
