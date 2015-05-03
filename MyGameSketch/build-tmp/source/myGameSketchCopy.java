import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class myGameSketchCopy extends PApplet {

public void generatechests(int amount){
  AnimatedObject[] tempcheststore = new AnimatedObject[square];
  for(int i=0; i<amount; i++){
     int thisrandomhere = chestspace(PApplet.parseInt(random(widtha,square-widtha)), 0);
     if(thisrandomhere >=0){
       
       tempcheststore[thisrandomhere] = new AnimatedObject("./environments/"+environmentnumber+"/c.",14,true);
     }     
  }
  
  for(int j=0; j<square; j++){
     animated[j] = tempcheststore[j];
     if(animated[j] != null){
       animated[j].index = j;
     }
  }
}



public int chestspace(int myrandom, int count){
   if(count >=10){
    
     return iteratetonext(myrandom,0);
     
   }else{
   if(thisarray[myrandom] == objectlists[1]){
    return myrandom;
   }else{
    return enemyspace(PApplet.parseInt(random(widtha,square-widtha)), count+1);
   } 
   }

}


class AnimatedObject {
  PImage[] images;
  int imageCount;
  int frame;
  int lengtha = 255;
  int index = 0;
  boolean animateoninteract;
  boolean drawme = false;
  
AnimatedObject(String imagePrefix, int count, boolean interact) {
    imageCount = count;
    images = new PImage[imageCount];
    animateoninteract = interact;

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
   }
}

  public void display(float xpos, float ypos) {
    
    if(animateoninteract){
      if(drawme){
        if(frameCount%3 == 0){
          
          if(frame >4){
           lengtha -=30; 
          }
        
        frame = (frame+1) % imageCount;
         
        }
        if(lengtha <= 0){
          currentGems = currentGems+=random(10,25);
          //bx+x5*widt,by+y5*heigh
          animated[index] = null;
          drawme = !drawme;
         //kills itself
        }
        tint(255,255,255,lengtha);
    image(images[frame], xpos, ypos,50,50);
    
    
    }else{
     image(images[0],xpos,ypos,50,50); 
    }
   }else{
     if(frameCount%5 == 0){
       frame = (frame+1) % imageCount;
     }
       image(images[frame], xpos, ypos,50,50);
     }
       tint(255,255,255,255);
   }

  }

//youre on the right document
//Board width, Board Height.
int widtha = PApplet.parseInt(random(19,30));
int heighta = PApplet.parseInt(random(19,30));
int square = widtha*heighta;
int frameNum = 0;
int currentGems = 0;
int nextinventory = 0;

//weather
int weather = PApplet.parseInt(random(0,1));

//these arrays make up the board
Object[] thisarray = new Object[square];
Object[] toparray = new Object[square];
Object[] abovearray = new Object[square];
AnimatedObject[] animated = new AnimatedObject[square];

//this array contains the objects themselves
Object[] objectlists = new Object[21];

//this array holds items in player's inventory.
Object[] inventory = new Object[10];

//this array contains positions.
int[] positions = new int[9];

//this array contains the walls i need to go to next
ArrayList<Integer> myList = new ArrayList<Integer>();

//which environment
int environmentnumber = 1;

int fadeDirection = 1;


NPC enemy1 = new NPC(PApplet.parseInt(random(2,heighta-1)*widtha+random(2, widtha-1)), 20, 20, 20);
NPC[] enemies = new NPC[square];


//Player variables
  PFont font;
  PImage currentimage;
  PImage[] fox = new PImage[14];
  PImage[] foxtail = new PImage[4];
  PImage[] weathers = new PImage[100];
  PImage overlay;
  PImage gem;
  int bx = 0;
  int by = 0;
  int cell = widtha*6+9;
  boolean moving = false;
  boolean movingup = false;
  boolean movingdown = false;
  boolean movingleft = false;
  boolean movingright = false;
  boolean isup;
  boolean isdown;
  boolean isright;
  boolean isleft;
  int moved;
  int px = 50*9;
  //int px = 50*5;
  int py = 50*6;
  //int py = 50*4;
  int fullhealth = 12;
  int healthpoints = 12;
  int pspeed = 6;
  int pattack =1;
  boolean currentlyRendering = true;
  boolean startFader = false;
  float incrementor=0;

PImage poof; 
int[] randoms;
int[] xrandoms;
int[] yrandoms;
int[] sizerandoms;
int thisint = 0;




