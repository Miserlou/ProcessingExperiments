//XXX: TODO - change the brush to a shape
// http://processing.org/reference/beginShape_.html

int lastX=0;
int lastY=0;
PImage brush;

void setup() {
  size(1400, 800);
  smooth();
  brush = loadImage("calig64.png");
  background(255,255,255);
}

void draw() {
  if (mousePressed) {

    double dx = abs(mouseX - lastX);
    double dy = abs(mouseY - lastY);
    double steps;
    
    if((lastX==0)&&(lastY==0)){
      lastX = mouseX;
      lastY = mouseY;
      return;
    }
                    
    if((dx==0)&&(dy==0)){
      lastX = mouseX;
      lastY = mouseY;
      return;
    }
                    
    if(dx>dy) {
      steps = dx;
    }
    else {
      steps = dy;
    }
                    
    double dStepX = dx / steps;
    double dStepY = dy / steps;
                    
    boolean up = true;
    boolean right = false;
    if(mouseX > lastX) {
      up = false;
    }
    if(mouseY > lastY) {
      right = true;
    }
                             
    int i = 0;
    for(i=0; i<=steps; i++) {
      if((mouseX >= lastX) && (mouseY >= lastY) ) {
        image(brush, (int)(lastX + (i * dStepX)) - 32, (int)(lastY + (i * dStepY)) - 32);
    }
      if((mouseX >= lastX) && (mouseY < lastY) ) {
        image(brush, (int)(lastX + (i * dStepX)) - 32, (int)(lastY - (i * dStepY)) - 32);
      }
      if((mouseX < lastX) && (mouseY >= lastY) ) {
        image(brush, (int)(lastX - (i * dStepX)) - 32, (int)(lastY + (i * dStepY)) - 32);
      }
      if((mouseX < lastX) && (mouseY < lastY) ) {
        image(brush, (int)(lastX - (i * dStepX)) - 32, (int)(lastY - (i * dStepY)) - 32);
      }
    }
  
    lastX = mouseX;
    lastY = mouseY;
    
    
}
}

void mouseReleased() {
  lastX = 0;
  lastY = 0;
}

void mousePressed() {
  if (mouseEvent.getClickCount()==2){
      background(255,255,255);
  }
}


