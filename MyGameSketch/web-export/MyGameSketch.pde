Object grass = new Object(true, 0);
Object grasspath = new Object(true, 2);
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
  int numberoftimes = int(random(3,20));
  int thecake = point1;
  int coca = int(random(3,20));
  for(int k=0; k<= coca; k++){ 
  if(k%2 ==0){
   thecake = updownpoint(thecake); 
  }
  else{
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
    x1++;
  }

  rect(px, py, widt, heigh);
  movements(speed, widt, heigh);
}



void keyPressed() {
  if (keyCode == UP && moving==false) {
    if (thisarray[cell-widtha].passable()) {
      cell = cell-widtha;
      movingup = true;
      moving = true;
        
      //moving = false;
      //by+=50;
    }
  } 
  if (keyCode == DOWN && moving==false) {
    if (thisarray[cell+widtha].passable()) {
      movingdown = true;
      moving = true;
      cell = cell+widtha;
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
void movements(int speed, int heigh, int widt){
  if (moving == true) {
    if (movingup) {
      if (cell < widtha*4 || cell > square-widtha*7) {
        py= py-speed;
      }
      else {
        by+=speed;
      }
      //by+=speed;
      moved +=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingup = false;
      }
    }
    if (movingdown) {
      if (cell < widtha*5 || cell > square-widtha*6) {
        py= py+speed;
      }else{
      by-=speed;
      }
      moved+=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingdown = false;
      }
    }
    if (movingleft) {
      if (cell%widtha < 5 || cell%widtha > widtha-7) {
       px-=speed; 
      }
      else{
        bx+=speed;  
      }
      moved+=speed;
      if (moved >= widt) {
        moved = 0;
        moving = false;
        movingleft = false;
      }
    }
    if (movingright) {
      if (cell%widtha < 6 || cell%widtha > widtha-6) {
       px+=speed; 
      }
      else{
        bx-=speed;  
      }
      //bx-=speed;
      moved+=speed;
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
  

  boolean passable() {
    if (canpass == true) {
      return true;
    }
    else {
      return false;
    }
  }

  PImage img() {
  if (this.type == 0) {
    thisobjectsimage = loadImage("grass.png");
    return thisobjectsimage;
  }
  if (this.type == 1) {
    thisobjectsimage = loadImage("trees.png");
    return thisobjectsimage;
  }
  if (this.type == 2) {
    thisobjectsimage = loadImage("mushroom.png");
    return thisobjectsimage;
  }
  if (this.type == 3) {
    thisobjectsimage = loadImage("tree.png");
    return thisobjectsimage;
  }
  else{ 
    thisobjectsimage = loadImage("grass.png");
    return thisobjectsimage;
  }
  }
  
}

//remember the following are unimplemented, nearly functions.
//where thisarray[i] = null needs to be replaced with objects.

int leftrightpoint(int point){
  int position = point%widtha;
  int randomlinepos = int(random(1,widtha-1));
  if(position == randomlinepos){
    if(randomlinepos%widtha == widtha-2 || randomlinepos%widtha == 1){
          if(randomlinepos%widtha == widtha-2){
           randomlinepos -=1; 
          }
          else{
           randomlinepos +=1; 
          }
    }else{
    int cheeseit= int(random(1,2));
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
    thisarray[i] = grasspath;
   } 
  }
  else{
   for(int i = point2; i<point; i++){
    thisarray[i] = grasspath;
   }     
  } 
  return point2;
}






int updownpoint(int point){
  int vertical = point/widtha;
  int randomvertical = int(random(1,heighta-1));  
  if(vertical == randomvertical){
        if(vertical%heighta == heighta-1 || vertical%heighta == 1){
          if(vertical%heighta == heighta-1){
           randomvertical -=1; 
          }
          else{
           randomvertical +=1; 
          }
    }else{
    int cheeseit= int(random(1,2));
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
    thisarray[i] = grasspath;
   } 
  }
  else{
   for(int i = point2; i>point; i-=widtha){
    thisarray[i] = grasspath;
   }     
  } 
  return point2;
}


//
//void stamp3x3(int pointx){
//  if([pointx] == 0 && pointx+(widtha*2)+1< holder.length){
//    if(holder[pointx+1] == 0 && holder[pointx+2] == 0 && holder[pointx+widtha]==0 && holder[pointx+widtha+1] == 0 && holder[pointx+widtha+2] ==0 && holder[pointx+(widtha*2)]==0 && holder[pointx+(widtha*2)+1] == 0 && holder[pointx+(widtha*2)+2] ==0){
//       holder[pointx] = 7;
//       holder[pointx+1] = 7;
//       holder[pointx+2] = 7;
//       holder[pointx+widtha] = 7;
//       holder[pointx+widtha+1] = 7;  
//       holder[pointx+widtha+2] = 7; 
//       holder[pointx+(widtha*2)] = 7;
//       holder[pointx+(widtha*2)+1] = 7;
//       holder[pointx+(widtha*2)+2] = 7;  
//    }  
//  }
//  else{
//    if(pointx > square/2){
//      stamp3x3(pointx-square/4);
//    }
//    else{
//      stamp3x3(pointx+1);
//    }  
//  }  
//}
//
//
//
//
//void stamp2x2(int pointx){
//  if(holder[pointx] == 0 && pointx+widtha+1< holder.length){
//    if(holder[pointx+1] == 0 && holder[pointx+widtha]==0 && holder[pointx+widtha+1] == 0){
//       holder[pointx] = 3;
//       holder[pointx+1] = 3;
//       holder[pointx+widtha] = 3;
//       holder[pointx+widtha+1] = 3;  
//    }  
//  }
//  else{
//    if(pointx > square/2){
//      stamp2x2(pointx-square/4);
//    }
//    else{
//      stamp2x2(pointx+1);
//    }  
//  }  
//}
//
//


