class Path{
  PVector start, end;
  float pathRadius;
  
  Path(PVector start_, PVector end_){
    end = end_.copy();
    start = start_.copy();
    
    pathRadius = 6;
  }
  
  void display(){
    strokeWeight(2);
    line(start.x, start.y, end.x, end.y);
  }
}