public void setup() {
  objectlists[0] = new Object(true, 0);
  objectlists[1] = new Object(true, 0);
  objectlists[2] = new Object(false, 0);
  objectlists[3] = new Object(false, 0);
  objectlists[4] = new Object(false, 1);
  objectlists[5] = new Object(false, 15);
  objectlists[6] = new Object(false, 21);
  objectlists[7] = new Object(false, 3);
  objectlists[8] = new Object(false, 201);
  objectlists[9] = new Object(false, 202);
  objectlists[10] = new Object(false, 2);
  objectlists[11] = new Object(false, 17);
  objectlists[12] = new Object(false, 4);
  objectlists[13] = new Object(false, 100);
  objectlists[14] = new Object(false, 9);
  objectlists[15] = new Object(false, 10);
  objectlists[16] = new Object(false, 251);
  objectlists[17] = new Object(false, 252);
  objectlists[18] = new Object(false, 18);
  objectlists[19] = new Object(false, 22);
  objectlists[20] = new Object(false, 300);

  
  poof = loadImage("poof.png");
  loadpimages(fox, "fox");
  loadpimages(foxtail,"tail");
  overlay = loadImage("./environments/1/overlay.png");
  gem = loadImage("./environments/1/gem.png");
  font = loadFont("PWDolphins-18.vlw");

  currentimage = fox[0];
  randoms = randomarray(10, 360);
  xrandoms = randomarray(10, 100);
  yrandoms = randomarray(10, 100);
  sizerandoms = randomarray(10, 30);
  //size(550, 550);
  size(950, 650);

for(int i=0; i<16; i++){
  weathers[i]= loadImage("./rain/Comp 1_"+(100000+i+1)+".png");
}

for(int u=0; u<objectlists.length; u++){
  if(objectlists[u] != null){
     objectlists[u].img(); 
  }
}
  
  //this creates the borders
for (int j=0; j<square; j++) {
  if ( j%widtha==0 || j%widtha==widtha-1|| j>square-widtha) {
    thisarray[j] = objectlists[4];
  }
  else if (j<widtha && j!=0 && j!=widtha-1) {
    thisarray[j] = objectlists[7];
  }
  else {
    thisarray[j] =  objectlists[0];
  }
}
  
  //this is where we generate the objects
  
  //lets comb it a first time setting up the dots that is grasspath
  
  for(int m=0; m<square; m++){
    if(m%2==0 && (m/widtha)%2==0){
      if(thisarray[m].type <1){
        thisarray[m] = objectlists[1];
        myList.add(m);
      }
    }
  }
  
  //go through again to break down walls
  for(int o = 0; o<myList.size(); o++){
  int currentpos = myList.get(o);
  int random1= PApplet.parseInt(random(5));
  int random2=PApplet.parseInt(random(5));
  if(random1 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
        thisarray[currentpos+1] = objectlists[1];
      }
    }
  }
  if(random1 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
        thisarray[currentpos-1] = objectlists[1];
      }
    }
  }
  if(random1 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
        thisarray[currentpos+widtha] = objectlists[1];
      }
    }
  }
  if(random1 == 3){
    if(currentpos-widtha > 0){
      if(thisarray[currentpos-widtha].type <1){
          thisarray[currentpos-widtha] = objectlists[1];
      }
    }
    
  }
  if(random1 == 4){
    if(thisarray[currentpos].type <1){
   thisarray[currentpos] = objectlists[0]; 
    }
  }
  if(random2 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
         thisarray[currentpos+1] = objectlists[1];
      }
    }
  }
  if(random2 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
    thisarray[currentpos-1] = objectlists[1];
      }
    }
  }
  if(random2 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
    thisarray[currentpos+widtha] = objectlists[1];
      }
    }
  }
  if(random2 == 3){
        if(currentpos-widtha > 0){
          if(thisarray[currentpos-widtha].type <1){
    thisarray[currentpos-widtha] = objectlists[0];
          }
    }
  }
  
    if(random2 == 4){
        if(currentpos > 0){
          if(thisarray[currentpos].type <1){
    thisarray[currentpos] = objectlists[0];
          }
    }
  }
  
}

  
  
  
  
  
  
  
  
  
  
  
  
  //This creates the path
  int point1 = widtha*(py/50) + (px/50);
  //int point1 = widtha*4+5;
  thisarray[point1] = objectlists[1];
  int numberoftimes = PApplet.parseInt(random(3, 20));
  int thecake = point1;
  for (int k=0; k<= numberoftimes; k++) { 
    if (k%2 ==0) {
      thecake = updownpoint(thecake);
    }
    else {
      thecake = leftrightpoint(thecake);
    }
  }
  
  thisarray[thecake] = objectlists[13];
  
  //stamp3x3(int(random(square)), bigg);
  //stamp2x2(int(random(square)), big);
  //stamp1x1(int(random(square)), mushroom);
  generateparts(0,0,0);
  generatenpcs(enemies, 1, square/40, 2);
  generatechests(3);
}


public void clearArrays(){
  //first we clear the nessesary arrays.
  for (int j=0; j<square; j++) {
    if ( j%widtha==0 || j%widtha==widtha-1|| j>square-widtha) {
      thisarray[j] = objectlists[4];
    }
    else if (j<widtha && j!=0 && j!=widtha-1) {
      thisarray[j] = objectlists[7];
    }
    else {
      thisarray[j] =  objectlists[0];
    }

    //clear the others
    toparray[j] = null;
    abovearray[j] = null;
    animated[j] = null;

  }
}

