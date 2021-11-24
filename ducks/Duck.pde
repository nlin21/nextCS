class Duck {
  
  int xPos;
  int yPos;
  int radius;
  
  int degrees;
  boolean disappear = false;
  boolean visible;

  Duck(int x, int y, int r) {
    xPos = x;
    yPos = y;
    radius = r;
  }
  
  void inScreen() {
    if (xPos >= 0 && xPos <= width) {
      visible = true;
    } else {
      visible = false;
    }
  }

  void swimSine() { 
    if (disappear == false) {
      stroke(0);
    
      // body
      fill(255,255,17);
      ellipse(xPos, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos), 20, 16);
    
      // beak
      fill(248,215,154);
      rect(xPos + 5, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos) - 9, 10, 2); 
 
      // head
      fill(255,255,17);
      ellipse(xPos + 5, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos) - 7, 15, 15);
   
      xPos += 1;
    }
  }
  
  void swimTangent() {
    if (disappear == false) {
      stroke(0);
    
      // body
      fill(255,255,17);
      ellipse(xPos, yPos + int(brcValue("amplitude"))*tan((2*PI)/int(brcValue("period"))*xPos), 20, 16);
    
      // beak
      fill(248,215,154);
      rect(xPos + 5, yPos + int(brcValue("amplitude"))*tan((2*PI)/int(brcValue("period"))*xPos) - 9, 10, 2); 
 
      // head
      fill(255,255,17);
      ellipse(xPos + 5, yPos + int(brcValue("amplitude"))*tan((2*PI)/int(brcValue("period"))*xPos) - 7, 15, 15);
   
      xPos += 1;
    }
  }
  
  void swimLoop() {
    if (disappear == false) {
      stroke(0);
    
      // body
      fill(255,255,17);
      ellipse(xPos + 15*cos(radians(degrees)), yPos + 15*sin(radians(degrees)), 20, 15);

      // beak
      fill(248,215,154);
      rect(xPos + 15*cos(radians(degrees)) + 5, yPos + 15*sin(radians(degrees)) - 9, 10, 2);
    
      // head
      fill(255,255,17);
      ellipse(xPos + 15*cos(radians(degrees)) + 5, yPos + 15*sin(radians(degrees)) - 7, 15, 15);
  
      degrees += 5;
      xPos += 1;
    }
  }  

}
