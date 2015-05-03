void drawMap(){
	int mapSize = 7;
	colorMode(HSB,360,100,100,100);
	noStroke();
    for(int h=0; h<heighta; h++){
      for(int u=0; u<widtha; u++){
        int num = thisarray[h*widtha+u].type;
        if(num <1){
        	fill(100, 100, 50, 100);
        }else if((num >= 1 && num <= 4) || num == 9 || num == 10 || num ==18 || num ==22 || num ==202){
        	fill(100, 100, 25, 100);
        }
        else if(num == 100){
        	fill(270,100,100);
        }
        else{
        	fill(num,100,100,100);
        }
        if(h*widtha+u == cell){
        	fill(35,100,100,100);
        }
        rect(width-widtha*mapSize+u*mapSize,height-heighta*mapSize+h*mapSize,mapSize,mapSize);
      }
    }
    colorMode(RGB,255,255,255);
  }

  //fill(100, 100, 50, 100);grass
  //fill(100, 100, 25, 100);trees