public void printboard(){
  println("Generating Board Map... :");
  String concatter = "";
    for(int h=0; h<heighta; h++){
      for(int u=0; u<widtha; u++){
        //concatte += "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890-1234567890ASDFGHJKLQWERTYUIOPZXCVBNMQWERTYUIOPLKJHGFDSAMNBVCXZPOIUYTREWQ12345678900987654321".substring(thisarray[h*widtha+u].type, thisarray[h*widtha+u].type+1);
        int num = thisarray[h*widtha+u].type;
        if(num <10){
          concatter += "00" + String.valueOf(num) + ",";
        }else if(num < 100){
          concatter += "0" + String.valueOf(num) + ",";
        }else{
        concatter += String.valueOf(num)+ ",";
        }
        }
        println(concatter);
        concatter = "";
    }

  println("##################Board Print Complete#################");

  }

public void regenerateboard(){
  System.gc();
  weather = PApplet.parseInt(random(0,1));
  clearArrays();  
  //lets comb it a first time setting up the dots that are the grasspath
  for(int m=0; m<square; m++){
    if(m%2==0 && (m/widtha)%2==0){
      if(thisarray[m].type <1){
        thisarray[m] = objectlists[1];
        myList.add(m);
      }
    }
  }
  
  //go through again to break down walls
  for(int o = 0; o<myList.size(); o++){
  int currentpos = myList.get(o);
  int random1= PApplet.parseInt(random(5));
  int random2=PApplet.parseInt(random(5));
  if(random1 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
        thisarray[currentpos+1] = objectlists[1];
      }
    }
  }
  if(random1 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
        thisarray[currentpos-1] = objectlists[1];
      }
    }
  }
  if(random1 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
        thisarray[currentpos+widtha] = objectlists[1];
      }
    }
  }
  if(random1 == 3){
    if(currentpos-widtha > 0){
      if(thisarray[currentpos-widtha].type <1){
          thisarray[currentpos-widtha] = objectlists[1];
      }
    }
    
  }
  if(random1 == 4){
    if(thisarray[currentpos].type <1){
   thisarray[currentpos] = objectlists[0]; 
    }
  }
  if(random2 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
         thisarray[currentpos+1] = objectlists[1];
      }
    }
  }
  if(random2 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
    thisarray[currentpos-1] = objectlists[1];
      }
    }
  }
  if(random2 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
    thisarray[currentpos+widtha] = objectlists[1];
      }
    }
  }
  if(random2 == 3){
        if(currentpos-widtha > 0){
          if(thisarray[currentpos-widtha].type <1){
    thisarray[currentpos-widtha] = objectlists[0];
          }
    }
  }
  
    if(random2 == 4){
        if(currentpos > 0){
          if(thisarray[currentpos].type <1){
    thisarray[currentpos] = objectlists[0];
          }
    }
  }
}
  

  //This creates the path
  //int point1 = (widtha*(py/50)) + (px/50);
  int point1 = cell;
  println(point1 + "is point one");
  
  thisarray[point1] = objectlists[1];
  int numberoftimes = PApplet.parseInt(random(3, 20));
  int thecake = point1;
  for (int k=0; k<= numberoftimes; k++) { 
    if (k%2 ==0) {
      thecake = updownpoint(thecake);
    }
    else {
      thecake = leftrightpoint(thecake);
    }
  }
  

  thisarray[thecake] = objectlists[13];
  

  generateparts(0,0,0);
  
  generatechests(3);
  printboard();
}



