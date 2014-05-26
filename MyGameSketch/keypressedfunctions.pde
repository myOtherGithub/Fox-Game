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
