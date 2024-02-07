class tower{
  float barDistance;
  float barInterval;
  float barHeight;
  
  tower(float Distance, float Interval, float Height){
    barDistance = Distance;
    barInterval = Interval;
    barHeight = Height;
  }
  
  void drawTower(){
    fill(204);
    translate(0, barDistance, 0);
    pushMatrix();
    translate(0, 0, barHeight/2);
    if(red == 1){
      fill(255,0,0);
      box(10, 10, barHeight);
      fill(204);
    }
    else{
      box(10, 10, barHeight);
    }
    popMatrix();
    pushMatrix();
    translate(barInterval, 0, barHeight/2);
    if(red == 0){
      fill(255,0,0);
      box(10, 10, barHeight);
      fill(204);
    }
    else{
      box(10, 10, barHeight);
    }
    popMatrix();
    pushMatrix();
    translate(-barInterval, 0, barHeight/2);
    if(red == 2){
      fill(255,0,0);
      box(10, 10, barHeight);
      fill(204);
    }
    else{
      box(10, 10, barHeight);
    }
    popMatrix();
    translate(0, -barDistance, 0);
  }
}
