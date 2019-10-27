int takeNumber;
float takeType;
String type = "PRESS ENTER";
int valor = 0;

void setup(){
  size(600,400);
}

void draw(){
  background(255);
  textSize(48);
  fill(0);
  textAlign(CENTER);  
  //cheeks if is a major card or if is your first time choosing
  if(takeNumber == 11){
     text("J" + " of " + type, width/2, height/2);
   }else if(takeNumber == 12){
     text("Q" + " of "+ type, width/2, height/2);
   }else if(takeNumber == 13){
     text("K" + " of " + type, width/2, height/2);
   }else if(takeNumber == 1){
     text("A" + " of " + type, width/2, height/2);
   }else if (valor == 1){
     text(takeNumber + " of " + type, width/2, height/2);
   }else{
     text("PRESS ENTER", width/2, height/2);
   }
}

void keyPressed(){
   if(keyCode == ENTER){
     //take random values and set valor to 1
     takeNumber = floor(random(1,13));
     takeType = floor(random(3));
     valor = 1;
     //take a type of card
     if (takeType == 0){
       type = "clubs";
     }else if (takeType == 1){
       type = "spades";
     }else if (takeType == 2){
       type = "hearts";
     }else if (takeType == 3){
       type = "diamonds";
     }else{
       return;
     }
   }
}
