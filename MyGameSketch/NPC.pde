class NPC {
  int cp;
  int attack;
  int hp;
  int type;
  int speed;
  boolean canmove = true;
  boolean living = true;
  PImage thisenemiesimage;

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
      thisenemiesimage = loadImage("mushlog.png");
      return thisenemiesimage;
    }
    else {
      thisenemiesimage = loadImage("mushlog.png");
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

