//youre on the right document
//Board width, Board Height.
int widtha = int(random(19,30));
int heighta = int(random(19,30));
int square = widtha*heighta;

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


NPC enemy1 = new NPC(int(random(2,heighta-1)*widtha+random(2, widtha-1)), 20, 20, 20);
NPC[] enemies = new NPC[square];


//Player variables
  PImage currentimage;
  PImage[] fox = new PImage[14];
  PImage[] foxtail = new PImage[4];
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


PImage poof; 
int[] randoms;
int[] xrandoms;
int[] yrandoms;
int[] sizerandoms;
int thisint = 0;




void setup() {
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

  currentimage = fox[0];
  randoms = randomarray(10, 360);
  xrandoms = randomarray(10, 100);
  yrandoms = randomarray(10, 100);
  sizerandoms = randomarray(10, 30);
  //size(550, 550);
  size(950, 650);

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
  int random1= int(random(5));
  int random2=int(random(5));
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
  
  thisarray[thecake] = objectlists[13];
  
  //stamp3x3(int(random(square)), bigg);
  //stamp2x2(int(random(square)), big);
  //stamp1x1(int(random(square)), mushroom);
  generateparts(0,0,0);
  generatenpcs(enemies, 1, square/40, 2);
  generatechests(3);
}


void clearArrays(){
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

void printboard(){
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


void regeneratePath(){

}


void regenerateboard(){
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
  int random1= int(random(5));
  int random2=int(random(5));
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
  

  thisarray[thecake] = objectlists[13];
  

  generateparts(0,0,0);

  generatechests(3);
  printboard();
}



void draw() {
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

//low/middlelayer
  for (int i=0; i<square; i++) {
    if (i%widtha == 0 && i!=0) {
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
     // image(enemies[h].thisenemiesimage, bx+x2*widt+enemies[j].ex, by+y2*heigh+enemies[h].ey, widt, heigh);
     image(abovearray[h].thisobjectsimage, bx+x4*widt, by+y4*heigh, widt, heigh);
    }
    x4++;
  }



  movements(speed, widt, heigh);
  NPCMovements(speed, 50);
  drawhearts(healthpoints);
  drawMap();
  //poofit(100,100,200,50);
  
}

