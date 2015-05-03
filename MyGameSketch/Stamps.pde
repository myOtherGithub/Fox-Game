void generateparts(int amount1, int amount2, int amount3){
 // stamp3x3(int(random(square)), objectlist[int(random(20,21))]);
 // stamp2x2(int(random(square)), objectlist[int(random(10,19))]);
 // stamp1x1(int(random(square)), objectlist[int(random(21,30))]);
 for(int j=0; j<square; j++){
   int quickrandom = int(random(12));
   if(quickrandom <5){
      stamp3x3(j, objectlists[19]);
   }else{
      stamp3x3(j, objectlists[6]);
   }
  
 }
 for(int k=0; k<square; k++){
    int quickrandom2 = int(random(100));
   if(quickrandom2 <30){
     stamp2x2(k, objectlists[11]);
   }
   else if(quickrandom2 >29 && quickrandom2 < 60){
    stamp2x2(k,objectlists[18]); 
   }else{
    stamp2x2(k, objectlists[5]);
   } 
 }
 for(int l=0; l<square; l++){
   int quickrandom = int(random(7));
   if(quickrandom ==0){
   stamp1x1(l,objectlists[12], null);
   }
   if(quickrandom ==2){
    stamp1x1(l,objectlists[8],objectlists[9]); 
   }
   if(quickrandom == 3){
    stamp1x1(l,objectlists[15],null); 
   }
   if(quickrandom ==4){
     stamp1x1(l,objectlists[14],null); 
   }
   if(quickrandom ==6){
    stamp1x1(l,objectlists[16],objectlists[17]); 
   }
   else{
    stamp1x1(l,objectlists[10], null);
   } 
 }
}


void stamp3x3(int pointx, Object Randomobject) {
  if (thisarray[pointx] == objectlists[0] && pointx+(widtha*2)+1< thisarray.length) {
    if (thisarray[pointx+1] == objectlists[0] && thisarray[pointx+2] == objectlists[0] && thisarray[pointx+widtha]==objectlists[0] && thisarray[pointx+widtha+1] == objectlists[0] && thisarray[pointx+widtha+2] ==objectlists[0] && thisarray[pointx+(widtha*2)]==objectlists[0] && thisarray[pointx+(widtha*2)+1] == objectlists[0] && thisarray[pointx+(widtha*2)+2] ==objectlists[0]) {
      thisarray[pointx] = objectlists[3];
      thisarray[pointx+1] = objectlists[3];
      thisarray[pointx+2] = objectlists[3];
      thisarray[pointx+widtha] = objectlists[3];
      thisarray[pointx+widtha+1] = objectlists[3];  
      thisarray[pointx+widtha+2] = objectlists[3]; 
      thisarray[pointx+(widtha*2)] = objectlists[3];
      thisarray[pointx+(widtha*2)+1] = objectlists[3];
      thisarray[pointx+(widtha*2)+2] = Randomobject;
    }
  }
}




void stamp2x2(int pointx, Object Randomobject) {
  if (thisarray[pointx] == objectlists[0] && pointx+widtha+1< thisarray.length) {
    if (thisarray[pointx+1] == objectlists[0] && thisarray[pointx+widtha]==objectlists[0] && thisarray[pointx+widtha+1] == objectlists[0]) {
      thisarray[pointx] = objectlists[2];
      thisarray[pointx+1] = objectlists[2];
      thisarray[pointx+widtha] = objectlists[2];
      thisarray[pointx+widtha+1] = Randomobject;
    }
  }
}

void stamp1x1(int pointx, Object Randomobject, Object Randomobject2){
   if (thisarray[pointx] == objectlists[0]) {
     if(Randomobject.type > 250){
      thisarray[pointx] = Randomobject;
      abovearray[pointx-widtha] = Randomobject2; 
     }
     else if(Randomobject.type >200 && Randomobject.type <=250){
       thisarray[pointx] = Randomobject;
       toparray[pointx] = Randomobject2;
     }else{
       thisarray[pointx] = Randomobject;
     }
  }
}

void stamp1x2(int pointx, Object Randomobject){
   if (thisarray[pointx] == objectlists[0] && thisarray[pointx+widtha] == objectlists[0]) {
     if(Randomobject.type >250 && Randomobject.type <300){
       thisarray[pointx] = Randomobject;
       thisarray[pointx+widtha] = objectlists[2];
       thisarray[pointx] = Randomobject;
       thisarray[pointx+widtha] = objectlists[2];
     }else{
      thisarray[pointx] = objectlists[2];
      thisarray[pointx+widtha] = Randomobject;
     }
    }
  }

