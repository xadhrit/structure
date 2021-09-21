float headX;
float headY;
float speedX=.7;
float speedY=.9;

// for puff today
int cells = 2000;
float[]px = new float[cells];
float[]py = new float[cells];
float[]radiiX = new float[cells];
float[]radiiY =new float[cells];
float[]angle = new float[cells];
float[]frequency =new float[cells];
float[]cellRadius = new float[cells];

void setup(){
   size(300,300);
   // begin in the center
   headX = width /2;
   headY = width / 2;
   
   // fill body waves
   for (int i=0; i < cells; i++){
      radiiX[i] = random(-7,7);
      radiiY[i] =random(-4,4);
      frequency[i]= random(-9,9);
      cellRadius[i]= random(16,40);
  }
  frameRate(30);
}

void draw(){
   background(0);
   noStroke();
   fill(255,255,255,5);
   
   // follow the leader
   for (int i=0; i< cells; i++){
       if (i==0){
          px[i]= headX+ sin(radians(angle[i]))*radiiX[i];
          px[i] = headY + cos(radians(angle[i]))*radiiY[i];
          
       }
      
      else {
          px[i] = px[i-1]+ cos(radians(angle[i]))*radiiX[i];
          py[i] = py[i-1] + sin(radians(angle[i]))*radiiY[i];
          
          if (px[i]>= width-cellRadius[i]/2 ||px[i]<= cellRadius[i]/2){
              radiiX[i] *=-1;
              cellRadius[i] = random(1,40);
              frequency[i] = random(-13,13);
          }
          if (py[i] >= height - cellRadius[i]/2 || py[i]<=cellRadius[i]/2){
            radiiY[i]*= -1;
            cellRadius[i] = random(1, 40);
            frequency[i] = random(-9,9);
          }
      } 
      ellipse(px[i],py[i], cellRadius[i], cellRadius[i]);
      // set speed of body
      angle[i] += frequency[i];
   }
   
   headX += speedX;
   headY += speedY;
   
   if (headX >= width-cellRadius[0]/2 || headX <= cellRadius[0]/2){
       speedX *=-1;
   }
   if (headY >= height-cellRadius[0]/2 || headY <= cellRadius[0]/2){
      speedY *=-1;
   }
}
