Object grass = new Object(true, 0);
Object grasspath = new Object(true, 2);
Object tree = new Object(false, 1);
Object trees = new Object(false, 3);
Object mushroom = new Object(true, 2);
Object mushlog = new Object(true, 4);
NPC enemy1 = new NPC(32,20,20,20);
int widtha = 30;
int heighta = 30;
int square = widtha*heighta;
Object[] thisarray = new Object[square];
NPC[] enemies = new NPC[square];
int bx = 0;
int by = 0;
int cell = widtha*4+5;
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
int px = 50*5;
int py = 50*4;
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


void setup() {
  poof = loadImage("poof.png");
  randoms = randomarray(10,360);
  xrandoms = randomarray(10,100);
  yrandoms = randomarray(10,100);
  sizerandoms = randomarray(10,30);
  size(550, 550);
  enemies[32] = enemy1;
  enemy1.img();
  grass.img();
  grasspath.img();
  tree.img();
  trees.img();
  mushroom.img();
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
  //int point1 = int(random(square-(widtha*2)+1,square-(widtha+1)));
  int point1 = widtha*4+5;
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
}







void draw() {
  int widt = width/11;
  int heigh = widt;
  int x1 = 0;
  int y1 = 0;
  int speed = widt/10;

  for (int i=0; i<square; i++) {
    if (i%widtha == 0 && i!=0) {
      x1 = 0;
      y1++;
    }
    image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    if (enemies[i] != null) {
      image(enemies[i].thisenemiesimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    }
    x1++;
  }
  rect(px, py, widt, heigh);
  movements(speed, widt, heigh);
}

