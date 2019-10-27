class Target {

  PVector loc;

  Target(PVector loc_) {
    loc = loc_.copy();
  }

  void display() {
    fill(22, 22, 254, 60);
    ellipse(loc.x, loc.y, 10, 10);
  }
}
