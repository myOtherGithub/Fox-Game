void loadpimages(PImage[] setme, String prefix){
 for(int inc = 0; inc <setme.length; inc++){
    setme[inc] = loadImage(""+prefix+inc+".png");
 }
}


