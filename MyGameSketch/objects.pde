class Object {
  boolean canpass;
  int type;
  PImage thisobjectsimage; 

  Object(boolean inputCanpass, int inputtype) {
    canpass = inputCanpass;
    type = inputtype;
  }
 
  boolean passable() {
    if (canpass == true) {
      return true;
    }
    else {
      return false;
    }
  }

  PImage img() {
    thisobjectsimage = loadImage("./environments/"+environmentnumber+"/"+this.type+".png");
    return thisobjectsimage;
  }  
}

