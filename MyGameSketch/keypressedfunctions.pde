void keyPressed() {
  if (keyCode == UP && moving==false) {
    if (thisarray[cell-widtha].passable() && enemies[cell-widtha] == null) {
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
  } 
  if (keyCode == DOWN && moving==false) {
    if (thisarray[cell+widtha].passable() && enemies[cell+widtha] == null) {
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
  } 
  if (keyCode == LEFT && moving==false) {
    if (thisarray[cell-1].passable() && enemies[cell-1] == null) {
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
  } 
  if (keyCode == RIGHT && moving==false) {
    if (thisarray[cell+1].passable() && enemies[cell+1] == null) {
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
  }
  if (key == ' ' && moving==false) {
    if (isup) {
      if (enemies[cell-widtha] != null) {
        speedcheck(-widtha);
      }
    }
    else if (isdown) {
      if (enemies[cell+widtha] != null) {
        speedcheck(widtha);
      }
    }
    else if (isleft) {
      if (enemies[cell-1] != null) {
        speedcheck(-1);
      }
    }
    else {
      if (enemies[cell+1] != null) {
        speedcheck(1);
      }
    }
  }
}

void speedcheck(int number) {
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

