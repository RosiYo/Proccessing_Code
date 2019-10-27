class Target {

  PVector loc;

  Target(PVector loc_) {
    loc = loc_.copy();
  }

  void display() {
    ellipse(loc.x, loc.y, 10, 10);
  }
}
