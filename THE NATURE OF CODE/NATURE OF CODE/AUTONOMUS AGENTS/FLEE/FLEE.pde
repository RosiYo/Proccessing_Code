Vehicle car;
Target destination;
AvoidTarget enemy;

PVector CarPos, CarVel;
PVector TargetPos, TargetVel;
PVector EnemyPos, EnemyVel;

void setup() {
  size(600, 600);

  CarPos = new PVector(10, 10);
  CarVel = new PVector(1, 1);

  TargetVel = new PVector(0, 0);
  
  EnemyPos = new PVector(width/2, height/2);
  EnemyVel = new PVector(1, 2);

  enemy = new AvoidTarget(EnemyPos, EnemyVel);
  car = new Vehicle(CarPos, CarVel);
  frameRate(80);
}

void draw() {
  background(172, 210, 225);
  
  noFill();
  ellipse(enemy.loc.x, enemy.loc.y, 200, 200);
  
  TargetPos = new PVector(mouseX, mouseY);
  destination = new Target(TargetPos, TargetVel);
  destination.run();
  
  enemy.run();
  
  car.update();
  car.display();
  car.Seek(destination.loc);
  car.Flee(enemy.loc);
}
