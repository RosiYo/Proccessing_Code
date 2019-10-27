class KochLine{
  PVector start, end;
  
  KochLine(PVector start_, PVector end_){
    start = start_.copy();
    end = end_.copy();
  }
  
  void display(){
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
  
  PVector findPointA(){
    PVector pointA_ = start.copy();
    return pointA_;
  }
  
  PVector findPointB(){
    PVector distance = PVector.sub(end, start); 
    PVector pointB_ = start.copy();
    pointB_.add(distance.div(3));
    return pointB_;
  }
  
  PVector findPointC(){
    PVector distance = PVector.sub(end, start); 
    distance.div(3);
    
    PVector pointC_ = start.copy();
    pointC_.add(distance);
    distance.rotate(-radians(60));
    pointC_.add(distance);
    
    return pointC_;
  }
  
  PVector findPointD(){
    PVector distance = PVector.sub(end, start); 
    
    PVector pointD_ = end.copy();
    pointD_.sub(distance.div(3));
    
    return pointD_;
  }
  
  PVector findPointE(){
    PVector pointE_ = end.copy();
    return pointE_; 
  }
}
