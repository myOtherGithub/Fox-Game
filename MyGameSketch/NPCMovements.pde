void NPCMovements(int espeed, int cellsize) {
  for (int y=0; y<enemies.length; y++) {
    if (enemies[y] != null) {
      if (enemies[y].movingright) {
        enemies[y].ex += espeed;

        if (enemies[y].ex >= cellsize) {
          enemies[y].ex = 0;
          enemies[y].movingright = false; 
          enemies[y+1] = enemies[y];
          enemies[y+1].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingleft) {
        enemies[y].ex -= espeed;

        if (enemies[y].ex <= -cellsize) {
          enemies[y].ex = 0;
          enemies[y].movingleft = false; 
          enemies[y-1] = enemies[y];
          enemies[y-1].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingdown) {
        enemies[y].ey += espeed;

        if (enemies[y].ey >= cellsize) {
          enemies[y].ey = 0;
          enemies[y].movingdown = false; 
          enemies[y+widtha] = enemies[y];
          enemies[y+widtha].canmove = false;
          enemies[y] = null;
        }
      }
      else if (enemies[y].movingup) {
        enemies[y].ey -=espeed;

        if (enemies[y].ey <= -cellsize) {
          enemies[y].ey = 0;
          enemies[y].movingup = false;
          enemies[y-widtha] = enemies[y];
          enemies[y-widtha].canmove = false;
          enemies[y] = null;
        }
      }
    }
  }
}

