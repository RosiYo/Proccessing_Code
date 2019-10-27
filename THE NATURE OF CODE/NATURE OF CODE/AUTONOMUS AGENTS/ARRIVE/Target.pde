class Target {

  PVector loc, vel, acc;

  Target(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
  }

  void display() {
    fill(100,200,100);
    noStroke();
    ellipse(loc.x, loc.y, 10, 10);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector(0, 0);
  }

  void run() {
    update();
    display();
  }
}
