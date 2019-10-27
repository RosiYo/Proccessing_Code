ArrayList <Box> b;

void setup() {
  size(600, 600);
  b = new ArrayList <Box>();
}

void draw() {
  background(255);
  for (Box b_ : b) {
    b_.display();
  }
}

void mouseDragged() {
  b.add(new Box(mouseX, mouseY, 16, 16));
}
