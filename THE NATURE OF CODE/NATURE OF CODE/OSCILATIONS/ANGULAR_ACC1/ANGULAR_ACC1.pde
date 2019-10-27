Square s;

void setup(){
  s = new Square();
  size(600, 600);
}

void draw(){
  background(255);
  s.run();
}
