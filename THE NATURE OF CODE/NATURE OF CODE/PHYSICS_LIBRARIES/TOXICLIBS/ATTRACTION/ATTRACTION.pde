import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

VerletPhysics2D world;
Attractor attractor;
ArrayList <Attracted> particles;

void setup(){
  size(600, 600);
  
  world = new VerletPhysics2D();
  world.setWorldBounds(new Rect(0, 0, width, height));
  world.setDrag(1);
  
  particles = new ArrayList <Attracted>();
  
  for(int i = 0; i < 1; i++){
    particles.add(new Attracted(new Vec2D(random(width), random(height)))); 
  }
  
  attractor = new Attractor(new Vec2D(mouseX, mouseY));
}

void draw(){
  background(255);
  world.update();
  attractor = new Attractor(new Vec2D(mouseX, mouseY));
  attractor.display();
  
  for(Attracted particle : particles){
    particle.display(); 
  }
}

void keyPressed(){
   particles.add(new Attracted(new Vec2D(random(width), random(height))));
}
