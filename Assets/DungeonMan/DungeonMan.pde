//int x = 120;
int x = 0;
int y = 0;
int cols = 29;
int rows = 32;
int dx = 0;
int dy = 0;
int[] mapList;
int camera_x = 0;
int camera_y = 0;
int clear_flag = 0;
int level = 0;

int windowBlocks = 7;
int blockSize = 70;
int playerSize = (int) (blockSize*0.8);
PImage[] tree = new PImage[13];
PImage[] frog = new PImage[8];
PImage[] ground = new PImage[5];
PImage[] water = new PImage[14];
PImage health;
PFont font;

PImage[] goal = new PImage[6];
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

int anime_t = 0;

int stage = 0; // 0 = MAIN MENU, 1 = GAME, 2 = GAME OVER

void mainMenu(){
  // load background - Press enter to start
  font = createFont("Far-From Homecoming Updated.otf",10);
  PImage frog = loadImage("IntroScreen.jpg");
  //background(0,80,20,200);
  //textAlign(CENTER, CENTER);
  //fill(255, 214, 64);
  //textFont(font, height*0.13);
  //text("Frog Splash", width*0.5, height*0.1);
  //textFont(font, height*0.09);
  //fill(255, 214, 64);
  //text("Far From Home", width*0.5, height*0.22);
  //text("Press Enter to Start", width*0.5, height*0.9);
  image(frog,0,0,width,width);

}

void setup() {
  size(600 , 600);
  initStage(level);
  smooth();
  frameRate(15);
  for (int i = 0; i < frog.length; i++){
    frog[i] = loadImage("frog" +i+ ".png");
  }
  for (int i = 0; i < tree.length; i++){
    tree[i] = loadImage("tree"+ (i+1) + ".png");
  }
  for (int i = 0; i < ground.length; i++){
    ground[i] = loadImage("grass"+i+".png");
  }
  for (int i = 0; i < goal.length; i++){
    goal[i] = loadImage("goal"+i+".png");
  }
  for (int i = 0; i < water.length; i++){
    water[i] = loadImage("water"+i+".png");
  }
  health = loadImage("health.png");
}

void draw(){
  background(30);
  if (stage == 0){
      mainMenu();
      if (key == ENTER || keyCode == ENTER) stage = 1;
  }
  else if (stage == 1){
    fill(255, 255,0);
    //rect(0,0,2900,3200);
    fill(80);
    if(abs(dx) > 0 || abs(dy) > 0){
      anime_t ++;
    }else{
      anime_t = 0; 
    }
    
    int prev_x = x;
    int prev_y = y;
    x += dx * 15;
    y += dy * 15;
    
    if(x < 0 || x > cols*blockSize){
      x = cols*blockSize - x;
    }
    if(y < 0 || y > rows*blockSize){
      y = rows*blockSize - y;
    }
    
    for(int i=0; i<mapList.length; i++){
      int block_x = i % cols * blockSize;
      int block_y = int(i / cols) * blockSize;
      
      if(isHit(x, y, playerSize, playerSize, block_x, block_y, blockSize, blockSize) == 1){
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
      
    }
    
    renderMap(tree,ground);
    renderPlayer(x, y, dx, dy, frog);
      
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
    
    //int x_index = int(x / width);
    //int y_index = int(y / height);
    //camera_x += (x_index * width - camera_x) * 0.1;
    //camera_y += (y_index * width - camera_y) * 0.1;
    camera_x = x - width/2 + playerSize/2;
    camera_y = y - height/2 + playerSize/2;
     //camera_x = x_index * width;
     //camera_y = y_index * width;
    //printArray(new int[] {x,y,x_index,y_index,camera_x,camera_y});
}

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

void renderPlayer(int x, int y, int dx, int dy, PImage[] frog){
  float attach_x = 0;
  float attach_y = sin(radians(anime_t*15)) * 1;
  for (int i = 0; i < frog.length; i++){
    image(frog[frameCount%8], x - camera_x, y + attach_y - camera_y,playerSize, playerSize*13/16);
   
  }
  
}

void renderMap(PImage[] tree, PImage[] ground){
  for(int i=0; i<mapList.length; i++){
    int block_x = i % cols * blockSize;
    int block_y = int(i / cols) * blockSize;
    
    pushMatrix();
    fill(80);
    if(mapList[i] == 99){ //wall
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(tree[i%tree.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      //fill(150);
    }
    if(mapList[i] == 2){ //start
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    if(mapList[i] == 4){ //dies instantly
      fill(255, 255,0); 
    }
    
    if(mapList[i] == 0){ //path
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    
    if(mapList[i] == 820){ //water
      image(water[frameCount%water.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
    }
    if(mapList[i] == 6){ //health
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(health,block_x-camera_x+blockSize/4,block_y-camera_y+blockSize/4,blockSize*0.5,blockSize*0.5);
    }
    //rect(block_x - camera_x, block_y - camera_y, 100, 100);
    
    if(mapList[i] == 1){ //target
      image(ground[i%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      image(goal[frameCount%ground.length],block_x-camera_x,block_y-camera_y,blockSize,blockSize);
      //rect(block_x + 10 - camera_x, block_y + 10 - camera_y, blockSize-20, blockSize-20, 5);
    }
    popMatrix();
  }
  
}

void initStage(int level){
  level = level % stageList.length;
  mapList = stageList[level];
  initPlayerPos(level);
  clear_flag = 0;
}

void initPlayerPos(int level){
  int index = 0;
  for (int i = 0; i < stageList[level].length; i ++){
    if (stageList[level][i] == 2){
      index = i;
      break;
    }
  }
  x = index%cols * blockSize;
  y = (int)(index/cols) * blockSize;

}

int isHit(int px, int py, int pw, int ph, int ex, int ey, int ew, int eh){
  if(px < ex + ew && px + pw > ex){
    if(py < ey + eh && py + ph > ey){
      return 1;
    }
  }
  return 0;
}
