void NPCMove(NPC[] theseenemies) {
  for (int y=0; y<theseenemies.length; y++) {
    if (theseenemies[y] != null) {//for each enemy on the board]
      if (y+1 == cell || y-1==cell || y-widtha == cell || y+widtha == cell || y+widtha+1 == cell || y+widtha-1 == cell || y-widtha+1 == cell || y-widtha-1==cell) {
      }
      else {
        if (theseenemies[y].canmove == true) {
          int thisrandom = int(random(1, 5)); //choose random number
          if (thisrandom == 1) {
            if (thisarray[y+1].passable() && y+1!=cell ) {
              theseenemies[y+1] = theseenemies[y];
              theseenemies[y+1].canmove = false;
              theseenemies[y] = null;
            }
          }
          else if (thisrandom ==2) {
            if (thisarray[y-1].passable() && y-1!=cell) {
              theseenemies[y-1] = theseenemies[y];
              theseenemies[y-1].canmove = false;
              theseenemies[y] = null;
            }
          }
          else if (thisrandom ==3) {
            if (thisarray[y+widtha].passable() && y+widtha!=cell) {
              theseenemies[y+widtha] = theseenemies[y];
              theseenemies[y+widtha].canmove = false;
              theseenemies[y] = null;
            }
          }
          else {
            if (thisarray[y-widtha].passable() && y-widtha!=cell) {
              theseenemies[y-widtha] = theseenemies[y];
              theseenemies[y-widtha].canmove = false;
              theseenemies[y] = null;
            }
          }
        }
      }
    }
  }
}


void refreshmoves(NPC[] theseenemies) {
  for (NPC thisnpc : theseenemies) {
    if (thisnpc !=null) {
      thisnpc.canmove = true;
    }
  }
}

