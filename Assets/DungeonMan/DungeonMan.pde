int dx = 0;
int dy = 0;
int camera_x = 0;
int camera_y = 0;
int clear_flag = 0;
int level = 0;

int windowBlocks = 7;
Player player;
int prev_x;
int prev_y;
char up = 'w';
char down = 's';
char left = 'a';
char right = 'd';
int anime_t = 0;

Map map = new Map(level);
Tile[] mapTile = map.createTile();
int blockSize = 80;
int playerSize = (int) (blockSize*0.8);
PImage[] tree = new PImage[12];
PImage[] frog = new PImage[8];
PImage[] ground = new PImage[5];
PFont font;

//int anime_t = 0;
int stage = 0; // 0 = MAIN MENU, 1 = GAME, 2 = GAME OVER

void mainMenu(){
  // load background - Press enter to start
  font = createFont("Far-From Homecoming Updated.otf",10);
  PImage frog = loadImage("frog2.png");
  background(0,80,20,200);
  textAlign(CENTER, CENTER);
  textFont(font, height*0.13);
  text("Frog Splash", width*0.5, height*0.1);
  textFont(font, height*0.09);
  fill(255, 214, 64);
  text("Far From Home", width*0.5, height*0.22);
  text("Press Enter to Start", width*0.5, height*0.9);
  image(frog,width*0.15,height*0.25,width*0.7,width*0.7*13/16);

}

void setup() {
  size(700 , 700);
  initStage(level);
  smooth();
  frameRate(20);
  for (int i = 0; i < frog.length; i++){
    frog[i] = loadImage("frog" +i+ ".png");
  }
  for (int i = 0; i < tree.length; i++){
    tree[i] = loadImage("tree"+ (i+1) + ".png");
  }
  for (int i = 0; i < ground.length; i++){
    ground[i] = loadImage("grass"+i+".png");
  }
}

