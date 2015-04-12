void generatechests(int amount){
  AnimatedObject[] tempcheststore = new AnimatedObject[square];
  for(int i=0; i<amount; i++){
     int thisrandomhere = chestspace(int(random(widtha,square-widtha)), 0);
     if(thisrandomhere >=0){
       
       tempcheststore[thisrandomhere] = new AnimatedObject("./environments/"+environmentnumber+"/c.",14,true);
     }     
  }
  
  for(int j=0; j<square; j++){
     animated[j] = tempcheststore[j];
     if(animated[j] != null){
       animated[j].index = j;
     }
  }
}



int chestspace(int myrandom, int count){
   if(count >=10){
    
     return iteratetonext(myrandom,0);
     
   }else{
   if(thisarray[myrandom] == objectlists[1]){
    return myrandom;
   }else{
    return enemyspace(int(random(widtha,square-widtha)), count+1);
   } 
   }

}


class AnimatedObject {
  PImage[] images;
  int imageCount;
  int frame;
  int lengtha = 255;
  int index = 0;
  boolean animateoninteract;
  boolean drawme = false;
  
AnimatedObject(String imagePrefix, int count, boolean interact) {
    imageCount = count;
    images = new PImage[imageCount];
    animateoninteract = interact;

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
   }
}

  void display(float xpos, float ypos) {
    
    if(animateoninteract){
      if(drawme){
        if(frameCount%3 == 0){
          
          if(frame >4){
           lengtha -=30; 
          }
        
        frame = (frame+1) % imageCount;
         
        }
        if(lengtha <= 0){
          println("it is: " + int((xpos/50)+((ypos/50)*widtha)));
          //bx+x5*widt,by+y5*heigh
          animated[index] = null;
          drawme = !drawme;
         //kills itself
        }
        tint(255,255,255,lengtha);
    image(images[frame], xpos, ypos,50,50);
    
    
    }else{
     image(images[0],xpos,ypos,50,50); 
    }
   }else{
     if(frameCount%5 == 0){
       frame = (frame+1) % imageCount;
     }
       image(images[frame], xpos, ypos,50,50);
     }
       tint(255,255,255,255);
   }

  }

