void drawhearts(int phealth){
int fullhearts = phealth/4;
  if(fullhearts > 0){
    for(int g=0; g<=fullhearts; g++){
       image(foxtail[0],g*40+5,5,40,40); 
    }
  }
  int leftover = phealth%4;
  if(leftover>0){
   image(foxtail[4-leftover],(fullhearts*40)+45,5,40,40); 
  }
}