void draw(){
  background(30);
  
  if (stage == 0){
      mainMenu();
      if (key == ENTER || keyCode == ENTER) stage = 1;
  }
  else if (stage == 1){
    // Tien's code
    prev_x = player.x;
    prev_y = player.y;
    player.x += dx * player.playerSpeed;
    player.y += dy * player.playerSpeed;
    
    if(player.x < 0 || player.x > map.cols*blockSize){
      player.x = map.cols*blockSize - player.x;
    }
    if(player.y < 0 || player.y > map.rows*blockSize){
      player.y = map.rows*blockSize - player.y;
    }
    
    for(int i=0; i<map.length_; i++){
      int block_x = i % map.cols * blockSize;
      int block_y = int(i / map.cols) * blockSize;
      if(isHit(player.x, player.y, playerSize, playerSize, block_x, block_y, blockSize, blockSize) == 1){
          trap(i);
      }else{
        mapTile[i].deactivated = false;
      }
 
      push();
      //render color
      fill(80);
      if(mapTile[i].type == 99){ //wall
        fill(150);
      }
      if(mapTile[i].type == 2){ //start
        fill(80, 255); 
      }
      if(mapTile[i].type == 4){ //death
        fill(255, 255,0); 
      }
      
      
      //fill(255, 255,0);
      ////rect(0,0,2900,3200);
      //fill(80);
      if(abs(dx) > 0 || abs(dy) > 0){
        anime_t ++;
      }else{
        anime_t = 0; 
      }
      
      if(mapTile[i].type == 990){ //path but looks like wall
        fill(140); 
      }
      if(mapTile[i].type == 11){  //spike
        if(frameCount % (4*frameRate) <= frameRate){
          fill(0);
          mapTile[i].deactivated = false;
        }
        else{
          fill(80);
          mapTile[i].deactivated = true;
        }
      }
      if(mapTile[i].type == 3 && mapTile[i].showKey ==  true){ //key color
        fill(100,90,100);
      }
      
      rect(block_x - camera_x, block_y - camera_y, blockSize, blockSize);
        
      if(mapTile[i].type == 1){
        fill(0, 200, 255);
        rect(block_x + 10 - camera_x, block_y + 10 - camera_y, blockSize-20, 100-blockSize, 5);
      }
      pop();
      
    }//end for loop 
    
    //renderPlayer(player.x, player.y, dx, dy);
    
    renderMap(tree,ground);
    renderPlayer(player.x, player.y, dx, dy, frog);
  
    for(int i=0; i<map.length_; i++){
      int block_x = i % map.cols * blockSize;
      int block_y = int(i / map.cols) * blockSize;
      if(mapTile[i].type == 2){
        fill(0, 0,20,50); 
        rect(block_x - camera_x, block_y - camera_y, blockSize, blockSize);
      }
      
    }
    
    if(clear_flag == 1){
      fill(0, 100);
      rect(0, 0, width, height);
      textAlign(CENTER, CENTER);
      
      textSize(32);
      //fill(255);
        fill(255, 214, 64);

      
      textSize(64);
      text("You Found HOME", width/2, height/2);
      
      textSize(32);
      text("Press Enter to Play Again", width/2, height/2 + 100);
    }
    
    if(clear_flag == -1){
      fill(0, 100);
      rect(0, 0, width, height);
      textAlign(CENTER, CENTER);
      fill(255, 214, 64);

      
      textSize(64);
      text("You LOST", width/2, height/2);
      
      textSize(32);
      text("Press Enter to Play Again", width/2, height/2 + 100);
    }
    
    //int x_index = int(x / width);
    //int y_index = int(y / height);
    //camera_x += (x_index * width - camera_x) * 0.1;
    //camera_y += (y_index * width - camera_y) * 0.1;
    camera_x = player.x - width/2 + playerSize/2;
    camera_y = player.y - height/2 + playerSize/2;
     //camera_x = x_index * width;
     //camera_y = y_index * width;
    //printArray(new int[] {x,y,x_index,y_index,camera_x,camera_y});
   
    //  if(x < 0 || x > cols*blockSize){
    //    x = cols*blockSize - x;
    //  }
    //  if(y < 0 || y > rows*blockSize){
    //    y = rows*blockSize - y;
    //  }
      
    //  for(int i=0; i<mapList.length; i++){
    //    int block_x = i % cols * blockSize;
    //    int block_y = int(i / cols) * blockSize;
        
    //    if(isHit(x, y, playerSize, playerSize, block_x, block_y, blockSize, blockSize) == 1){
    //      if(mapList[i] == 99){
    //        x = prev_x;
    //        y = prev_y;
    //        //soundManager.attack();
    //      }
    //      if(mapList[i] == 1){
    //        if(clear_flag == 0){
    //          clear_flag = 1;
    //          //soundManager.bass(); 
    //        }
            
    //      }
    //    }
        
    //  }
      
    //  renderMap(tree,ground);
    //  renderPlayer(x, y, dx, dy, frog);
    
    //  for(int i=0; i<mapList.length; i++){
    //    int block_x = i % cols * blockSize;
    //    int block_y = int(i / cols) * blockSize;
    //    if(mapList[i] == 2){ //start point
    //      //fill(0, 0,20,50); 
    //      rect(block_x - camera_x, block_y - camera_y, blockSize, blockSize);
    //    }
        
    //  }
      
    //  if(clear_flag == 1){
    //    fill(0, 100);
    //    rect(0, 0, width, height);
    //    textAlign(CENTER, CENTER);
        
    //    textSize(32);
    //    fill(255);
    //    text("STAGE " + (level + 1) + "/" + stageList.length, width/2, height/2 - 100);
        
    //    textSize(64);
    //    fill(255);
    //    text("CLEAR", width/2, height/2);
        
    //    textSize(32);
    //    fill(255);
    //    text("Press Enter to Next", width/2, height/2 + 100);
    //  }
      
    //  //int x_index = int(x / width);
    //  //int y_index = int(y / height);
    //  //camera_x += (x_index * width - camera_x) * 0.1;
    //  //camera_y += (y_index * width - camera_y) * 0.1;
    //  camera_x = x - width/2 + playerSize/2;
    //  camera_y = y - height/2 + playerSize/2;
    //   //camera_x = x_index * width;
    //   //camera_y = y_index * width;
    //  //printArray(new int[] {x,y,x_index,y_index,camera_x,camera_y});
    //}
  }
  
}//end draw

void printArray(int [] array){
  for (int a : array){
    print(a+" ");
  }
  println();
}

void keyPressed(){
  //if(bgm.isPlaying() == false){
  //  bgm.loop();
  //}
  if(keyCode == left || key == left){
    print("keypressed");
    dx = -1;
  }
  if(keyCode == right  || key == right){
    dx = 1;
  }
  if(keyCode == up  || key == up){
    dy = -1;
  }
  if(keyCode == down  || key == down){
    dy = 1;
  }
  if(keyCode == ENTER){
    if(clear_flag == 1){
      level ++;
      level = level % map.num_map;
      initStage(level); 
    }
    if(clear_flag == -1){
      initStage(level);
    }
  }
}


void keyReleased(){
  if(keyCode == left || key == left ){
    if(dx < 0)  dx = 0;
  }
  if(keyCode == right || key == right){
    if(dx > 0)  dx = 0;
  }
  if(keyCode == up || key == up){
    if(dy < 0)  dy = 0;
  }
  if(keyCode == down || key == down){
    if(dy > 0)  dy = 0;
  }
}

void renderPlayer(int x, int y, int dx, int dy, PImage[] frog){
  float attach_x = 0;
  float attach_y = sin(radians(anime_t*15)) * 1;
  if(dx < 0){
     attach_x = -3;
  }
  if(dx > 0){
    attach_x = 3;
  }
  //fill(255);
  //rect(x - camera_x, y + attach_y - camera_y, playerSize, playerSize - attach_y, playerSize/4);
  //fill(80);
  //ellipse(x + playerSize/2 - 10 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);
  //ellipse(x + playerSize/2 + 10 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);

  for (int i = 0; i < frog.length; i++){
    image(frog[frameCount%8], x - camera_x, y + attach_y - camera_y,playerSize, playerSize*13/16);
   
  }
  
}

