void keyPressed() {
//thisarray[cell-widtha].type == 100 || thisarray[cell-1].type == 100 || thisarray[cell+1].type == 100 || thisarray[cell+widtha].type == 100
  if (keyCode == UP && moving==false) {
    if (thisarray[cell-widtha].type == 100){
       //println("help me"); 
       regenerateboard();
    }
    if (thisarray[cell-widtha].passable() && enemies[cell-widtha] == null && animated[cell-widtha] == null) {
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
    currentimage=fox[11];
  }
  if (keyCode == DOWN && moving==false) {
    if (thisarray[cell+widtha].type == 100){
       //println("help me"); 
       regenerateboard();
    }
    if (thisarray[cell+widtha].passable() && enemies[cell+widtha] == null && animated[cell+widtha] == null) {
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
    currentimage=fox[1];
  } 
  if (keyCode == LEFT && moving==false) {
    if (thisarray[cell-1].type == 100){
       //println("help me"); 
       regenerateboard();
    }
    if (thisarray[cell-1].passable() && enemies[cell-1] == null && animated[cell-1] == null) {
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
    currentimage=fox[7];
  } 
  if (keyCode == RIGHT && moving==false) {
    if (thisarray[cell+1].type == 100){
       //println("help me"); 
       regenerateboard();
    }
    if (thisarray[cell+1].passable() && enemies[cell+1] == null && animated[cell+1] == null) {
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
     currentimage=fox[3];
  }
  if (key == ' ' && moving==false) {
    if (isup) {
      if (enemies[cell-widtha] != null) {
        speedcheck(-widtha);
      }
      if(animated[cell-widtha] != null){
       animated[cell-widtha].drawme = true; 
      }
    }
    else if (isdown) {
      if (enemies[cell+widtha] != null) {
        speedcheck(widtha);
      }
      if(animated[cell+widtha] != null){
       animated[cell+widtha].drawme = true; 
      }
    }
    else if (isleft) {
      if (enemies[cell-1] != null) {
        speedcheck(-1);
      }
      if(animated[cell-1] != null){
       animated[cell-1].drawme = true; 
      }
    }
    else {
      if (enemies[cell+1] != null) {
        speedcheck(1);
      }
      if(animated[cell+1] != null){
       animated[cell+1].drawme = true; 
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

