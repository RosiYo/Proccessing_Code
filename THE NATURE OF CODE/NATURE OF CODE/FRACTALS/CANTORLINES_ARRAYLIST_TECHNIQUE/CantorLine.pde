class CantorLine {
  PVector start, end;
  float separation;

  CantorLine(PVector start_, PVector end_) {
    start = start_.copy();
    end = end_.copy();
    separation = 100;
  }

  void displayLine() {
    line(start.x, start.y, end.x, end.y);
  }

  PVector findPointA() {
    PVector pointA_ = start.copy();
    pointA_.y += separation;
    return pointA_;
  }

  PVector findPointB() {
    PVector pointB_ = start.copy();
    PVector distance = PVector.sub(end, start);
    
    pointB_.add(distance.div(3));
    pointB_.y += separation;
    return pointB_;
  }
  
  PVector findPointC() {
    PVector pointC_ = end.copy();
    PVector distance = PVector.sub(end, start);
    
    pointC_.sub(distance.div(3));
    pointC_.y += separation;
    return pointC_;
  }
  
  PVector findPointD (){
    PVector pointD_ = end.copy();
    pointD_.y += separation;
    return pointD_;
  }
}