void renderMap(PImage[] tree, PImage[] ground){
  for(int i=0; i<map.length_; i++){
    int block_x = i % map.cols * blockSize;
    int block_y = int(i / map.cols) * blockSize;
    
    pushMatrix();
    fill(80);
    if(mapTile[i].type == 99){ //wall
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(tree[i%tree.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      //fill(150);
    }
    if(mapTile[i].type == 2){
      fill(80, 255); 
    }
    if(mapTile[i].type == 4){
      fill(255, 255,0); 
    }
    
    if(mapTile[i].type == 0){ //path
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    
    //rect(block_x - camera_x, block_y - camera_y, 100, 100);
    
    if(mapTile[i].type == 1){ //target
      fill(0, 200, 255);
      rect(block_x + 10 - camera_x, block_y + 10 - camera_y, blockSize-20, blockSize-20, 5);
    }
    popMatrix();
  }
  
}

void initStage(int level){
  level = level % map.num_map;
  map = new Map(level);
  mapTile = map.createTile();
  player = new Player();
  initPlayerPos(2);
  reverseKey('a','d','w','s');
  clear_flag = 0;
}

void initPlayerPos(int position){
  int index = 0;
  for (int i = 0; i < map.length_; i ++){
    if (mapTile[i].type == position){
      index = i;
      break;
    }
  }
  player.x = index%map.cols * blockSize;
  player.y = (int)(index/map.cols) * blockSize;
  //x = index%cols * blockSize;
  //y = (int)(index/cols) * blockSize;
}

int isHit(int px, int py, int pw, int ph, int ex, int ey, int ew, int eh){
  if(px < ex + ew && px + pw > ex){
    if(py < ey + eh && py + ph > ey){
      return 1;
    }
  }
  return 0;
}

void trap(int i){
  
  //Wall
  if(mapTile[i].type == 99 || mapTile[i].type == 909){
    player.x = prev_x;
    player.y = prev_y;
        //soundManager.attack();
  }
  
  
  //finish tile
  if(mapTile[i].type == 1){
    if(clear_flag == 0){
      clear_flag = 1;
      //soundManager.bass();
    }
  }
  
  
  //loop back to start
  if(mapTile[i].type == 82){
    initStage(0);
  }
  
  
  //death
  if(mapTile[i].type == 4 && mapTile[i].deactivated == false){
    player.health = 0;
    player.playerSpeed = 0;
    mapTile[i].deactivated = true;
    clear_flag = -1;
  }
  
  
  //build wall
  if(mapTile[i].type == 69 && mapTile[i].deactivated == false){
    map.randomWall(i);
    mapTile[i].deactivated = true;
  }
  
  //build path
  if(mapTile[i].type == 96 && mapTile[i].deactivated == false){
    map.randomPath(i);
    mapTile[i].deactivated = true;
  }
  
  //spike
  if(mapTile[i].type == 11 && mapTile[i].deactivated == false){
    player.health--;
    if(dx < 0){
      dx += 4;
    }else{
      dx -= 4;
    }
    if(dy < 0){
      dy += 4;
    }else{
      dy -= 4;
    }
    if(dx == 0 && dy == 0){
      dx +=4;
    }
    print(player.health);
    mapTile[i].deactivated = true;
  }
  
  //add health
  if(mapTile[i].type == 6 && mapTile[i].deactivated == false){
    player.health++;
    print(player.health);
    mapTile[i].deactivated = true;
  }
  
  //x2 speed
  if(mapTile[i].type == 5 && mapTile[i].deactivated == false){
    player.playerSpeed = player.playerSpeed*2;
    mapTile[i].deactivated = true;
  }
  
  //first time step on 333
  if(mapTile[i].type == 333 && mapTile[i].deactivated == false && mapTile[i].first == false){
    for(int j=0; j<map.length_;j++){
      if(mapTile[j].type == 3){
        mapTile[j].showKey = true;
      }      
    }
    mapTile[i].first = true;
  }else if(mapTile[i].type == 333 && mapTile[i].deactivated == false && mapTile[i].first == true){ //bomb
    if(player.numKey >= 3){
      map.bomb(i);
      mapTile[i].deactivated = true;
    }
  }
  
  //key 
  if(mapTile[i].type == 3 && mapTile[i].deactivated == false && mapTile[i].showKey == true){
    player.numKey++;
    mapTile[i].showKey = false;
    mapTile[i].deactivated = true;
  }
  
  //teleport
  if(mapTile[i].type == 86 && mapTile[i].deactivated == false){
    initPlayerPos(68);
    mapTile[i].deactivated = true;
  }
  
  //shuffle controls
  if(mapTile[i].type == 420 && mapTile[i].deactivated == false){
    if(left == 'a'){
      reverseKey('d','a','s','w');
    }else{
      reverseKey('a','d','w','s');
    }
    mapTile[i].deactivated = true;
  }//420
}//end trap

void reverseKey(char left_, char right_, char up_, char down_){
  left = left_;
  right = right_;
  up = up_;
  down = down_;
}
