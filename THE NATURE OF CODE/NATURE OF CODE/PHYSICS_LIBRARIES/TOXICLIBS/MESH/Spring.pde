class Spring extends VerletSpring2D{
  
  Particle firstConnection, secondConnection;
  
  Spring(Particle firstConnection_temp, Particle secondConnection_temp, float lengthBetweenParticles, float springStrength){
    super(firstConnection_temp, secondConnection_temp, lengthBetweenParticles, springStrength);
    firstConnection = firstConnection_temp;
    secondConnection = secondConnection_temp;
  }
  
  void display(){
    stroke(0);
    line(firstConnection.x, firstConnection.y, secondConnection.x, secondConnection.y);
  }
}
