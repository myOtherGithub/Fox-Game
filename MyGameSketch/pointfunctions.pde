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
    thisarray[i] = grass;
   } 
  }
  else{
   for(int i = point2; i<point; i++){
    thisarray[i] = grass;
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
    thisarray[i] = grass;
   } 
  }
  else{
   for(int i = point2; i>point; i-=widtha){
    thisarray[i] = grass;
   }     
  } 
  return point2;
}


//
//void stamp3x3(int pointx){
//  if([pointx] == 0 && pointx+(widtha*2)+1< holder.length){
//    if(holder[pointx+1] == 0 && holder[pointx+2] == 0 && holder[pointx+widtha]==0 && holder[pointx+widtha+1] == 0 && holder[pointx+widtha+2] ==0 && holder[pointx+(widtha*2)]==0 && holder[pointx+(widtha*2)+1] == 0 && holder[pointx+(widtha*2)+2] ==0){
//       holder[pointx] = 7;
//       holder[pointx+1] = 7;
//       holder[pointx+2] = 7;
//       holder[pointx+widtha] = 7;
//       holder[pointx+widtha+1] = 7;  
//       holder[pointx+widtha+2] = 7; 
//       holder[pointx+(widtha*2)] = 7;
//       holder[pointx+(widtha*2)+1] = 7;
//       holder[pointx+(widtha*2)+2] = 7;  
//    }  
//  }
//  else{
//    if(pointx > square/2){
//      stamp3x3(pointx-square/4);
//    }
//    else{
//      stamp3x3(pointx+1);
//    }  
//  }  
//}
//
//
//
//
//void stamp2x2(int pointx){
//  if(holder[pointx] == 0 && pointx+widtha+1< holder.length){
//    if(holder[pointx+1] == 0 && holder[pointx+widtha]==0 && holder[pointx+widtha+1] == 0){
//       holder[pointx] = 3;
//       holder[pointx+1] = 3;
//       holder[pointx+widtha] = 3;
//       holder[pointx+widtha+1] = 3;  
//    }  
//  }
//  else{
//    if(pointx > square/2){
//      stamp2x2(pointx-square/4);
//    }
//    else{
//      stamp2x2(pointx+1);
//    }  
//  }  
//}
//
//

