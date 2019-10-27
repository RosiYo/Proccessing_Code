class AvoidTarget {

  PVector loc, vel, acc;

  AvoidTarget(PVector loc_, PVector vel_) {
    loc = loc_.copy();
    vel = vel_.copy();
    acc = new PVector(0, 0);
  }

  void display() {
    fill(200, 100, 100);
    ellipse(loc.x, loc.y, 10, 10);
  }

  void update() {
    vel.add(acc);
    loc.add(vel);
    acc = new PVector(0, 0);
  }
  
  void checkEdges(){
    if(loc.x < 0 || loc.x > width){
      vel.x = vel.x * -1;
    }else if(loc.y < 0 || loc.y > height){
      vel.y = vel.y * -1;
    }
  }

  void run() {
    checkEdges();
    update();
    display();
  }
}
