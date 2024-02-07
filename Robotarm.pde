float baseH = 5;
float armL1 = 60;
float armL2 = 20;
float armL4 = 20;
float armW1 = 10;
float armW2 = 10;
float armW3 = 5;
float armW4 = 5;
float angle0 = 270;
float angle1 = 0;
float angle2 = 0;
float angle3 = 0;
float angle4 = 0;
float angle5 = 0;
float angle6 = 0;
float l3 = 10;
float l4 = 20;
float dif = 1.0/100;
float angleX = 0;
float angleY = 0;
boolean Auto = true;
int red;
int base_time = 0;
float i = 0;
int flame = 0;
MouseCamera mouseCamera;

void setup(){
  size(1200, 800, P3D);
  mouseCamera = new MouseCamera(800.0, 0, 0, (height/5.0)/tan(PI*30.0/180.0), 0, 0, 0, 0, 1, 0); // MouseCameraの生成

  //background(255);
  
  noStroke();  
  
}

void draw(){
  mouseCamera.update(); // MouseCameraのアップデート
  
  if (!Auto){
    background(100, 100, 200);
  }
  else{
    background(255);
  }
  lights();
  
  //座標をわかりやすい向きに
  rotateZ(radians(angle0));
  
  //塔を描画
  tower tower = new tower(100, 30, 40);
  tower.drawTower();
  if(keyPressed){
    if(key == 'w'){
      //wが押されると0.1秒待機して自動と手動モードの切り替え
      delay(100);
      Auto = !Auto;
      angle1 = 0;
      angle2 = 0;
      angle3 = 0;
      angle4 = 0;
      angle5 = 0;
      angle6 = 0;
      l3 = 10;
      l4 = 20;
    }
    if(key == 'e'){
      //eが押されると0.1秒待機して赤い塔の場所を切り替え
      delay(100);
      red = int(random(2) + 0.5);
    }
  }
  //手動モードのキー操作
  if (!Auto){
    if(keyPressed){
      if(key == 'a'){
        angle1 = angle1 + dif;
      }
      if(key == 'z'){
        angle1 = angle1 - dif;
      }
      if(key == 's'){
        angle2 = angle2 - dif;
      }
      if(key == 'x'){
        angle2 = angle2 + dif;
      }
      if(key == 'd'){
        angle3 = angle3 + dif;
      }
      if(key == 'c'){
        angle3 = angle3 - dif;
      }
      if(key == 'f'){
        angle4 = angle4 + dif;
      }
      if(key == 'v'){
        angle4 = angle4 - dif;
      }  
      if(key == 'g'){
        angle5 = angle5 + dif;
      }
      if(key == 'b'){
        angle5 = angle5 - dif;
      }
      if(key == 'h'){
        angle6 = angle6 + dif/5;
      }
      if(key == 'n'){
        angle6 = angle6 - dif/5;
      }
      //姿勢をリセット
      if(key == 'q'){
        angle1 = 0;
        angle2 = 0;
        angle3 = 0;
        angle4 = 0;
        angle5 = 0;
        angle6 = 0;
        l3 = 10;
        l4 = 20;
      }
    }
  }
  //自動モードの動作
  else{
    i = acos(cos(radians(flame*3))) / PI;
    if(red == 0){
      writePos(lerp(0, 30, i),lerp(35, 80, i),lerp(70, 50, i));
    }
    else if(red == 1){
      writePos(0,lerp(35, 80, i),lerp(70, 50, i));
    }
    else{
      writePos(lerp(0, -30, i),lerp(35, 80, i),lerp(70, 50, i));
    }
  flame++;
  }
  
  //base1
  translate(0,0,baseH/2);
  fill(175);
  box(30,30,baseH);
  translate(0,0,baseH/2);
  
  //base2
  rotateZ(angle1);
  translate(0,0,baseH/2);
  fill(175);
  box(20,20,baseH);
  translate(0,0,baseH/2);
    
  //1st link
  rotateX(angle2);
  translate(0,0,armL1/2);
  fill(150);
  box(armW1,armW1,armL1);
  //go to 2nd joint
  translate(0,0,armL1/2);
  
  //2nd link
  rotateX(angle3);  
  translate(0,(armL2-armW1)/2,0);
  fill(125);
  box(armW2,armL2,armW2);
  //go to 3rd joint
  translate(0,armL2/2,0);

  //3rd link
  rotateY(angle4);  
  //go to center of 2nd joint
  translate(0,armL2/2,0);
  fill(125);
  box(armW2,armL2,armW2);
  //go to 4th joint
  translate(0,armL2/2,0);
  
  //4th link
  rotateX(angle5);
  rotateZ(angle6);
  translate(0, l3/2, 0);
  fill(100);
  box(armW3,l3,armW3);
  translate(0, l3/2, 0);
  
  //hand
  translate(0, l4/2, 0);
  box(l4);
}

// マウス操作に応じたMouseCameraの関数を呼び出す
void mousePressed() {
    mouseCamera.mousePressed();
}
void mouseDragged() {
    mouseCamera.mouseDragged();
}
void mouseWheel(MouseEvent event) {
    mouseCamera.mouseWheel(event);
}
