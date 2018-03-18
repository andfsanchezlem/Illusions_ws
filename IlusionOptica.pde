 int illusions = 7;
int current = 1;
//toggle illusion activation
boolean active = true;

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  pushStyle();
  switch(current) {
  case 1:
    scintillating();
    break;
    // implement from here. Don't forget to add break for each case
  case 2:
    CafeWall();
    break;
  case 3:
    Anemic_Cinema();
    break;
  case 4:
    Bulging_Checkboard();
    break;
  case 5:
    Circulos_Titchener();
    break;
  case 6:
    Triangles();
    break;
  case 7:
    Mechanic_Waves();
    break;
    //println("implementation is missed!");
  }
  popStyle();
}

// switch illusion using the spacebar
void keyPressed() {
  if (key == ' ')
    current = current < illusions ? current+1 : 1;
  if (key == 'a')
    active = !active;
}

// Complete info for each illusion

/*
 Scintillating Grid
 Author: E. Lingelbach, 1994
 Code adapted from Rupert Russell implementation
 Tags: Physiological illusion, Hermann grid illusion
*/
void scintillating() {
  background(0);          // black background

  //style
  strokeWeight(3);        // medium weight lines
  smooth();               // antialias lines
  stroke(100, 100, 100);  // dark grey colour for lines

  int step = 25;          // grid spacing

  //vertical lines
  for (int x = step; x < width; x = x + step) {
    line(x, 0, x, height);
  }

  //horizontal lines
  for (int y = step; y < height; y = y + step) {
    line(0, y, width, y);
  }

  // Circles
  if (active) {
    ellipseMode(CENTER);
    stroke(255, 255, 255);  // white circles
    for (int i = step; i < width -5; i = i + step) {
      for (int j = step; j < height -15; j = j + step) {
        strokeWeight(6);
        point(i, j);
        strokeWeight(3);
      }
    }
  }
}
/*
 Ilusión: Café wall 
 Author: Richard Gregory
 Implementado desde cero
 Etiquetas: Geometrica
*/
void CafeWall(){
  int step = 25;
  int count = 0;
  int count2 = step;

  fill(255);
  for(int i = 0; i < height; i = i +step){
    rect(0,i,width,step);
  }
  if(active){
    for(int j = 0; j < height; j = j + step){
      if (count < step){
        count = count +5;
      }
      if (count == step &&  count2 == step ){
        count2 = count2 - 5;
      }
      if (count == step &&  count2 > 0 ){
        count2 = count2 - 5;
      }
      if(count == step &&  count2 == 0){
        count = 0;
        count2 = step;
      }
      for(int k = 0; k < width; k = k + step){
        fill(0);
        if(count < step && count2 == step){
          rect(k*2+count,j,step,step);
        }
        if(count == step && count2 > 0){
          rect(k*2+count2,j,step,step);
        }
      }
    }
  }
}

/*
Ilusión: Anemic Cinema
Author: Marcel Duchamp, 1926
Adaptado:https://www.openprocessing.org/sketch/164071
Etiquetas: ilusión psicológica
*/
float angulo = 0;
float angulo2 = 0;
void Anemic_Cinema(){
  background(0);
  noStroke();
  translate(width / 2, height / 2);
  float radio=width / 2;
  int c = 255;
  int rad=50;
  if (active)
    rad=20;
  angulo2=angulo;

  while (radio >= 1) {
    fill(c);
    c = 255 - c;
    ellipse(0, 0, radio * 2, radio * 2);
    radio -= rad;
    angulo2 += PI*2+0.50;
    float x = cos(angulo2) * 15;
    float y = sin(angulo2) * 15;
    translate(x, y);
  }
  angulo += PI / 50.0;
}

