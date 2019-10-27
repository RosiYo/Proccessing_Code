import toxi.geom.*;

//Put only 2D or 3D libraries, otherwise it can overide
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

VerletPhysics2D world;
Particle[] p = new Particle[3];

void setup(){
  size(800, 400, P2D);
  
  //Toxiclibs basic world propieties
  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior(new Vec2D(0, 0.5))); 
  world.setWorldBounds(new Rect(0, 0, width, height));
  
  p[0] = new Particle(new Vec2D (width/2, 30));
  p[1] = new Particle(new Vec2D (width/3, 30));
  p[2] = new Particle(new Vec2D (width/8, 30));

  p[0].lock(); //Locking a particle in their place
  
  Vec2D len1 = p[0].loc_.sub(p[1].loc_); // <-- It makes a new Vec2D that contains a vector fom the first particle to the second one 
  VerletSpring2D spring1 = new VerletSpring2D(p[0], p[1], len1.magnitude(), 0.01); 
  
  Vec2D len2 = p[1].loc_.sub(p[2].loc_);
  VerletSpring2D spring2 = new VerletSpring2D(p[1], p[2], len2.magnitude(), 0.01); 

  //Finally add the elements
  
  world.addParticle(p[0]);
  world.addParticle(p[1]);
  world.addParticle(p[2]);
  
  world.addSpring(spring1);
  world.addSpring(spring2);
}

void draw(){
  background(255);
  world.update(); //Activate the library
  
  stroke(0);
  strokeWeight(1.5);
  line(p[0].x, p[0].y, p[1].x, p[1].y);
  line(p[1].x, p[1].y, p[2].x, p[2].y);
  
  for(Particle p_ : p){
    p_.display(); 
  }
  
  //Dragging the pendulum
  if(mousePressed && p[2].distanceTo(new Vec2D(mouseX, mouseY)) <= 40){
    p[2].lock();
      p[2].x = mouseX;
      p[2].y = mouseY;
    p[2].unlock();    
  }
}
