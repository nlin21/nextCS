class Duck {
  
  int xPos;
  int yPos;
  int radius;
  
  Duck(int x, int y, int r) {
    xPos = x;
    yPos = y;
    radius = r;
  }
 
  void swimSine() {
    stroke(0);
    
    // body
    fill(255,255,17);
    ellipse(xPos, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos), 20, 15);
    
    // beak
    fill(248,215,154);
    rect(xPos + 5, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos) - 9, 10, 2); 
 
    // head
    fill(255,255,17);
    ellipse(xPos + 5, yPos + int(brcValue("amplitude")) * sin((2*PI)/int(brcValue("period"))*xPos) - 7, 15, 15);
   
    xPos += 1;
  }
  
  void swimTangent() {
    stroke(0);
    
    // body
    fill(255,255,17);
    ellipse(xPos, yPos + int(brcValue("amplitude"))*tan(xPos), 20, 15);
    
    // beak
    fill(248,215,154);
    rect(xPos + 5, yPos + int(brcValue("amplitude"))*tan(xPos) - 9, 10, 2); 
 
    // head
    fill(255,255,17);
    ellipse(xPos + 5, yPos + int(brcValue("amplitude"))*tan(xPos) - 7, 15, 15);
   
    xPos += 1;
  }
  

}
