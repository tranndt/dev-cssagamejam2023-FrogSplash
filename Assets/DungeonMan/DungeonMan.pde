import processing.sound.*;
SoundFile file;
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
boolean boom =false;

Map map = new Map(level);
Tile[] mapTile = map.createTile();
int blockSize = 80;
int playerSize = (int) (blockSize*0.6);
PImage[] tree = new PImage[13];
PImage[] frog = new PImage[8];
PImage[] ground = new PImage[5];
PImage[] water = new PImage[14];
PImage[] tnt = new PImage[19];
PImage[] spike = new PImage[5];
PImage[] health = new PImage[8];
PImage[] bomb = new PImage[10];
PImage[] start = new PImage[12];
PImage house;
<<<<<<< Updated upstream
PFont font;


int[][] stageList = {
  {
    99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,
    99,0,0,0,0,6,0,0,0,0,99,0,0,990,0,5,0,0,0,11,0,6,0,0,0,0,0,6,99,
    99,0,11,0,0,0,0,0,11,0,0,0,0,4,0,0,11,0,0,0,0,0,11,0,0,0,0,0,99,
    99,0,0,99,99,99,99,0,99,99,99,0,0,99,0,99,0,0,99,99,99,0,11,99,99,99,11,11,99,
    99,0,0,99,2,99,4,0,99,6,0,0,0,99,6,99,0,0,99,6,68,0,4,99,820,99,0,11,99,
    99,0,0,99,0,99,0,0,99,99,99,0,0,99,0,99,0,0,99,99,99,11,0,99,99,99,11,0,99,
    99,0,0,99,0,99,0,11,99,0,0,0,0,99,0,99,0,0,99,820,820,0,0,99,99,6,0,11,99,
    99,11,0,99,0,99,0,0,99,99,99,0,0,0,99,3,99,0,99,99,99,0,0,99,0,99,11,11,99,
    99,0,0,4,0,4,0,0,0,99,82,0,0,0,0,11,0,99,0,0,0,0,0,0,0,0,11,0,99,
    99,0,0,0,0,0,69,0,0,99,3,0,4,0,0,0,0,0,99,0,0,4,0,0,0,0,0,0,99,
    99,0,11,99,99,99,0,0,99,99,99,0,0,99,99,99,11,0,99,99,99,0,0,11,990,0,0,0,99,
    99,11,11,99,0,0,0,0,99,820,99,0,0,99,820,99,0,0,99,6,99,0,0,99,6,99,82,0,99,
    99,11,6,99,0,99,0,11,99,820,99,11,0,99,820,99,0,0,99,0,99,0,11,99,99,99,0,0,99,
    99,11,11,99,6,99,0,6,99,820,99,0,0,99,820,99,0,333,99,11,99,0,0,99,820,99,0,4,99,
    99,0,11,99,99,99,0,99,99,99,99,99,3,99,0,99,99,99,99,0,99,0,0,99,820,99,0,6,99,
    99,0,11,11,11,0,0,0,0,6,0,0,99,0,0,0,0,0,0,0,0,0,99,0,0,0,69,99,99,
    99,0,11,11,11,0,0,0,0,0,0,11,99,0,69,0,11,0,0,0,96,99,11,0,0,0,0,0,99,
    99,0,0,99,99,99,909,909,99,99,99,0,99,99,0,99,99,99,99,99,99,909,11,99,99,99,4,0,99,
    99,0,0,99,0,0,0,11,6,99,820,0,0,99,0,99,0,0,99,6,86,0,4,99,99,99,82,82,99,
    99,0,0,99,0,99,0,0,0,99,820,11,0,99,0,99,0,0,99,99,99,11,0,909,1,990,0,11,99,
    99,0,0,99,6,99,0,0,3,99,820,0,0,99,6,99,820,0,99,820,820,0,0,99,99,99,0,4,99,
    99,6,0,99,99,99,0,82,99,99,99,0,0,0,99,820,820,11,99,99,99,0,0,99,99,99,11,0,99,
    99,11,0,4,0,0,0,0,0,0,0,99,96,0,11,0,0,0,0,0,0,0,909,0,0,4,4,0,99,
    99,990,0,0,0,0,0,0,0,11,0,0,99,0,0,0,0,0,0,11,0,99,0,990,82,6,0,420,99,
    99,0,99,0,0,0,333,99,99,99,99,0,0,99,0,99,0,4,99,820,99,11,11,99,99,99,4,0,99,
    99,0,0,99,820,99,99,0,99,820,99,0,0,99,0,99,0,0,99,820,99,11,0,99,820,99,0,0,99,
    99,11,0,99,820,99,0,0,99,820,99,0,11,99,0,99,909,909,99,820,99,11,0,99,99,99,0,0,99,
    99,3,0,0,99,0,0,0,99,6,990,0,3,99,6,99,0,0,99,820,99,0,11,99,11,0,0,6,99,
    99,99,99,0,99,420,4,99,99,99,99,99,99,99,99,99,0,0,99,99,99,11,0,99,0,0,99,99,99,
    99,0,0,0,99,0,6,0,11,0,0,0,11,0,4,0,0,11,0,0,0,82,0,0,0,4,0,820,99,
    99,6,11,0,4,0,11,0,0,0,4,0,0,0,0,11,0,0,0,4,0,0,0,11,0,0,0,820,99,
    99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99
  }

};
=======
>>>>>>> Stashed changes

