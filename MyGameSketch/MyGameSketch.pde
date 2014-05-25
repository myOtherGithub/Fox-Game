Object grass = new Object(true, 0);
Object tree = new Object(false, 1);
Object trees = new Object(false, 3);
Object mushroom = new Object(true, 2);
Object mushlog = new Object(true, 4);
int widtha = 20;
int heighta = 20;
int square = widtha*heighta;
Object[] thisarray = new Object[square];

int bx = 0;
int by = 0;
int cell = 85;
boolean moving = false;
boolean movingup = false;
boolean movingdown = false;
boolean movingleft = false;
boolean movingright = false;
int moved;

  //boolean sketchFullScreen() {
  //  return true;
  //}

 // if (frame != null) {
 //   frame.setResizable(true);
 // }
void setup() {
  size(550, 550);
  
  grass.img();
  tree.img();
  trees.img();
  mushroom.img();
  for (int j=0; j<400; j++) {
    if (j<60 || j%20==0 || j%20==1 || j%20==2 || j%20==3 || j%20==4 || j%20==17|| j%20==16|| j%20==15|| j%20==18 || j%20==19 || j>280) {
      thisarray[j] = tree;
    }
    else if (j<80 && j!=0 && j!=19) {
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
  int px = widt*5;
  int py = widt*4;
  int speed = widt/10;
  
  

  for (int i=0; i<400; i++) {
    if (i%20 == 0 && i!=0) {
      x1 = 0;
      y1++;
    }
    //rect(x1*32,y1*32,32,32);
    //image(trees.thisobjectsimage, x1*50, y1*50, 50, 50);
    image(thisarray[i].thisobjectsimage, bx+x1*widt, by+y1*heigh, widt, heigh);
    x1++;
  }

  rect(px, py, widt, heigh);

  if (moving == true) {
    if (movingup) {
      by+=speed;
      moved +=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingup = false;
      }
    }
    if (movingdown) {
      by-=speed;
      moved+=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingdown = false;
      }
    }
    if (movingleft) {
      bx+=speed;
      moved+=speed;
      if (moved >= widt) {
        moved = 0;
        moving = false;
        movingleft = false;
      }
    }
    if (movingright) {
      bx-=speed;
      moved+=speed;
      if (moved >= widt) {
        moved = 0;
        moving = false;
        movingright = false;
      }
    }
  }
}



void keyPressed() {
  if (keyCode == UP && moving==false) {
    if (thisarray[cell-20].passable()) {
      movingup = true;
      moving = true;
      // moved = 0;
      cell = cell-20;      
      //moving = false;
      //by+=50;
    }
  } 
  if (keyCode == DOWN && moving==false) {
    //if(cell+20<400){
    if (thisarray[cell+20].passable()) {
      movingdown = true;
      moving = true;
      // moving = true;
      cell = cell+20;
      //py+=50;
      //by-=50;
      //}
    }
  } 
  if (keyCode == LEFT && moving==false) {
    if (thisarray[cell-1].passable()) {
      movingleft = true;
      moving = true;
      cell = cell-1;
      // px-=50;
      //bx+=50;
    }
  } 
  if (keyCode == RIGHT && moving==false) {
    if (thisarray[cell+1].passable()) {
      moving = true;
      movingright = true;
      cell = cell+1;
      //px+=50;
      //bx-=50;
    }
  }
}

