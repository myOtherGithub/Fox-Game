void generatenpcs(NPC[] npcs, int level, int amount, int types){
  NPC[] tempenemystore = new NPC[amount];
  for(int i=0; i<amount; i++){
    
     tempenemystore[i] = new NPC(int(random(2,heighta-2)*widtha+random(1,widtha-1)),level,int(random(types)),level*2);
     
  }
  
  for(int j=0; j<amount; j++){
     npcs[tempenemystore[j].cp] = tempenemystore[j];
     npcs[tempenemystore[j].cp].img();
  }
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
    }
  }

  PImage img() {
    if (this.type == 0) {
      thisenemiesimage = loadImage("betch.png");
      return thisenemiesimage;
    }
    else {
      thisenemiesimage = loadImage("mushroom.png");
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

