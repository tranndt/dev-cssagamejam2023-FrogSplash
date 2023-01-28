int x = 120;
int y = 120;
int dx = 0;
int dy = 0;
int[] mapList;
int camera_x = 0;
int camera_y = 0;
int clear_flag = 0;
int level = 0;

int[][] stageList = {
 {
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
    99,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 99,
    99, 99, 99, 99, 99, 99, 99, 99,  0, 99,  0, 99,
    99,  1, 99,  0,  0,  0,  0,  0,  0, 99,  0, 99,
    99,  0, 99, 99,  0, 99, 99, 99, 99, 99,  0, 99,
    99,  0, 99,  0,  0, 99, 99, 99, 99, 99,  0, 99,
    99,  0,  0,  0, 99,  0,  0,  0,  0,  0,  0, 99,
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
 },
  {
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
    99,  0,  0,  0,  0,  0,  0,  0,  0,  0, 99, 99,
    99,  0, 99,  0, 99,  0, 99, 99, 99,  0, 99, 99,
    99,  0, 99,  0, 99,  0, 99, 99, 99,  0, 99, 99,
    99,  0, 99,  0, 99,  0,  0,  0, 99,  0, 99, 99,
    99,  0, 99,  0, 99,  0, 99,  0, 99, 99, 99, 99,
    99,  0, 99,  0, 99,  0, 99,  0,  0,  0,  1, 99,
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
  },
  {
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
    99,  0,  0,  0,  0,  0,  0,  0,  0, 99, 99, 99,
    99,  0, 99, 99, 99,  0, 99, 99,  0, 11, 11, 99,
    99,  0, 99, 99, 99,  0, 99, 99,  0, 99, 11, 99,
    99,  0,  0,  0,  0,  0,  0,  0,  0, 99, 11, 99,
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 11, 99,
    99,  1,  0,  0,  0,  0,  0,  0,  0,  0, 11, 99,
    99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99,
  },
  {
    99, 99, 99, 99, 99,  0, 99, 99,  0, 99, 99, 99,
     0,  0,  0,  0,  0,  0,  0, 99,  0, 99,  0,  0,
    99, 99, 99, 99, 99, 99, 99, 99,  0, 99, 99, 99,
    99,  1, 99,  0,  0,  0,  0,  0,  0,  0,  0, 99,
     0,  0, 99,  0, 99, 99, 99, 99,  0, 99,  0, 11,
    99, 99, 99,  0, 99, 99, 99, 99,  0, 99,  0, 99,
     0,  0,  0,  0, 99,  0,  0,  0,  0,  0,  0,  0,
    99, 99, 99, 99, 99,  0, 99, 99,  0, 99, 99, 99,
  }
};

int anime_t = 0;

void setup() {
  size(600, 400);
  initStage(level);
}

void draw(){
  background(30);
  if(abs(dx) > 0 || abs(dy) > 0){
    anime_t ++;
  }else{
    anime_t = 0; 
  }
  
  int prev_x = x;
  int prev_y = y;
  x += dx * 5;
  y += dy * 5;
  
  if(x < 0 || x > 1200){
    x = 1200 - x;
  }
  if(y < 0 || y > 800){
    y = 800 - y;
  }
  
  for(int i=0; i<mapList.length; i++){
    int block_x = i % 12 * 100;
    int block_y = int(i / 12) * 100;
    if(isHit(x, y, 50, 50, block_x, block_y, 100, 100) == 1){
      if(mapList[i] == 99){
        x = prev_x;
        y = prev_y;
        //soundManager.attack();
      }
      if(mapList[i] == 1){
        if(clear_flag == 0){
          clear_flag = 1;
          //soundManager.bass();
        }
        
      }
    }
    push();
    
    fill(80);
    if(mapList[i] == 99){
      fill(150);
    }
    //if(mapList[i] == 11){
    //  fill(80, 255); 
    //}
    rect(block_x - camera_x, block_y - camera_y, 100, 100);
    
    if(mapList[i] == 1){
      fill(0, 200, 255);
      rect(block_x + 10 - camera_x, block_y + 10 - camera_y, 100-20, 100-20, 5);
    }
    pop();
  }
  
  
  renderPlayer(x, y, dx, dy);

  for(int i=0; i<mapList.length; i++){
    int block_x = i % 12 * 100;
    int block_y = int(i / 12) * 100;
    if(mapList[i] == 11){
      fill(150, 200); 
      rect(block_x - camera_x, block_y - camera_y, 100, 100);
    }
    
  }
  
  if(clear_flag == 1){
    fill(0, 100);
    rect(0, 0, width, height);
    textAlign(CENTER, CENTER);
    
    textSize(32);
    fill(255);
    text("STAGE " + (level + 1) + "/" + stageList.length, width/2, height/2 - 100);
    
    textSize(64);
    fill(255);
    text("CLEAR", width/2, height/2);
    
    textSize(32);
    fill(255);
    text("Press Enter to Next", width/2, height/2 + 100);
  }
  
  int x_index = int(x / 600);
  int y_index = int(y / 400);
  camera_x += (x_index * 600 - camera_x) * 0.1;
  camera_y += (y_index * 400 - camera_y) * 0.1;
  // camera_x = x_index * 600;
  // camera_y = y_index * 400;
}


void keyPressed(){
  //if(bgm.isPlaying() == false){
  //  bgm.loop();
  //}
  if(keyCode == 'a' || key == 'a'){
    dx = -1;
  }
  if(keyCode == 'd'  || key == 'd'){
    dx = 1;
  }
  if(keyCode == 'w'  || key == 'w'){
    dy = -1;
  }
  if(keyCode == 's'  || key == 's'){
    dy = 1;
  }
  if(keyCode == ENTER){
    if(clear_flag == 1){
      level ++;
      level = level % stageList.length;
      initStage(level); 
    }
  }
}


void keyReleased(){
  if(keyCode == 'a' || key == 'a' ){
    if(dx < 0)  dx = 0;
  }
  if(keyCode == 'd' || key == 'd'){
    if(dx > 0)  dx = 0;
  }
  if(keyCode == 'w' || key == 'w'){
    if(dy < 0)  dy = 0;
  }
  if(keyCode == 's' || key == 's'){
    if(dy > 0)  dy = 0;
  }
}

void renderPlayer(int x, int y, int dx, int dy){
  float attach_x = 0;
  float attach_y = sin(radians(anime_t*15)) * 1;
  if(dx < 0){
    attach_x = -3;
  }
  if(dx > 0){
    attach_x = 3;
  }
  fill(255);
  rect(x - camera_x, y + attach_y - camera_y, 50, 50 - attach_y, 5);
  fill(80);
  ellipse(x + 15 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);
  ellipse(x + 35 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);
}

void initStage(int level){
  level = level % stageList.length;
  mapList = stageList[level];
  x = 120;
  y = 120;
  clear_flag = 0;
}

//void playerInitPos(int level){
//  for (int i = 0; i < stageList[level].length; i ++){
//    if (i == 2){}
//  }

//}

int isHit(int px, int py, int pw, int ph, int ex, int ey, int ew, int eh){
  if(px < ex + ew && px + pw > ex){
    if(py < ey + eh && py + ph > ey){
      return 1;
    }
  }
  return 0;
}
