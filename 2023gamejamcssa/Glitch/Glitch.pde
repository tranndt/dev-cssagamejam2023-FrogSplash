int mapW = 1000;
int mapH = 1000;
boolean mapTurn = true;

int mapX = 250;
int mapY = 250;
void setup()
{
  /*
  If either of these variables are changed, the
  respective number above used to center the player
  upon startup should adddlso be changed.
  */
  size(500, 500);

}

void draw()
{
  background(0,0,0);

  move_map(-mapX,-mapY);
  
  /*
  This creates semi-transparent lines. To ensure that
  the lines are evenly spaced and that none are 
  missing, width divided by lineFrequency should
  equal 0, and the same for height. If those
  conditions are not met, then the final lines may
  not appear, and if they do, then the lines will
  not be evenly spaced. The opacity of the lines is
  controlled by the final variable of stroke,
  minimum 0 and maximum 255.
  */
  //stroke(0, 0, 0, 120);
  //int lineFrequency = 100;
  //for(int i = 1; i < height/lineFrequency;  i ++)
  //{
  //  line(i*lineFrequency, 0, i*lineFrequency, height);
  //  line(0, i*lineFrequency, width, i*lineFrequency);
  //}
  //stroke(0, 0, 0, 255);//reset stroke to normal
  
  /*
  kd[] is a boolean array defined below in void(k).
  The exact key for each value of kd[] is simply the
  same value of the ks[] array. These are both found
  above the definition of void k(). Values 0 through 3
  are a, s, d, w respectively, so if those keys are
  being pressed, I simply update the players position
  in the relative direction with +/- playerSpeed.
  */
  if (mapTurn){
    if(kd[0]) mapX -= playerSpeed;
    if(kd[1]) mapY += playerSpeed;
    if(kd[2]) mapX += playerSpeed;
    if(kd[3]) mapY -= playerSpeed;
  }
  //If you add more keys to ks[] and kd[], then add the
  //key's function here under the next number for if(kd[x])
  if (mapX > mapW - width/2 - playerW/2){
    mapX = mapW - width/2 - playerW/2;
  }
  if (mapX < -width/2 + playerW/2){
    mapX = -width/2 + playerW/2;
  }
  if (mapY > mapH - height/2 - playerH/2){
    mapY = mapH - height/2 - playerH/2;
  }
  if (mapY < -height/2 + playerH/2){
    mapY = -height/2 + playerH/2;
  }

  /*
  The 4 lines below lock the player on the screen. If you
  want this function removed, simply comment them out.
  */
  
  fill(30,150,10);
  rect(playerX, playerY, playerW, playerH);
}

/*
This default processing fuction is called for the first
time every time a new key is pressed down, and it will
continue being called until every single key is let go.
*/
void keyPressed()
{
  k(true);
}

/*
This default processing function is called once every
time a key is let go of, wether it was tapped or held
and then released.
*/
void keyReleased()
{
  k(false);
}

/*
Although only being simple arrays, these two arrays
communicate with each other and are to an extent the
same things. kd[] is what can be used in void draw()
in order to do whatever you want when a certain key
is pressed. ks[] is used in void k() to very quickly
and efficiently know which exact key was pressed down
or released. To track more keys, simply add it to ks[]
using the same syntax and don't forget to add another
false to kd[]. For special keys like ENTER, UP, TAB, etc.,
do not use '' but instead simply type it in all caps. FYI,
the SPACE key is just ' '.
*/
int[] ks = {'a', 's', 'd', 'w'};
boolean[] kd = {false, false, false, false};

/*
If a new key is pressed down, ks[] checks which key it
was which lets kd[] know which value to change to true.
If a key is released, ks[] checks which key it was and
lets kd[] know which value to reset to false. By using
this system instead of just if() statements in void 
keyPressed(), it allows multiple keys to be held down at
the same time with no problems.
*/
void k(boolean b)
{
  for(int i = 0; i < ks.length; i ++)
  {
    if(ks[i] == key || ks[i] == keyCode) kd[i] = b;
  }
}

void move_map(int mapX, int mapY){
  
  pushMatrix();
  translate(mapX,mapY);
  
  fill(150, 80, 10);
  rect(0,0,mapW,mapH);
  
  stroke(0, 0, 0, 120);
  int lineFrequency = 100;
  for(int i = 1; i < mapW/lineFrequency;  i ++)
  {
    line(i*lineFrequency, 0, i*lineFrequency, mapW);
    line(0, i*lineFrequency, mapH, i*lineFrequency);
  }
  stroke(0, 0, 0, 255);//reset stroke to normal
  
  popMatrix();
}
