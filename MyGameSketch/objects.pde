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
  if (this.type == 0) {
    thisobjectsimage = loadImage("grass.png");
    return thisobjectsimage;
  }
  if (this.type == 1) {
    thisobjectsimage = loadImage("trees.png");
    return thisobjectsimage;
  }
  if (this.type == 2) {
    thisobjectsimage = loadImage("mushroom.png");
    return thisobjectsimage;
  }
  if (this.type == 3) {
    thisobjectsimage = loadImage("tree.png");
    return thisobjectsimage;
  }
  if (this.type == 4) {
    thisobjectsimage = loadImage("mushlog.png");
    return thisobjectsimage;
  }
  
    if (this.type == 7) {
    thisobjectsimage = loadImage("mushlog.png");
    return thisobjectsimage;
  }
    if (this.type == 5) {
    thisobjectsimage = loadImage("largeone.png");
    return thisobjectsimage;
  }
  if(this.type == 21){
   thisobjectsimage = loadImage("largeone.png");
   return thisobjectsimage; 
  }
  else{ 
    thisobjectsimage = loadImage("grass.png");
    return thisobjectsimage;
  }
  }
  
}

