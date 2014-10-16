Object grass = new Object(true, 0);
Object grasspath = new Object(true, 0);
Object grasspath2 = new Object(false, 0);
Object grasspath3 = new Object(false, 0);
Object tree = new Object(false, 1);
Object big = new Object(false, 5);
Object bigg = new Object(false, 21);
Object trees = new Object(false, 3);
Object mushroom = new Object(false, 2);
Object mushlog2 = new Object(false, 7);
Object mushlog = new Object(false, 4);


Object[] inventory = new Object[10];
int[] positions = new int[9];
//int[] thisintarray = new int[square];
ArrayList<Integer> myList = new ArrayList<Integer>();


int widtha = 30;
int heighta = 30;
NPC enemy1 = new NPC(int(random(2,heighta-1)*widtha+random(2, widtha-1)), 20, 20, 20);
int square = widtha*heighta;
Object[] thisarray = new Object[square];
NPC[] enemies = new NPC[square];
PImage currentimage;
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
int pspeed = 5;
int pattack =6;
PImage poof; 
int[] randoms;
int[] xrandoms;
int[] yrandoms;
int[] sizerandoms;
int thisint = 0;
PImage[] fox = new PImage[3];

void setup() {
  poof = loadImage("poof.png");
  fox[0] = loadImage("fox0.png");
  fox[1] = loadImage("fox1.png");
  fox[2] = loadImage("fox2.png");
  currentimage = fox[0];
  randoms = randomarray(10, 360);
  xrandoms = randomarray(10, 100);
  yrandoms = randomarray(10, 100);
  sizerandoms = randomarray(10, 30);
  //size(550, 550);
  size(950, 650);
  //this generates the enemies
  generatenpcs(enemies, 1, 10, 2);

  grass.img();
  big.img();  
  bigg.img();
  grasspath.img();
    grasspath2.img();
    grasspath3.img();
  tree.img();
  mushlog.img();
  trees.img();
  mushroom.img();
  mushlog2.img();
  //this creates the borders
  for (int j=0; j<square; j++) {
    if ( j%widtha==0 || j%widtha==widtha-1|| j>square-widtha) {
      thisarray[j] = tree;
    }
    else if (j<widtha && j!=0 && j!=widtha-1) {
      thisarray[j] = trees;
    }
    else {
      thisarray[j] =  grass;
    }
  }
  
  //this is where we generate the objects
  
  //lets comb it a first time setting up the dots that is grasspath
  
  for(int m=0; m<square; m++){
    if(m%2==0 && (m/widtha)%2==0){
      if(thisarray[m].type <1){
        thisarray[m] = grasspath;
        myList.add(m);
      }
    }
  }
  
  //go through again to break down walls
  for(int o = 0; o<myList.size(); o++){
  int currentpos = myList.get(o);
  int random1= int(random(5));
  int random2=int(random(5));
  if(random1 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
        thisarray[currentpos+1] = grasspath;
      }
    }
  }
  if(random1 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
        thisarray[currentpos-1] = grasspath;
      }
    }
  }
  if(random1 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
        thisarray[currentpos+widtha] = grasspath;
      }
    }
  }
  if(random1 == 3){
    if(currentpos-widtha > 0){
      if(thisarray[currentpos-widtha].type <1){
          thisarray[currentpos-widtha] = grasspath;
      }
    }
    
  }
  if(random1 == 4){
    if(thisarray[currentpos].type <1){
   thisarray[currentpos] = grass; 
    }
  }
  if(random2 == 0){
    if(currentpos+1 < square){
      if(thisarray[currentpos+1].type <1){
         thisarray[currentpos+1] = grasspath;
      }
    }
  }
  if(random2 == 1){
    if(currentpos-1 > 0){
      if(thisarray[currentpos-1].type <1){
    thisarray[currentpos-1] = grasspath;
      }
    }
  }
  if(random2 == 2){
    if(currentpos+widtha < square){
      if(thisarray[currentpos+widtha].type <1){
    thisarray[currentpos+widtha] = grasspath;
      }
    }
  }
  if(random2 == 3){
        if(currentpos-widtha > 0){
          if(thisarray[currentpos-widtha].type <1){
    thisarray[currentpos-widtha] = grass;
          }
    }
  }
  
    if(random2 == 4){
        if(currentpos > 0){
          if(thisarray[currentpos].type <1){
    thisarray[currentpos] = grass;
          }
    }
  }
  
}

  
  
  
  
  
  
  
  
  
  
  
  
  //This creates the path
  int point1 = widtha*(py/50) + (px/50);
  //int point1 = widtha*4+5;
  thisarray[point1] = grasspath;
  int numberoftimes = int(random(3, 20));
  int thecake = point1;
  for (int k=0; k<= numberoftimes; k++) { 
    if (k%2 ==0) {
      thecake = updownpoint(thecake);
    }
    else {
      thecake = leftrightpoint(thecake);
    }
  }
  
  //stamp3x3(int(random(square)), bigg);
  //stamp2x2(int(random(square)), big);
  //stamp1x1(int(random(square)), mushroom);
  generateparts(0,0,0);
}







void draw() {
  //int widt = width/11;
  int widt = width/19;
  int heigh = widt;
  int x1 = 0;
  int y1 = 0;
  int x2 = 0;
  int y2 = 0;
  int speed = widt/20;
  //int speed = 50;
  int ex = 0;
  int ey = 0;

  for (int i=0; i<square; i++) {
    if (i%widtha == 0 && i!=0) {
      x1 = 0;
      y1++;
    }
    if(thisarray[i].type >= 5 && thisarray[i].type <= 19){
      image(grasspath2.thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, (bx+x1*widt)-widt, (by+y1*heigh)-heigh, widt*2, heigh*2);
    }else if(thisarray[i].type >= 20){
      image(grasspath2.thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
      image(thisarray[i].thisobjectsimage, (bx+x1*widt)-(widt*2), (by+y1*heigh)-(heigh*2), widt*3, heigh*3);
    }else {
    image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    }
    x1++;
  }

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
  movements(speed, widt, heigh);
  NPCMovements(speed, 50);
  
}

