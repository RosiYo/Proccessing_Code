class Attractor {
  
  float x, y, z;
  float a, b, c;
  
  float timeDiferential; //constant wich will give sense to the ecuation
  ArrayList <PVector> coordenatesList;

  Attractor(int firstValue, int secondValue, int thirdValue, float timeDiferential_) {
    
    a = firstValue;
    b = secondValue;
    c = thirdValue;
    
    x = 0.01;
    y = 0;
    z = 0;
    
    
    timeDiferential = timeDiferential_;
    coordenatesList = new ArrayList <PVector>();
  }

  void calculateTheAddedCoordenates() {
    float dx = timeDiferential * ( a * (y - x));
    float dy = timeDiferential * ( x * (b - z) - y);
     float dz = timeDiferential * ( x * y - c * z);
    
    x += dx;
    y += dy;
    z += dz;
  }
  
  void display(){
    calculateTheAddedCoordenates();
    coordenatesList.add(new PVector(x, y, z));
    
    beginShape();
    for (PVector coordenate : coordenatesList){
      vertex(coordenate.x, coordenate.y, coordenate.z);
    }
    endShape();
  }
}
