void stamp3x3(int pointx, Object Randomobject) {
  if (thisarray[pointx] == grass && pointx+(widtha*2)+1< thisarray.length) {
    if (thisarray[pointx+1] == grass && thisarray[pointx+2] == grass && thisarray[pointx+widtha]==grass && thisarray[pointx+widtha+1] == grass && thisarray[pointx+widtha+2] ==grass && thisarray[pointx+(widtha*2)]==grass && thisarray[pointx+(widtha*2)+1] == grass && thisarray[pointx+(widtha*2)+2] ==grass) {
      thisarray[pointx] = Randomobject;
      thisarray[pointx+1] = Randomobject;
      thisarray[pointx+2] = Randomobject;
      thisarray[pointx+widtha] = Randomobject;
      thisarray[pointx+widtha+1] = Randomobject;  
      thisarray[pointx+widtha+2] = Randomobject; 
      thisarray[pointx+(widtha*2)] = Randomobject;
      thisarray[pointx+(widtha*2)+1] = Randomobject;
      thisarray[pointx+(widtha*2)+2] = Randomobject;
    }
  }
  else {
    if (pointx > square/2) {
      stamp3x3(pointx-square/4, Randomobject);
    }
    else {
      stamp3x3(pointx+1, Randomobject);
    }
  }
}




void stamp2x2(int pointx, Object Randomobject) {
  if (thisarray[pointx] == grass && pointx+widtha+1< thisarray.length) {
    if (thisarray[pointx+1] == grass && thisarray[pointx+widtha]==grass && thisarray[pointx+widtha+1] == grass) {
      thisarray[pointx] = Randomobject;
      thisarray[pointx+1] = Randomobject;
      thisarray[pointx+widtha] = Randomobject;
      thisarray[pointx+widtha+1] = Randomobject;
    }
  }
  else {
    if (pointx > square/2) {
      stamp2x2(pointx-square/4, Randomobject);
    }
    else {
      stamp2x2(pointx+1, Randomobject);
    }
  }
}

