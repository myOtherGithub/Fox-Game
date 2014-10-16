void movements(int speed, int heigh, int widt) {
  if (moving == true) {
    if (movingup) {
      if (cell < widtha*6 || cell > square-widtha*7) {
        py= py-speed;
      }
      else {
        by+=speed;
      }
      //by+=speed;
      moved +=speed;
      
      currentimage = fox[(moved/6/speed*2)%3];
      
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingup = false;
      }
    }
    if (movingdown) {
      if (cell < widtha*7 || cell > square-widtha*6) {
        py= py+speed;
      }
      else {
        by-=speed;
      }
      moved+=speed;
       currentimage = fox[(moved/6/speed)%3];
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingdown = false;
      }
    }
    if (movingleft) {
      if (cell%widtha < 9 || cell%widtha > widtha-11) {
        px-=speed;
      }
      else {
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
      if (cell%widtha < 10 || cell%widtha > widtha-10) {
        px+=speed;
      }
      else {
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