int anime_t = 0;

int stage = 0; // 0 = MAIN MENU, 1 = GAME, 2 = GAME OVER

void mainMenu(){
  // load background - Press enter to start
  font = createFont("Far-From Homecoming Updated.otf",10);
    //PImage frog = loadImage("frog2.png");

  //font = createFont("Far-From Homecoming Updated.otf",10);
  PImage frog = loadImage("IntroScreen.jpg");
  //background(0,80,20,200);
  //textAlign(CENTER, CENTER);
  //fill(255, 214, 64);
  textFont(font, height*0.13);
  //text("Frog Splash", width*0.5, height*0.1);
  //textFont(font, height*0.09);
  //fill(255, 214, 64);
  //text("Far From Home", width*0.5, height*0.22);
  //text("Press Enter to Start", width*0.5, height*0.9);
  image(frog,0,0,width,width);
}

void healthBar(){
  // draw heart image and number 
  int offset_x = 10;
  int offset_y = 10;
  PImage healthDisplay = loadImage("frog2.png");
  fill(255, 214, 64);
  image(healthDisplay,offset_x,offset_y,playerSize*0.6,playerSize*0.6*13/16);
  //textAlign(LEFT, TOP);

  textFont(font,playerSize*0.4);
  text(player.health,offset_x+20+playerSize*0.4,offset_y+5+playerSize*0.4);
}

