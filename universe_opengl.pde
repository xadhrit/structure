/*
Space Junk
*/

import processing.opengl.*;

// overall rotation
float ang;

//cube count-lower/raise to test P3D/OPENGL performance
int limit = 600;

// array for all cubes
Cube[] cubes = new Cube[limit];

void setup(){
   // try subsitting P3D to model
   // argument to test performance
   size(800,550, OPENGL);
   
   for (int i=0; i < cubes.length; i++){
      cubes[i] = new Cube(int(random(-20, 20)), int(random(-20, 20)), int(random(-20,20)) , int(random(-340,340)),int(random(-340,340)), int(random(-340,340)));
   }
   frameRate(30);
}

void draw(){
   background(0);
   fill(200);
   
   // set up some different colored lights
   pointLight(51, 102, 255, 65, 60, 100);
   pointLight(200, 40, 60, -65, -60, -150);
   
   //raise overall light in scene
   ambientLight(70,70,10);
   
   /*
    here will come the center of display window you can change 3D argument ('0')
    move block group closer(+)/ further(-)
   */
   translate(width /2, height /2, 150);
   
   // rotate around y and X axes
   rotateY(radians(ang));
   rotateX(radians(ang));
   
   // draw cubes
   for (int i=0; i < cubes.length; i++){
      cubes[i].drawCube();
   }
   
   // used in rotate function calls above
   ang++;
}

class Cube{
   int w, h, d;
   int shiftX, shiftY, shiftZ;
   
   // constructor
   Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
      this.w = w;
      this.h = h;
      this.d= d;
      this.shiftX = shiftX;
      this.shiftY  =shiftY;
      this.shiftZ = shiftZ;
   }
   
   /*main cube drawing method, which looks more confusing than it really is. It's just a bunch of rectangles drawn for each cube face*/
   void drawCube(){
      beginShape(QUADS);
      // front face
      vertex(-w/2 + shiftX, -h/2+ shiftY, -d/2+shiftZ);
      vertex(w + shiftX, -h/2 + shiftY, -d/2+shiftZ);
      vertex(w+ shiftX, h+shiftY, -d/2+shiftZ);
      vertex(-w/2+shiftX,h+shiftY, -d/2 + shiftZ);
      
      // back face
      vertex(-w/2 + shiftX,-h/2 + shiftY, d+ shiftZ);
      vertex(w+shiftX, -h/2+shiftY, d+shiftZ);
      vertex(w+shiftX, h + shiftY, d+ shiftZ);
      vertex(-w/2 + shiftX, h+shiftY, d+ shiftZ);
     
     // left face
     vertex(-w/2 + shiftX,-h/2 + shiftY, -d/2 + shiftZ);
     vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ);
     vertex(-w/2+ shiftX, h+ shiftY, d+shiftZ);
     vertex(-w/2 + shiftX, h+shiftY, -d/2 + shiftZ);
     
     // right face
     vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ);
     vertex(w+shiftX, -h/2+shiftY, d+shiftZ);
     vertex(w+shiftX, h + shiftY, d + shiftZ);
     vertex(w + shiftX, h + shiftY, -d/2 + shiftZ);
 
     // top face
     vertex(-w/2 + shiftX, -h/2 + shiftY , -d/2 +shiftZ);
     vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ);
     vertex(w + shiftX, -h/2 + shiftY, d + shiftZ);
     vertex(-w/2 + shiftX , h + shiftY, d + shiftZ);
     
     endShape();
     
     // add some rotation to each box for pizazz
     rotateY(radians(1));
     rotateX(radians(1));
     rotateZ(radians(1));
 }
}
