void drawWeather(){
	if(weather >= 1){
    frameNum++;
	image(weathers[frameNum],0,0,width,height); 
	if(frameNum == 15){
		frameNum = 0;
	}
	}
}