/*
Ilusión: Bulging checkerboard 
Author: Akiyoshi Kitaoka, Diciembre 30, 2009
Implementado desde cero
Etiquetas: Geometrica
*/
int size = 15;
int size2 = 3;
void diagonalDer(int step, int i, int j){
  if(i % 2 == 0 && j % 2 == 0){
    fill(255);
    rect(j+step-size-size2,i+size2,size,size);
    rect(j+size2,i+step-size2-size,size,size);
  }
  if(i % 2 == 0 && j % 2 == 1){
    fill(0);
    rect(j+step-size-size2,i+size2,size,size);
    rect(j+size2,i+step-size2-size,size,size);
  }
  if(i % 2 == 1 && j % 2 == 0){
    fill(0);
    rect(j+step-size-size2,i+size2,size,size);
    rect(j+size2,i+step-size2-size,size,size);
  }
  if(i % 2 == 1 && j % 2 == 1){
    fill(255);
    rect(j+step-size-size2,i+size2,size,size);
    rect(j+size2,i+step-size2-size,size,size);
  }
}
void diagonalIzq(int step, int i, int j){
  if(i % 2 == 0 && j % 2 == 0){
    fill(255);
    rect(j+size2,i+size2,size,size);
    rect(j-size2+step-size,i+step-size2-size,size,size);
  }
  if(i % 2 == 0 && j % 2 == 1){
    fill(0);
    rect(j+size2,i+size2,size,size);
    rect(j-size2+step-size,i+step-size2-size,size,size);
  }
  if(i % 2 == 1 && j % 2 == 0){
    fill(0);
    rect(j+size2,i+size2,size,size);
    rect(j-size2+step-size,i+step-size2-size,size,size);
  }
  if(i % 2 == 1 && j % 2 == 1){
    fill(255);
    rect(j+size2,i+size2,size,size);
    rect(j-size2+step-size,i+step-size2-size,size,size);
  }
}
void Bulging_Checkboard(){
  int step = 61;
  background(255);
  
  for(int i = 0; i < height; i += step){
    for(int j = 0; j < height; j += step){
      fill(0);
      if(i % 2 == 0){
        rect(j*2, i, step, step);
      }
      else{
        rect(j*2+step, i, step, step);
      }
    }
  }
  
  if(active){
    for(int i = 0; i < step*6; i += step){
      for(int j = 0; j < step*6; j += step){
        diagonalDer(step,i,j);
      }
    }
    for(int i = step*7; i < height; i += step){
      for(int j = step*7; j < width; j += step){
        diagonalDer(step,i,j);
      }
    }
    for(int i = 0; i < step*6 ; i += step){
      for(int j = step*7; j < width; j += step){
        diagonalIzq(step,i,j);
      }
    }
    for(int i = step*7; i < height; i += step){
      for(int j = 0; j < step*6; j += step){
        diagonalIzq(step,i,j);
      }
    }
    for(int i = 0; i < step*6; i += step){
      if(i % 2 == 0){
        fill(255);
        rect(step*6-size2+step-size,i+step-size-size2,size,size);
        rect(step*6+size2,i+step-size-size2,size,size);
      }
      if(i % 2 == 1){
        fill(0);
        rect(step*6-size2+step-size,i+step-size-size2,size,size);
        rect(step*6+size2,i+step-size-size2,size,size);
      }
    }
    for(int i = step*7; i < height; i += step){
      if(i % 2 == 0){
        fill(255);
        rect(step*6-size2+step-size,i+size2,size,size);
        rect(step*6+size2,i+size2,size,size);
      }
      if(i % 2 == 1){
        fill(0);
        rect(step*6-size2+step-size,i+size2,size,size);
        rect(step*6+size2,i+size2,size,size);
      }
    }
    for(int j = 0; j < step*6; j += step){
      if(j % 2 == 0){
        fill(255);
        rect(j+step-size-size2,step*6-size2+step-size,size,size);
        rect(j+step-size-size2,step*6+size2,size,size);
      }
      if(j % 2 == 1){
        fill(0);
        rect(j+step-size-size2,step*6-size2+step-size,size,size);
        rect(j+step-size-size2,step*6+size2,size,size);
      }
    }
    for(int j = step*7; j < width; j += step){
      if(j % 2 == 0){
        fill(255);
        rect(j+size2,step*6-size2+step-size,size,size);
        rect(j+size2,step*6+size2,size,size);
      }
      if(j % 2 == 1){
        fill(0);
        rect(j+size2,step*6-size2+step-size,size,size);
        rect(j+size2,step*6+size2,size,size);
      }
    }
  }
}
/*
Ilusión: Círculos Titchener 
Author: Hermann Ebbinghaus, 1897
Implementado desde cero
Etiquetas: ilusión psicológica*/
float angle;
void Circulos_Titchener(){
  noStroke();
  fill(255,0,255);
  ellipse(height/4,width/2,50,50);
  ellipse(3*width/4-50,height/2,50,50);
  
  if(active){
    pushMatrix();
    fill(255,0,255);
    translate(height/4,width/2);
    ellipse(0,0,50,50);
    fill(255,255,0);
    float x=50*cos(radians(angle));
    float y=50*sin(radians(angle));
    ellipse(x, y, 35, 35);
    
    float x4=50*cos(radians(angle+45));
    float y4=50*sin(radians(angle+45));
    ellipse(x4, y4, 35, 35);
    //
   
    float x1=50*cos(radians(angle+90));
    float y1=50*sin(radians(angle+90));
    ellipse(x1, y1, 35, 35);
    //
    
    float x5=50*cos(radians(angle+135));
    float y5=50*sin(radians(angle+135));
    ellipse(x5, y5, 35, 35);
    
  
    float x2=50*cos(radians(angle+180));
    float y2=50*sin(radians(angle+180));
    ellipse(x2, y2, 35, 35);
    //
    float x6=50*cos(radians(angle+225));
    float y6=50*sin(radians(angle+225));
    ellipse(x6, y6, 35, 35);
    
  
    float x3=50*cos(radians(angle+270));
    float y3=50*sin(radians(angle+270));
    ellipse(x3, y3, 35, 35);
    
    float x7=50*cos(radians(angle+315));
    float y7=50*sin(radians(angle+315));
    ellipse(x7, y7, 35, 35);
    //
    popMatrix();
    
    pushMatrix();
    
    translate(3*width/4-50,height/2);
    fill(255,0,255);
    ellipse(0,0,50,50);
    fill(255,255,0);
    float a=150*cos(radians(angle));
    float b=150*sin(radians(angle));
    ellipse(a, b, 145, 145);
    
    float a4=150*cos(radians(angle+60));
    float b4=150*sin(radians(angle+60));
    ellipse(a4, b4, 145, 145);
    //
   
    float a1=150*cos(radians(angle+120));
    float b1=150*sin(radians(angle+120));
    ellipse(a1, b1, 145, 145);
    //
    
    float a5=150*cos(radians(angle+180));
    float b5=150*sin(radians(angle+180));
    ellipse(a5, b5, 145, 145);
    
  
    float a2=150*cos(radians(angle+240));
    float b2=150*sin(radians(angle+240));
    ellipse(a2, b2, 145,145);
    //
    float a6=150*cos(radians(angle+300));
    float b6=150*sin(radians(angle+300));
    ellipse(a6, b6, 145,145);
    
  
    float a3=150*cos(radians(angle+360));
    float b3=150*sin(radians(angle+360));
    ellipse(a3, b3, 145, 145);
    
   

    popMatrix();
  }
}
/*
Adaptado: https://www.openprocessing.org/sketch/136072
Etiquetas: ilusión psicológica
*/
   
