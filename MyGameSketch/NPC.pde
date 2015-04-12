void generatenpcs(NPC[] npcs, int level, int amount, int types){
  NPC[] tempenemystore = new NPC[amount];
  for(int i=0; i<amount; i++){
     int thisrandomhere = enemyspace(int(random(widtha,square-widtha)), 0);
     //int thisrandomhere = int(random(widtha,square-widtha));
     
     if(thisrandomhere >=0){
     tempenemystore[i] = new NPC(thisrandomhere,level,int(random(types)),level*2);
     }     
  }
  
  for(int j=0; j<amount; j++){
     npcs[tempenemystore[j].cp] = tempenemystore[j];
     npcs[tempenemystore[j].cp].img();
  }
}


int enemyspace(int myrandom, int count){
   if(count >=10){
    
     return iteratetonext(myrandom,0);
     
   }else{
   if(thisarray[myrandom] == objectlists[0] || thisarray[myrandom] == objectlists[1]){
    return myrandom;
   }else{
    return enemyspace(int(random(widtha,square-widtha)), count+1);
   } 
   }

}


int iteratetonext(int myrandom, int count){
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

  void attack() {
    if (cp-1 == cell || cp+1 == cell || cp+widtha == cell || cp-widtha == cell) {
      healthpoints -=attack;
      println("attacked!");
    }
  }

  PImage img() {
    if (this.type == 0) {
      thisenemiesimage = loadImage("betch.png");
      return thisenemiesimage;
    }
    else {
      thisenemiesimage = loadImage("monster1.png");
      return thisenemiesimage;
    }
  }


  void attackme(int strength) {
    hp -= strength;
    if (hp <= 0) {
      println("you did it");
      living = false;
    }
  }
}