public void draw() {
  //int widt = width/11;
  int widt = width/19;
  int heigh = widt;
  int x1 = 0;
  int y1 = 0;
  int x2 = 0;
  int y2 = 0;
  int x3 = 0;
  int y3 = 0;
  int x4 = 0;
  int y4 = 0;
  int x5 = 0;
  int y5 = 0;
  
  int speed = widt/20;
  int discalc = 0;
  int disycalc = 0;
  //int speed = 50;
  int ex = 0;
  int ey = 0;
  int pposition = cell;
  //int lowerbound = 2;
  int lowerbound = 0;
    //println("modulo: "+ cell %widtha);
  int upperbound = pposition+(widtha*11);
  if(upperbound > square){
    upperbound = square;
  }

  for(int i=lowerbound; i<upperbound; i++){
    pposition = cell;
    if(pposition+(widtha*11) > square){
      upperbound = square;
    }else{
      upperbound=pposition+(widtha*12);
   }
   //y1 = i%widtha;
    if ((i+0)%widtha == 0 && (i+0)!=0) {
      x1 = 0;
      y1++;
    }
    if(thisarray[i].type <15){
      //image(objectlists[0].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    }
    else if(thisarray[i].type >= 15 && thisarray[i].type <= 19){
      image(objectlists[2].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, (bx+x1*widt)-widt, (by+y1*heigh)-heigh, widt*2, heigh*2);
    }else if(thisarray[i].type >= 20 && thisarray[i].type <= 200){
      image(objectlists[2].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, (bx+x1*widt)-(widt*2), (by+y1*heigh)-(heigh*2), widt*3, heigh*3);
    }
    else if(thisarray[i].type >200 && thisarray[i].type <300){
      image(objectlists[2].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      
    }else if(thisarray[i].type >=300){
      image(objectlists[2].thisobjectsimage, bx+x1*widt, by+y1*heigh,widt,heigh);
      image(thisarray[i].thisobjectsimage, bx+x1*widt, (by+y1*heigh)-heigh,widt,heigh*2);
    
    }else {
      image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    }
    x1++;
}
  
//animated objects
  for (int q=0; q<square; q++) {
    if (q%widtha == 0 && q!=0) {
      x5 = 0;
      y5++;
    }
    if(animated[q] != null){
      //println("reached!");
      animated[q].display(bx+x5*widt,by+y5*heigh);
       
    }
    x5++;
  }
  
  
//creates the enemies
  for (int j=0; j<square; j++) {
    if (j%widtha == 0 && j!=0) {
      x2 = 0;
      y2++;
    }
    if (enemies[j] != null) {
      image(enemies[j].thisenemiesimage, bx+x2*widt+enemies[j].ex, by+y2*heigh+enemies[j].ey, widt, heigh);
    }
    x2++;
  }

  image(currentimage , px, py, widt, heigh);
  
  for (int k=0; k<square; k++) {
    int tester = cell%widtha;
    int htester = cell/widtha;
    if (k%widtha == 0 && k!=0) {
      x3 = 0;
      y3++;
    }
    if (toparray[k] != null) {
      
      if(tester == x3){
       discalc = 0; 
      }
      else if(tester > x3){
        if(tester-x3 <=5){
        discalc=(-tester+x3);
        }
        else{
         discalc=-8; 
        }
       //discalc = -3;
      } else{
        discalc=(x3-tester);
      }
      
      if(htester == y3){
       disycalc = 0; 
      }else if(htester > y3){
       disycalc = (-htester+y3); 
      }else{
       disycalc = (y3-htester); 
      }
      image(toparray[k].thisobjectsimage, bx+x3*widt+discalc, by+y3*heigh+disycalc, widt, heigh);
      
    }
    x3++;
  }
  
 
  
  for (int h=0; h<square; h++) {
    if (h%widtha == 0 && h!=0) {
      x4 = 0;
      y4++;
    }
    if (abovearray[h] != null) {
     image(abovearray[h].thisobjectsimage, bx+x4*widt, by+y4*heigh, widt, heigh);
    }
    x4++;
  }

  movements(speed, widt, heigh);
  NPCMovements(speed, 50);
  drawOverlay();
  drawWeather();
  drawMap();
  fader();

  drawGems(currentGems);
  drawInventory();
  drawhearts(healthpoints);
}

public void generatenpcs(NPC[] npcs, int level, int amount, int types){
  NPC[] tempenemystore = new NPC[amount];
  for(int i=0; i<amount; i++){
     int thisrandomhere = enemyspace(PApplet.parseInt(random(widtha,square-widtha)), 0);
     //int thisrandomhere = int(random(widtha,square-widtha));
     
     if(thisrandomhere >=0){
     tempenemystore[i] = new NPC(thisrandomhere,level,PApplet.parseInt(random(types)),level*2);
     }     
  }
  
  for(int j=0; j<amount; j++){
     npcs[tempenemystore[j].cp] = tempenemystore[j];
     npcs[tempenemystore[j].cp].img();
  }
}


public int enemyspace(int myrandom, int count){
   if(count >=10){
    
     return iteratetonext(myrandom,0);
     
   }else{
   if(thisarray[myrandom] == objectlists[0] || thisarray[myrandom] == objectlists[1]){
    return myrandom;
   }else{
    return enemyspace(PApplet.parseInt(random(widtha,square-widtha)), count+1);
   } 
   }

}


public int iteratetonext(int myrandom, int count){
  println("reached");
  while(count != square-1){
     if(thisarray[(myrandom+count)%square] == objectlists[0] || thisarray[(myrandom+count)%square] == objectlists[1]){
             println(myrandom+count);
       return myrandom+count;

     }else{
      count++; 
     }
  }
 return 45; 
}


class NPC {
  int cp;
  int attack;
  int hp;
  int type;
  int speed;
  boolean canmove = true;
  boolean living = true;
  PImage thisenemiesimage;
  boolean movingright = false;
    boolean movingleft = false;
      boolean movingup = false;
        boolean movingdown = false;
  int ex=0;
  int ey=0;

  NPC(int startingpoint, int attackpower, int thistype, int health) {  
    cp = startingpoint;
    attack = attackpower;
    type = thistype;
    hp = health;
  }

  public void attack() {
    if (cp-1 == cell || cp+1 == cell || cp+widtha == cell || cp-widtha == cell) {
      healthpoints -=attack;
      println("attacked!");
    }
  }

  public PImage img() {
    if (this.type == 0) {
      thisenemiesimage = loadImage("betch.png");
      return thisenemiesimage;
    }
    else {
      thisenemiesimage = loadImage("monster1.png");
      return thisenemiesimage;
    }
  }


  public void attackme(int strength) {
    hp -= strength;
    if (hp <= 0) {
      println("you did it");
      living = false;
    }
  }
}

public void NPCMove(NPC[] theseenemies) {
  for (int y=0; y<theseenemies.length; y++) {
    if (theseenemies[y] != null) {//for each enemy on the board]
      if (y+1 == cell || y-1==cell || y-widtha == cell || y+widtha == cell || y+widtha+1 == cell || y+widtha-1 == cell || y-widtha+1 == cell || y-widtha-1==cell) {
      }
      else {
        if (theseenemies[y].canmove == true) {
          int thisrandom = PApplet.parseInt(random(1, 5)); //choose random number
          if (thisrandom == 1) {
            if (thisarray[y+1].passable() && y+1!=cell && enemies[y+1] == null && animated[y+1] == null) {
                    theseenemies[y].movingright = true;
            }
          }
          else if (thisrandom ==2) {
            if (thisarray[y-1].passable() && y-1!=cell  && enemies[y-1] == null && animated[y-1] == null) {
              theseenemies[y].movingleft = true;
              
              //theseenemies[y-1] = theseenemies[y];
              //theseenemies[y-1].canmove = false;
              //theseenemies[y] = null;
            }
          }
          else if (thisrandom ==3) {
            if (thisarray[y+widtha].passable() && y+widtha!=cell  && enemies[y+widtha] == null && animated[y+widtha] == null) {
              theseenemies[y].movingdown = true;
              //theseenemies[y+widtha] = theseenemies[y];
              //theseenemies[y+widtha].canmove = false;
              //theseenemies[y] = null;
            }
          }
          else {
            if (thisarray[y-widtha].passable() && y-widtha!=cell  && enemies[y-widtha] == null && animated[y-widtha] == null) {
              theseenemies[y].movingup = true;
              //theseenemies[y-widtha] = theseenemies[y];
              //theseenemies[y-widtha].canmove = false;
              //theseenemies[y] = null;
            }
          }
        }
      }
    }
  }
}


public void refreshmoves(NPC[] theseenemies) {
  for (NPC thisnpc : theseenemies) {
    if (thisnpc !=null) {
      thisnpc.canmove = true;
    }
  }
}

public void NPCMovements(int espeed, int cellsize) {
  for (int y=0; y<enemies.length; y++) {
    if (enemies[y] != null) {
      if (enemies[y].movingright) {
        enemies[y].ex += espeed;

        if (enemies[y].ex >= cellsize) {
          enemies[y].ex = 0;
          enemies[y].movingright = false; 
          enemies[y+1] = enemies[y];
          enemies[y+1].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingleft) {
        enemies[y].ex -= espeed;

        if (enemies[y].ex <= -cellsize) {
          enemies[y].ex = 0;
          enemies[y].movingleft = false; 
          enemies[y-1] = enemies[y];
          enemies[y-1].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingdown) {
        enemies[y].ey += espeed;

        if (enemies[y].ey >= cellsize) {
          enemies[y].ey = 0;
          enemies[y].movingdown = false; 
          enemies[y+widtha] = enemies[y];
          enemies[y+widtha].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingup) {
        enemies[y].ey -=espeed;

        if (enemies[y].ey <= -cellsize) {
          enemies[y].ey = 0;
          enemies[y].movingup = false;
          enemies[y-widtha] = enemies[y];
          enemies[y-widtha].canmove = false;
          enemies[y] = null;
        }
      }
    }
  }
}

public void generateparts(int amount1, int amount2, int amount3){
 // stamp3x3(int(random(square)), objectlist[int(random(20,21))]);
 // stamp2x2(int(random(square)), objectlist[int(random(10,19))]);
 // stamp1x1(int(random(square)), objectlist[int(random(21,30))]);
 for(int j=0; j<square; j++){
   int quickrandom = PApplet.parseInt(random(12));
   if(quickrandom <5){
      stamp3x3(j, objectlists[19]);
   }else{
      stamp3x3(j, objectlists[6]);
   }
  
 }
 for(int k=0; k<square; k++){
    int quickrandom2 = PApplet.parseInt(random(100));
   if(quickrandom2 <30){
     stamp2x2(k, objectlists[11]);
   }
   else if(quickrandom2 >29 && quickrandom2 < 60){
    stamp2x2(k,objectlists[18]); 
   }else{
    stamp2x2(k, objectlists[5]);
   } 
 }
 for(int l=0; l<square; l++){
   int quickrandom = PApplet.parseInt(random(7));
   if(quickrandom ==0){
   stamp1x1(l,objectlists[12], null);
   }
   if(quickrandom ==2){
    stamp1x1(l,objectlists[8],objectlists[9]); 
   }
   if(quickrandom == 3){
    stamp1x1(l,objectlists[15],null); 
   }
   if(quickrandom ==4){
     stamp1x1(l,objectlists[14],null); 
   }
   if(quickrandom ==6){
    stamp1x1(l,objectlists[16],objectlists[17]); 
   }
   else{
    stamp1x1(l,objectlists[10], null);
   } 
 }
}


public void stamp3x3(int pointx, Object Randomobject) {
  if (thisarray[pointx] == objectlists[0] && pointx+(widtha*2)+1< thisarray.length) {
    if (thisarray[pointx+1] == objectlists[0] && thisarray[pointx+2] == objectlists[0] && thisarray[pointx+widtha]==objectlists[0] && thisarray[pointx+widtha+1] == objectlists[0] && thisarray[pointx+widtha+2] ==objectlists[0] && thisarray[pointx+(widtha*2)]==objectlists[0] && thisarray[pointx+(widtha*2)+1] == objectlists[0] && thisarray[pointx+(widtha*2)+2] ==objectlists[0]) {
      thisarray[pointx] = objectlists[3];
      thisarray[pointx+1] = objectlists[3];
      thisarray[pointx+2] = objectlists[3];
      thisarray[pointx+widtha] = objectlists[3];
      thisarray[pointx+widtha+1] = objectlists[3];  
      thisarray[pointx+widtha+2] = objectlists[3]; 
      thisarray[pointx+(widtha*2)] = objectlists[3];
      thisarray[pointx+(widtha*2)+1] = objectlists[3];
      thisarray[pointx+(widtha*2)+2] = Randomobject;
    }
  }
}




public void stamp2x2(int pointx, Object Randomobject) {
  if (thisarray[pointx] == objectlists[0] && pointx+widtha+1< thisarray.length) {
    if (thisarray[pointx+1] == objectlists[0] && thisarray[pointx+widtha]==objectlists[0] && thisarray[pointx+widtha+1] == objectlists[0]) {
      thisarray[pointx] = objectlists[2];
      thisarray[pointx+1] = objectlists[2];
      thisarray[pointx+widtha] = objectlists[2];
      thisarray[pointx+widtha+1] = Randomobject;
    }
  }
}

public void stamp1x1(int pointx, Object Randomobject, Object Randomobject2){
   if (thisarray[pointx] == objectlists[0]) {
     if(Randomobject.type > 250){
      thisarray[pointx] = Randomobject;
      abovearray[pointx-widtha] = Randomobject2; 
     }
     else if(Randomobject.type >200 && Randomobject.type <=250){
       thisarray[pointx] = Randomobject;
       toparray[pointx] = Randomobject2;
     }else{
       thisarray[pointx] = Randomobject;
     }
  }
}

public void stamp1x2(int pointx, Object Randomobject){
   if (thisarray[pointx] == objectlists[0] && thisarray[pointx+widtha] == objectlists[0]) {
     if(Randomobject.type >250 && Randomobject.type <300){
       thisarray[pointx] = Randomobject;
       thisarray[pointx+widtha] = objectlists[2];
       thisarray[pointx] = Randomobject;
       thisarray[pointx+widtha] = objectlists[2];
     }else{
      thisarray[pointx] = objectlists[2];
      thisarray[pointx+widtha] = Randomobject;
     }
    }
  }

public void drawWeather(){
	if(weather >= 1){
    frameNum++;
	image(weathers[frameNum],0,0,width,height); 
	if(frameNum == 15){
		frameNum = 0;
	}
	}
}

public void drawhearts(int phealth){
int fullhearts = phealth/4;
  if(fullhearts > 0){
    for(int g=0; g<=fullhearts; g++){
       image(foxtail[0],g*40+5,5,40,40); 
    }
  }
  int leftover = phealth%4;
  if(leftover>0){
   image(foxtail[4-leftover],(fullhearts*40)+45,5,40,40); 
  }
}

public void drawGems(int gemamount){
	fill(255,255,255);
	image(gem, 10, height-40, 35,35);
	text(""+gemamount, 10, height-20);
}
public void keyPressed() {
//thisarray[cell-widtha].type == 100 || thisarray[cell-1].type == 100 || thisarray[cell+1].type == 100 || thisarray[cell+widtha].type == 100
  if (keyCode == UP && moving==false) {
    if (thisarray[cell-widtha].type == 100){
       //println("help me"); 
       startFader = true;
       //regenerateboard();
    }
    if (thisarray[cell-widtha].passable() && enemies[cell-widtha] == null && animated[cell-widtha] == null) {
      cell = cell-widtha;
      movingup = true;
      moving = true;
      NPCMove(enemies);
      refreshmoves(enemies);
    }
    isup = true;
    isleft = false;
    isright = false;
    isdown = false;
    currentimage=fox[11];
  }
  if (keyCode == DOWN && moving==false) {
    if (thisarray[cell+widtha].type == 100){
       //println("help me"); 
       startFader = true;
    }
    if (thisarray[cell+widtha].passable() && enemies[cell+widtha] == null && animated[cell+widtha] == null) {
      movingdown = true;
      moving = true;
      cell = cell+widtha;
      NPCMove(enemies);
      refreshmoves(enemies);
    }
    isup = false;
    isleft = false;
    isright = false;
    isdown = true;
    currentimage=fox[1];
  } 
  if (keyCode == LEFT && moving==false) {
    if (thisarray[cell-1].type == 100){
       //println("help me"); 
       startFader = true;
    }
    if (thisarray[cell-1].passable() && enemies[cell-1] == null && animated[cell-1] == null) {
      movingleft = true;
      moving = true;
      cell = cell-1;
      NPCMove(enemies);
      refreshmoves(enemies);
    }
    isup = false;
    isleft = true;
    isright = false;
    isdown = false;
    currentimage=fox[7];
  } 
  if (keyCode == RIGHT && moving==false) {
    if (thisarray[cell+1].type == 100){
       //println("help me"); 
       startFader = true;
    }
    if (thisarray[cell+1].passable() && enemies[cell+1] == null && animated[cell+1] == null) {
      moving = true;
      movingright = true;
      cell = cell+1;
      NPCMove(enemies);
      refreshmoves(enemies);
    }
    isup = false;
    isleft = false;
    isright = true;
    isdown = false;
     currentimage=fox[3];
  }
  if (key == ' ' && moving==false) {
    if (isup) {
      if (enemies[cell-widtha] != null) {
        speedcheck(-widtha);
      }
      if(animated[cell-widtha] != null){
        animated[cell-widtha].drawme = true; 
      }
      if(thisarray[cell-widtha] != null){
        addToInventory(thisarray[cell-widtha]);
      }
    }
    else if (isdown) {
      if (enemies[cell+widtha] != null) {
        speedcheck(widtha);
      }
      if(animated[cell+widtha] != null){
       animated[cell+widtha].drawme = true; 
      }
    }
    else if (isleft) {
      if (enemies[cell-1] != null) {
        speedcheck(-1);
      }
      if(animated[cell-1] != null){
       animated[cell-1].drawme = true; 
      }
    }
    else {
      if (enemies[cell+1] != null) {
        speedcheck(1);
      }
      if(animated[cell+1] != null){
       animated[cell+1].drawme = true; 
      }
    }
  }
}

public void speedcheck(int number) {
  if (enemies[cell+number].speed > pspeed) {
    enemies[cell+number].attack();
    if (enemies[cell+number].living == false) {
      enemies[cell+number] =  null;
    }
    else {
      enemies[cell+number].attackme(pattack);
    }
  }
  else {
    enemies[cell+number].attackme(pattack);
    enemies[cell+number].attack();
    if (enemies[cell+number].living == false) {
      enemies[cell+number] = null;
    }
  }
}

public void addToInventory(Object thisobject){
  println("added " + thisobject.type);
  if(thisobject.type!=3 && thisobject.type >= 2 ){
  inventory[nextinventory] = thisobject;
  nextinventory++;
  }
}

public void loadpimages(PImage[] setme, String prefix){
 for(int inc = 0; inc <setme.length; inc++){
    setme[inc] = loadImage(""+prefix+inc+".png");
 }
}


public void drawMap(){
	int mapSize = 7;
	colorMode(HSB,360,100,100,100);
	noStroke();
    for(int h=0; h<heighta; h++){
      for(int u=0; u<widtha; u++){
        int num = thisarray[h*widtha+u].type;
        if(num <1){
        	fill(100, 100, 50, 100);
        }else if((num >= 1 && num <= 4) || num == 9 || num == 10 || num ==18 || num ==22 || num ==202){
        	fill(100, 100, 25, 100);
        }
        else if(num == 100){
        	fill(270,100,100);
        }
        else{
        	fill(num,100,100,100);
        }
        if(h*widtha+u == cell){
        	fill(35,100,100,100);
        }
        rect(width-widtha*mapSize+u*mapSize,height-heighta*mapSize+h*mapSize,mapSize,mapSize);
      }
    }
    colorMode(RGB,255,255,255);
  }

  //fill(100, 100, 50, 100);grass
  //fill(100, 100, 25, 100);trees
public void movements(int speed, int heigh, int widt) {
  if (moving == true) {
    if (movingup) {
      if (cell < widtha*6 || cell > square-widtha*7) {
        py= py-speed;
      }
      else {
        by+=speed;
      }
      //by+=speed;
      moved +=speed;
      
      currentimage = fox[((moved/6/speed*2)%3)+11];
      
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingup = false;
      }
    }
    if (movingdown) {
      if (cell < widtha*7 || cell > square-widtha*6) {
        py= py+speed;
      }
      else {
        by-=speed;
      }
      moved+=speed;
       currentimage = fox[(moved/6/speed)%3];
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingdown = false;
      }
    }
    if (movingleft) {
      if (cell%widtha < 9 || cell%widtha > widtha-11) {
        px-=speed;
      }
      else {
        bx+=speed;
      }
      moved+=speed;
      currentimage = fox[((moved/6/speed*2)%4)+7];
      
      if (moved >= widt) {
        moved = 0;
        moving = false;
        movingleft = false;
      }
    }
    if (movingright) {
      if (cell%widtha < 10 || cell%widtha > widtha-10) {
        px+=speed;
      }
      else {
        bx-=speed;
      }
      //bx-=speed;
      moved+=speed;
      currentimage = fox[((moved/6/speed*2)%4)+3];
      if (moved >= widt) {
        moved = 0;
        moving = false;
        movingright = false;
      }
    }
  }
}

class Object {
  boolean canpass;
  int type;
  PImage thisobjectsimage; 

  Object(boolean inputCanpass, int inputtype) {
    canpass = inputCanpass;
    type = inputtype;
  }
 
  public boolean passable() {
    if (canpass == true) {
      return true;
    }
    else {
      return false;
    }
  }

  public PImage img() {
    thisobjectsimage = loadImage("./environments/"+environmentnumber+"/"+this.type+".png");
    return thisobjectsimage;
  }  
}

//remember the following are unimplemented, nearly functions.
//where thisarray[i] = null needs to be replaced with objects.

public int leftrightpoint(int point){
  int position = point%widtha;
  int randomlinepos = PApplet.parseInt(random(1,widtha-1));
  if(position == randomlinepos){
    if(randomlinepos%widtha == widtha-2 || randomlinepos%widtha == 1){
          if(randomlinepos%widtha == widtha-2){
           randomlinepos -=1; 
          }
          else{
           randomlinepos +=1; 
          }
    }else{
    int cheeseit= PApplet.parseInt(random(1,2));
    if(cheeseit == 1){
    randomlinepos += 1;
    }
    else{
    randomlinepos -=1; 
    }
  }
  }
  
  int point2 = point-position+randomlinepos;
  if(point2>point){
   for(int i = point2; i>point; i--){
    thisarray[i] = objectlists[1];
   } 
  }
  else{
   for(int i = point2; i<point; i++){
    thisarray[i] = objectlists[1];
   }     
  } 
  return point2;
}






public int updownpoint(int point){
  int vertical = point/widtha;
  int randomvertical = PApplet.parseInt(random(1,heighta-1));  
  if(vertical == randomvertical){
        if(vertical%heighta == heighta-1 || vertical%heighta == 1){
          if(vertical%heighta == heighta-1){
           randomvertical -=1; 
          }
          else{
           randomvertical +=1; 
          }
    }else{
    int cheeseit= PApplet.parseInt(random(1,2));
    if(cheeseit == 1){
    randomvertical -= 1;
    }
    else{
    if(randomvertical-1>=heighta-2){
     randomvertical -=2; 
    }else{
     randomvertical -=1;
    } 
    }
  }
  }
  
 int point2 = widtha*randomvertical+(point%widtha);
  if(point2<point){
   for(int i = point2; i<point; i+=widtha){
    thisarray[i] = objectlists[1];
   } 
  }
  else{
   for(int i = point2; i>point; i-=widtha){
    thisarray[i] = objectlists[1];
   }     
  } 
  return point2;
}




public void fader(){
  if(startFader){
    moving = true;
    colorMode(HSB,360,100,100,100);
    incrementor = incrementor+2.5f*fadeDirection;
    fill(290,100,17,incrementor);
    rect(0,0,width,height);
    println(incrementor);
    if(incrementor >= 100){
      regenerateboard();
      fadeDirection = -1;
    }
    if(incrementor <=0){
      fadeDirection=1;
      incrementor=0;
      moving = false;
      startFader=false;
    }
    colorMode(RGB,255,255,255);
  }
}

public void drawOverlay(){
  if(overlay != null){
    int localsquare = width/19;
    int amountx = widtha*localsquare/width;
    int amounty = heighta*localsquare/height;
    for(int highness = 0; highness<=amounty; highness++){
      for(int wideness = 0; wideness<=amountx; wideness++){
        image(overlay,bx+wideness*width,by+highness*height,width,height);
      }
    }
  }
}

public void drawInventory(){
  for(int i=0; i< 10; i++){
    if(inventory[i] != null){
      image(inventory[i].thisobjectsimage, 400+(i*42), 50, 40,40);
    }
  }
}

public void poofit(int x, int y, int pwidth, int number){
  for(int i=0 ; i<number; i++){
  rotatepoof(randoms[i], 255-thisint*2, x+xrandoms[i]-thisint/2, y+yrandoms[i]-thisint/2, sizerandoms[i]+5+thisint);
  }
  grow();
}

public void grow(){
if(thisint < 255){
 if(frameCount%1==0){
  thisint++;
 }}
}

public int[] randomarray(int amount, int limit){
  int[] rrarray = new int[amount];
  for(int i=0; i<amount; i++){
    rrarray[i] = PApplet.parseInt(random(0,limit));
  }
  return rrarray;
}

public void rotatepoof(int angle, int oo, int xo, int yo, int scaleo) {
  int o = oo;
  int x = xo;
  int y = yo;
  int scale = scaleo;
  resetMatrix();
  translate(x+((scale)/2), y+((scale)/2));
  rotate(radians(frameCount*2+angle%360));
  drawpoof(o, -scale/2, -scale/2, scale, scale);
}

public void drawpoof(int opacity, int x, int y, int w, int h) {
  tint(255, opacity);
  image(poof, x, y, w, h);
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "myGameSketchCopy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
