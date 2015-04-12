//remember the following are unimplemented, nearly functions.
//where thisarray[i] = null needs to be replaced with objects.

int leftrightpoint(int point){
  int position = point%widtha;
  int randomlinepos = int(random(1,widtha-1));
  if(position == randomlinepos){
    if(randomlinepos%widtha == widtha-2 || randomlinepos%widtha == 1){
          if(randomlinepos%widtha == widtha-2){
           randomlinepos -=1; 
          }
          else{
           randomlinepos +=1; 
          }
    }else{
    int cheeseit= int(random(1,2));
    if(cheeseit == 1){
    randomlinepos += 1;
    }
    else{
    randomlinepos -=1; 
    }
  }
  }
  
  int point2 = point-position+randomlinepos;
  if(point2>point){
   for(int i = point2; i>point; i--){
    thisarray[i] = objectlists[1];
   } 
  }
  else{
   for(int i = point2; i<point; i++){
    thisarray[i] = objectlists[1];
   }     
  } 
  return point2;
}






int updownpoint(int point){
  int vertical = point/widtha;
  int randomvertical = int(random(1,heighta-1));  
  if(vertical == randomvertical){
        if(vertical%heighta == heighta-1 || vertical%heighta == 1){
          if(vertical%heighta == heighta-1){
           randomvertical -=1; 
          }
          else{
           randomvertical +=1; 
          }
    }else{
    int cheeseit= int(random(1,2));
    if(cheeseit == 1){
    randomvertical -= 1;
    }
    else{
    if(randomvertical-1>=heighta-2){
     randomvertical -=2; 
    }else{
     randomvertical -=1;
    } 
    }
  }
  }
  
 int point2 = widtha*randomvertical+(point%widtha);
  if(point2<point){
   for(int i = point2; i<point; i+=widtha){
    thisarray[i] = objectlists[1];
   } 
  }
  else{
   for(int i = point2; i>point; i-=widtha){
    thisarray[i] = objectlists[1];
   }     
  } 
  return point2;
}




