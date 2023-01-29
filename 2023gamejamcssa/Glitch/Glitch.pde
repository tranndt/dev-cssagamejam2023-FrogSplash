Player player = new Player();
Map map = new Map(player);
int offsetX=map.startX-player.X;
int offsetY=map.startY-player.Y;
void setup()
{
  size(500, 500);
}

void draw()
{
  background(0,0,0);   
  map.move_map(-offsetX,-offsetY);
  int[] offsetXY = updateoffsetXY(offsetX,offsetY);
  offsetX = offsetXY[0];
  offsetY = offsetXY[1];  
  fill(30,150,10);
  rect(player.X, player.Y, player.W, player.H);
}

int[] updateoffsetXY(int offsetX, int offsetY){
  if(kd[0]) offsetX -= player.Speed;
  if(kd[1]) offsetY += player.Speed;
  if(kd[2]) offsetX += player.Speed;
  if(kd[3]) offsetY -= player.Speed;
  if (offsetX > map.mapW - width/2 - player.W/2){
    offsetX = map.mapW - width/2 - player.W/2;
  }
  if (offsetX < -width/2 + player.W/2){
    offsetX = -width/2 + player.W/2;
  }
  if (offsetY > map.mapH - height/2 - player.H/2){
    offsetY = map.mapH - height/2 - player.H/2;
  }
  if (offsetY < -height/2 + player.H/2){
    offsetY = -height/2 + player.H/2;
  }
  return new int[] {offsetX,offsetY};

}


void keyPressed()
{
  k(true);
}


void keyReleased()
{
  k(false);
}

int[] ks = {'a', 's', 'd', 'w'};
boolean[] kd = {false, false, false, false};

void k(boolean b)
{
  for(int i = 0; i < ks.length; i ++)
  {
    if(ks[i] == key || ks[i] == keyCode) kd[i] = b;
  }
}
