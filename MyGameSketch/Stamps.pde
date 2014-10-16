void generateparts(int amount1, int amount2, int amount3){
 // stamp3x3(int(random(square)), objectlist[int(random(20,21))]);
 // stamp2x2(int(random(square)), objectlist[int(random(10,19))]);
 // stamp1x1(int(random(square)), objectlist[int(random(21,30))]);
 for(int j=0; j<square; j++){
    stamp3x3(j, bigg);
 }
 for(int k=0; k<square; k++){
    int quickrandom2 = int(random(100));
   if(quickrandom2 <50){
     stamp2x2(k, mushlog2);
   }else{
    stamp2x2(k, big);
   } 
 }
 for(int l=0; l<square; l++){
   int quickrandom = int(random(100));
   if(quickrandom <50){
   stamp1x1(l,mushlog);
   }else{
    stamp1x1(l,mushroom);
   } 
 }
}


void stamp3x3(int pointx, Object Randomobject) {
  if (thisarray[pointx] == grass && pointx+(widtha*2)+1< thisarray.length) {
    if (thisarray[pointx+1] == grass && thisarray[pointx+2] == grass && thisarray[pointx+widtha]==grass && thisarray[pointx+widtha+1] == grass && thisarray[pointx+widtha+2] ==grass && thisarray[pointx+(widtha*2)]==grass && thisarray[pointx+(widtha*2)+1] == grass && thisarray[pointx+(widtha*2)+2] ==grass) {
      thisarray[pointx] = grasspath3;
      thisarray[pointx+1] = grasspath3;
      thisarray[pointx+2] = grasspath3;
      thisarray[pointx+widtha] = grasspath3;
      thisarray[pointx+widtha+1] = grasspath3;  
      thisarray[pointx+widtha+2] = grasspath3; 
      thisarray[pointx+(widtha*2)] = grasspath3;
      thisarray[pointx+(widtha*2)+1] = grasspath3;
      thisarray[pointx+(widtha*2)+2] = Randomobject;
    }
  }
  //else {
   // if (pointx > square/2) {
    //  stamp3x3(pointx-square/4, Randomobject);
    //}
    //else {
    //  stamp3x3(pointx+1, Randomobject);
    //}
  //}
}




void stamp2x2(int pointx, Object Randomobject) {
  if (thisarray[pointx] == grass && pointx+widtha+1< thisarray.length) {
    if (thisarray[pointx+1] == grass && thisarray[pointx+widtha]==grass && thisarray[pointx+widtha+1] == grass) {
      thisarray[pointx] = grasspath2;
      thisarray[pointx+1] = grasspath2;
      thisarray[pointx+widtha] = grasspath2;
      thisarray[pointx+widtha+1] = Randomobject;
    }
  }
  //else {
  //  if (pointx > square/2) {
  //    stamp2x2(pointx-square/4, Randomobject);
  //  }
  //  else {
  //    stamp2x2(pointx+1, Randomobject);
  //  }
  //}
}

void stamp1x1(int pointx, Object Randomobject){
   if (thisarray[pointx] == grass) {
      thisarray[pointx] = Randomobject;
  }
  //else {
   // if (pointx > square/2) {
    //  stamp1x1(pointx-square/4, Randomobject);
   // }
    //else {
     // stamp1x1(pointx+1, Randomobject);
    //}
  //}
}
