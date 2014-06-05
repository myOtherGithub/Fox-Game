void movements(int speed, int heigh, int widt){
  if (moving == true) {
    if (movingup) {
      if (cell < widtha*4 || cell > square-widtha*7) {
        py= py-speed;
      }
      else {
        by+=speed;
      }
      //by+=speed;
      moved +=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingup = false;
      }
    }
    if (movingdown) {
      if (cell < widtha*5 || cell > square-widtha*6) {
        py= py+speed;
      }else{
      by-=speed;
      }
      moved+=speed;
      if (moved >= heigh) {
        moved = 0;
        moving = false;
        movingdown = false;
      }
    }
    if (movingleft) {
      if (cell%widtha < 5 || cell%widtha > widtha-7) {
       px-=speed; 
      }
      else{
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
      if (cell%widtha < 6 || cell%widtha > widtha-6) {
       px+=speed; 
      }
      else{
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
