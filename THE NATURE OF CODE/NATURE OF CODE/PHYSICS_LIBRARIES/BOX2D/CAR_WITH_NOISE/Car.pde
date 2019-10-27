class Car {
  RevoluteJoint motor;

  Chasis chasis;
  Wheel FrontWheel;
  Wheel BackWheel;
  
  PImage ChasisImage;
  PImage WheelImage;

  Car(PVector ChasisPos, PImage ChasisImage_, PImage WheelImage_, PVector FrontWheelPos, float FrontWheelSize, PVector BackWheelPos, float BackWheelSize) {
    chasis = new Chasis(ChasisPos);
    FrontWheel = new Wheel(FrontWheelPos, FrontWheelSize);
    BackWheel = new Wheel(BackWheelPos, BackWheelSize);
    
    ChasisImage = ChasisImage_;
    WheelImage = WheelImage_;

    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(chasis.body, BackWheel.body, BackWheel.body.getWorldCenter());

    rjd.motorSpeed = -PI * 3;
    rjd.maxMotorTorque = 100;
    rjd.enableMotor = false;

    motor = (RevoluteJoint) Box2D.world.createJoint(rjd);

    RevoluteJointDef JointRJD = new RevoluteJointDef();
    JointRJD.initialize(chasis.body, FrontWheel.body, FrontWheel.body.getWorldCenter());

    JointRJD.enableMotor = false;

    Box2D.world.createJoint(JointRJD);
  }

  void display() {
    chasis.display(ChasisImage);
    FrontWheel.display(WheelImage);
    BackWheel.display(WheelImage);
  }

  void toggleMotor() {
    motor.enableMotor(!motor.isMotorEnabled());
  }
  
  void toggleDirection(){
    motor.setMotorSpeed(motor.getMotorSpeed() * -1); 
  }
}
