void drawMap(){
	int mapSize = 5;
	colorMode(HSB,360,100,100,100);
	noStroke();
    for(int h=0; h<heighta; h++){
      for(int u=0; u<widtha; u++){
        int num = thisarray[h*widtha+u].type;
        if(num <1){
        	fill(100, 100, 50, 100);
        }else if(num == 1 || num == 3 || num == 10){
        	fill(100, 100, 25, 100);
        }
        else{
        	fill(num,100,100,100);
        }
        rect(width-widtha*mapSize+u*mapSize,height-heighta*mapSize+h*mapSize,mapSize,mapSize);
      }
    }
    colorMode(RGB,255,255,255,100);
  }

  //fill(100, 100, 50, 100);grass
  //fill(100, 100, 25, 100);trees