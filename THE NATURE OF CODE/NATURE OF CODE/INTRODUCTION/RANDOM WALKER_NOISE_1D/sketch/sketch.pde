Walker w;

void setup(){
  size(600,600);
  background(255);
  w = new Walker();
}

void draw(){
  w.update();
  w.display();
}
