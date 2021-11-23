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
    ellipse(xPos, yPos + int(brcValue("amplitude"))*sin(xPos/10), 20, 15);
    
    // beak
    fill(248,215,154);
    rect(xPos + 5, yPos + int(brcValue("amplitude"))*sin(xPos/10) - 9, 10, 2); 
 
    // head
    fill(255,255,17);
    ellipse(xPos + 5, yPos + int(brcValue("amplitude"))*sin(xPos/10) - 7, 15, 15);
   
    xPos += 1;
  }
  

}