void setup() {
  size(700 , 700);
  initStage(level);
  smooth();
  frameRate(15);
  
  //this loads the file based on the file name
  file = new SoundFile(this,"");
  file.play();
  
  //this changes the volume level (number between 0 and 1)
  file.amp(.5);
  
  for (int i = 0; i < frog.length; i++){
    frog[i] = loadImage("frog" +i+ ".png");
  }
  for (int i = 0; i < tree.length; i++){
    tree[i] = loadImage("tree"+ (i+1) + ".png");
  }
  for (int i = 0; i < ground.length; i++){
    ground[i] = loadImage("grass"+i+".png");
  }
  for (int i = 0; i < water.length; i++){
    water[i] = loadImage("water"+i+".png");
  }
  for (int i = 0; i < tnt.length; i++){
    tnt[i] = loadImage("tnt"+i+".png");
  }
  for (int i = 0; i < spike.length; i++){
    spike[i] = loadImage("spike"+(i+1)+".png");
  }
  for (int i = 0; i < health.length-4; i++){
    health[i] = loadImage("health"+i+".png");
    health[i+4] = loadImage("health"+i+".png");
  }
  for (int i = 0; i < bomb.length; i++){
    bomb[i] = loadImage((i+1)+".png");
  }
  for (int i = 0; i < start.length-2; i++){
    start[i] = loadImage("start"+i+".png");
    start[i+1] = loadImage("start"+i+".png");
    start[i+2] = loadImage("start"+i+".png");
  }
  house = loadImage("house.png");
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
      if(mapTile[i].type == 4){  //instant death
        if(frameCount % (1.1*frameRate) <= frameRate){
          fill(250);
          mapTile[i].deactivated = false;
        }
        else{
          fill(0);
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
    
    if(clear_flag == -2){
      fill(0, 100);
      rect(0, 0, width, height);
      textAlign(CENTER, CENTER);
      fill(255, 214, 64);

      
      textSize(45);
      text("Froggie.exe just CRASHED", width/2, height/2);
      
      textSize(32);
      text("Press Enter to Play Again", width/2, height/2 + 100);
    }
    
    camera_x = player.x - width/2 + playerSize/2;
    camera_y = player.y - height/2 + playerSize/2;
    healthBar();
    if(boom){
      boomBar();
    }
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
    initStage(level);
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
  ////if(dx < 0){
  ////   attach_x = -3;
  ////}
  ////if(dx > 0){
  ////  attach_x = 3;
  


  for (int i = 0; i < frog.length; i++){
    image(frog[frameCount%8], x - camera_x, y + attach_y - camera_y,playerSize, playerSize*13/16);
   
  }
  
}

void renderMap(PImage[] tree, PImage[] ground){
  for(int i=0; i<map.length_; i++){
    int block_x = i % map.cols * blockSize;
    int block_y = int(i / map.cols) * blockSize;
    int messageIndex = 0;
    
    pushMatrix();
    fill(80);
    if(mapTile[i].type == 99 || mapTile[i].type == 990){ //wall
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
    
    if(mapTile[i].type == 0 || mapTile[i].type == 909){ //path
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    
    if(mapTile[i].type == 820){ //water
      image(water[frameCount%water.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    if(mapTile[i].type == 6){ //health
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(health[frameCount%health.length],block_x-camera_x+blockSize/4,block_y-camera_y+blockSize/4,blockSize*0.5,blockSize*0.5);
    }
    if(mapTile[i].type == 3 && mapTile[i].showKey == true){ //dynamite - tnt
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(tnt[frameCount%tnt.length],block_x-camera_x+blockSize/4,block_y-camera_y+blockSize/4,blockSize*0.7,blockSize*0.7);
      messageIndex = i;
    }
    if(mapTile[i].type == 333){ //bomb
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(tnt[frameCount%tnt.length],block_x-camera_x+blockSize/4,block_y-camera_y+blockSize/4,blockSize*0.7,blockSize*0.7);
    }
    //rect(block_x - camera_x, block_y - camera_y, 100, 100);

    if(mapTile[i].type == 1){ //target
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(house,block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      //rect(block_x + 10 - camera_x, block_y + 10 - camera_y, blockSize-20, blockSize-20, 5);

    }
    if(mapTile[messageIndex].showKey == true){
      boom = true;
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
  if((mapTile[i].type == 99 || mapTile[i].type == 909)){
    player.x = prev_x;
    player.y = prev_y;
        //soundManager.attack();
  }
  
  
  //finish tile
  if(mapTile[i].type == 1){
    if(clear_flag == 0){
      clear_flag = 1;
      player.playerSpeed = 0;
      //soundManager.bass();
    }
  }
  
  
  //loop back to start
  if(mapTile[i].type == 82){
    initPlayerPos(2);
  }
  
  
  //death
  if(mapTile[i].type == 4 && mapTile[i].deactivated == false){
    player.health = 0;
    player.playerSpeed = 0;
    mapTile[i].deactivated = true;
    clear_flag = -2;
  }
  
  
  //build wall
  if(mapTile[i].type == 69 && mapTile[i].deactivated == false && mapTile[i].first == false){
    map.randomWall(i);
    mapTile[i].deactivated = true;
    mapTile[i].first = true;
  }
  
  //build path
  if(mapTile[i].type == 96 && mapTile[i].deactivated == false){
    map.randomPath(i);
    mapTile[i].deactivated = true;
  }
  
  //spike
  if(mapTile[i].type == 11 && mapTile[i].deactivated == false){
    player.health--;
    
    Tile[] neighbor = map.getNbr(i);
    int[] index = map.neiIndex(i);
    for(int j=0; j<8;j++){
      if(neighbor[j].type == 0){
        player.x = index[j]%map.cols * blockSize;
        player.y = (int)(index[j]/map.cols) * blockSize;
      }
    }
    //if(dx < 0){
    //  dx = 1;
    //}else{
    //  dx = -1;
    //}
    //if(dy < 0){
    //  dy = 1;
    //}else{
    //  dy = -1;
    //}
    //if(dx == 0 && dy == 0){
    //  dx = 1;
    //}
    mapTile[i].deactivated = true;
  }
  
  //add health
  if(mapTile[i].type == 6 && mapTile[i].deactivated == false){
    player.health++;
    print(player.health);
    mapTile[i].type = 0;
    mapTile[i].deactivated = true;
  }
  
  //x2 speed
  if(mapTile[i].type == 5 && mapTile[i].deactivated == false && mapTile[i].first == false){
    player.playerSpeed = player.playerSpeed*2;
    mapTile[i].deactivated = true;
    mapTile[i].first = true;
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
      mapTile[i].type = 0;
      mapTile[i].deactivated = true;
    }
  }
  
  //key 
  if(mapTile[i].type == 3 && mapTile[i].deactivated == false && mapTile[i].showKey == true){
    player.numKey++;
    mapTile[i].type = 0;
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

void boomBar(){
  // draw heart image and number 
  int offset_x = width/2;
  int offset_y = height/20;
  fill(255, 214, 64);
  textFont(font,playerSize*0.6);
  text(player.numKey+"/3 TNT",offset_x, offset_y);
}
