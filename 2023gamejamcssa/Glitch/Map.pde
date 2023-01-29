class Map {
  //int X = 0;
  //int Y = 0;
  int startX = 0;
  int startY = 0;
 
  
  int [] map = {
    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,
    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
    -1,0,-1,-1,-1,0,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,0,-1,-1,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,0,0,-1,0,-1,0,-1,0,0,0,-1,0,-1,0,-1,
    -1,0,-1,0,-1,0,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,0,-1,-1,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,0,0,-1,0,-1,0,-1,1,0,0,-1,-1,0,0,-1,
    -1,0,-1,0,-1,0,-1,-1,-1,0,0,-1,0,0,-1,-1,-1,0,-1,0,-1,0,-1,
    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
    -1,0,-1,-1,-1,0,-1,-1,-1,0,-1,-1,-1,0,-1,-1,-1,0,0,-1,0,0,-1,
    -1,0,-1,0,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,
    -1,0,-1,-1,-1,0,-1,-1,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,
    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
    -1,0,-1,-1,-1,0,-1,-1,-1,0,-1,0,-1,0,-1,-1,-1,0,-1,-1,-1,-1,-1,
    -1,0,-1,0,0,0,0,-1,0,0,-1,0,-1,0,-1,0,0,0,-1,-1,-1,-1,-1,
    -1,0,-1,0,-1,0,0,-1,0,0,-1,0,-1,0,-1,-1,-1,0,-1,-1,99,0,-1,
    -1,0,-1,0,-1,0,0,-1,0,0,-1,0,-1,0,-1,0,0,0,-1,-1,-1,0,-1,
    -1,0,-1,-1,-1,0,-1,-1,-1,0,0,-1,0,0,-1,-1,-1,0,-1,-1,-1,0,-1,
    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
    -1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,
    -1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,-1,-1,0,-1,
    -1,0,0,-1,0,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,-1,0,0,0,-1,
    -1,-1,0,-1,0,0,-1,-1,-1,0,-1,-1,-1,0,-1,-1,-1,0,-1,0,-1,-1,-1,
    -1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,
    -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
  };
  int block_x = 50;
  int block_y = 50;
  int rows = 27;
  int cols = 23;
  int mapW = block_x * cols;
  int mapH = block_y * rows;

  Player player;

  
  Map(Player player){
    this.player = player;
    for(int i = 0; i < map.length;  i ++){
      if (map[i] == 1) {
        startX = i%cols*block_y + block_y/4;
        startY = (int)(i/cols)*block_x + block_x/4;
        break;
      }
  }}
  
void move_map(int offset_x, int offset_y){
  pushMatrix();
  println(X,Y); 
  translate(offset_x,offset_y);
  //X += offset_x;
  //Y += offset_y;
  render_map();
  popMatrix();
}

void render_map(){
    fill(150, 80, 10);
    rect(0,0,mapW,mapH);
    stroke(0, 0, 0, 0);
    // Draw obstacles
    for(int i = 0; i < map.length;  i ++){
      if (map[i] == -1)         fill(153,76,0);
      else if (map[i] == 0)     fill(255,255,255);
      else if (map[i] == 99)    fill(51,255,51);
      else if (map[i] == 1)    {
        fill(0,204,204);
      }
      //else
      rect(i%cols*block_x,(int)(i/cols)*block_y, block_x, block_y);
    }
    //stroke(0, 0, 0, 255);//reset stroke to normal
}

//boolean checkCollision(int map_dx,int map_dy){


//boolean checkCollision(int map_dx,int map_dy){
//  // Check if player collides with any Map object
//  boolean collision = false;
//  int player_curr_col = (int)(player.X/block_x);
//  int player_curr_row = (int)(player.Y/block_y);
//  // If  adjacent object collides with player's position, set to True
//  for (int[] pos : adjacentPositions(player_curr_row,player_curr_col)){
//     int new_obj_x = pos[1]*block_x + map_dx;
//     int new_obj_y = pos[0]*block_y + map_dy;
//     if (map[pos[0]*cols+pos[1]] == -1 && collides(new_obj_x,new_obj_y,block_x,player.X,player.Y,player.W)){
//       collision = true;
//     }
   
//  }
//  return collision;
 
//}

//int[][] adjacentPositions(int r, int c){
//  int[][] adjacent =  {
//    {r-1,c-1},{r-1,c},{r-1,c+1},
//    {r,c-1},{r,c+1},
//    {r+1,c-1},{r+1,c},{r+1,c+1}
//  };
//  return adjacent;
//}

//boolean collides(int blockX, int blockY, int blockW, int playerX, int playerY,int playerW){
//  int min_dx = playerW+blockW;
//  int min_dy = playerW+blockW;
//  return (blockX-playerX <= min_dx) && (blockY-playerY <= min_dy);
//}
}
  

 