void animate(int i,int j, float hh, float ww, float n2, float r, int p) {
  pushMatrix();
  translate(i*ww+r, j*hh+r);
  rotate((frameCount/10)*(abs(n2-i)+abs(n2-j)));
  polygon(0, 0, r, p);  
  popMatrix();
}
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
  
void Triangles(){
  int n = 20;
  float n2 = n/2;
  int p = 3;
  float r = width/(2*n);
  float ww = width/n;
  float hh = height/n;
  if (active) {
  background(0);
  for (int i=0;i<n;i++) {
     for (int j=0;j<n;j++) {
      animate(i,j,hh,ww,n2,r,p);
     }
  }
 }  
}
/*
Ilusión: Mechanic Waves
Adaptado:https://www.openprocessing.org/sketch/432063
Etiquetas: ilusión psicológica
*/
float animation = 10.0f;
float circleSize = 80.0f;
int col = 1;
boolean drawCirlces = true;
boolean drawDots = true;
void Mechanic_Waves(){  
  size(800, 800);
  noFill();
  colorMode(RGB, 1);
  animation += 0.1f;

  background(abs(col -1));

  for (int x = 0; x < (width/circleSize*2.0) + 1; x++) {
    for (int y = 0; y < height/circleSize*2.0 + 1; y++) {

      pushMatrix();

      translate(x * circleSize/2, y * circleSize/2);
      if (!active) {
        noFill();
        stroke(col);
        ellipse(0, 0, circleSize/2, circleSize/2);
      }

      rotate((x/circleSize * TWO_PI * 4) + animation + (y/circleSize * circleSize));

      translate(circleSize/4.0, 0);

      if (drawDots) {
        fill(col);
        ellipse(0, 0, circleSize/8, circleSize/8);
      }
      
      popMatrix();
    }
  }

}