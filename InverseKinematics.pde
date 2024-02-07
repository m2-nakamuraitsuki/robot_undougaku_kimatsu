float posX=0, posY=35, posZ=70;
float millisOld, gTime, gSpeed = 4;
float c3 = 0;
float A, B, M, N = 0;

void IK(){
  float X = posX;
  float Y = posY;
  float Z = posZ;
  
  c3 = (X*X + Y*Y + (Z-10)*(Z-10) - 60*60 - 35*35)/(2*60*35);
  A = -sqrt(X*X + Y*Y);
  B = Z - 10;
  M = 60 + 35*c3;
  N = -35*sqrt(1- c3*c3);
  
  
  angle1 = atan2(Y, X) - HALF_PI;
  angle2 = atan2(M*A - N*B,N*A + M*B);
  angle3 = atan2(-sqrt(1- c3*c3),c3) + HALF_PI;
  angle5 = -(angle2 + angle3);
  angle6 = -angle1;
}

void setTime() {
  gTime += ((float)millis() / 1000 - millisOld) * (gSpeed / 4);
  if (gTime >= 4)  gTime = 0;  
  millisOld = (float)millis() / 1000;
}

void writePos(float targetX, float targetY,float targetZ){
  posX = targetX;
  posY = targetY;
  posZ = targetZ;
  // IK計算
  IK();
}
