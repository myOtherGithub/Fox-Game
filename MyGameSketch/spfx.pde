
void poofit(int x, int y, int pwidth, int number){
  for(int i=0 ; i<number; i++){
  rotatepoof(randoms[i], 255-thisint*2, x+xrandoms[i]-thisint/2, y+yrandoms[i]-thisint/2, sizerandoms[i]+5+thisint);
  }
  grow();
}

void grow(){
if(thisint < 255){
 if(frameCount%1==0){
  thisint++;
 }}
}

int[] randomarray(int amount, int limit){
  int[] rrarray = new int[amount];
  for(int i=0; i<amount; i++){
    rrarray[i] = int(random(0,limit));
  }
  return rrarray;
}

void rotatepoof(int angle, int oo, int xo, int yo, int scaleo) {
  int o = oo;
  int x = xo;
  int y = yo;
  int scale = scaleo;
  resetMatrix();
  translate(x+((scale)/2), y+((scale)/2));
  rotate(radians(frameCount*2+angle%360));
  drawpoof(o, -scale/2, -scale/2, scale, scale);
}

void drawpoof(int opacity, int x, int y, int w, int h) {
  tint(255, opacity);
  image(poof, x, y, w, h);
}

