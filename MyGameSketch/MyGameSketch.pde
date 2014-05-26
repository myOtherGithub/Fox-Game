Object grass = new Object(true, 0);
Object tree = new Object(false, 1);
Object trees = new Object(false, 3);
Object mushroom = new Object(true, 2);
Object mushlog = new Object(true, 4);
int widtha = 30;
int heighta = 30;
int square = widtha*heighta;
Object[] thisarray = new Object[square];
int bx = 0;
int by = 0;
int cell = widtha*4+5;
boolean moving = false;
boolean movingup = false;
boolean movingdown = false;
boolean movingleft = false;
boolean movingright = false;
int moved;
int px = 50*5;
int py = 50*4;



void setup() {
  size(550, 550);
  grass.img();
  tree.img();
  trees.img();
  mushroom.img();
  for (int j=0; j<square; j++) {
    //if (j<widtha*3 || j%widtha==0 || j%widtha==1 || j%widtha==2 || j%widtha==3 || j%widtha==4 || j%widtha==widtha-3 || j%widtha==widtha-4|| j%widtha==widtha-5|| j%widtha==widtha-2 || j%widtha==widtha-1 || j>square-widtha*6) {
    //  thisarray[j] = tree;
    //}
    //else if (j<widtha*4 && j!=0 && j!=widtha-1) {
    //  thisarray[j] = trees;
    //}
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
    x1++;
  }

  rect(px, py, widt, heigh);
  movements(speed, widt, heigh);
  
}




