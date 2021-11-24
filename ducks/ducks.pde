import java.util.Arrays;

Duck[] ducks = new Duck[0];
boolean running = true;
int count;

void setup() {
  frameRate(60);
  size(600,400);
  
  noStroke();
  background(255,201,34);
  fill(56,175,205,225);
  rect(0,175,width,225);
  fill(56,175,205,255);
  rect(0,175,width,20);
  
  fill(255);
  textAlign(CENTER);
  textSize(50);
  text("The Duck River", width/2, 100);
}

void draw() {
  brc();
  
  String name = brcChanged();
  
  if (name.equals("Clear the ducks")) {
    clearDucks();
  }
  
  if (brcValue("Pause the ducks").equals("true")) {
    running = false;
  } else {
    running = true;
  }
  if (running == false) return;
  
  for (int i = 0; i < ducks.length; i++) {
    if ((pow(mouseX - ducks[i].xPos, 2)/100.0 + pow(mouseY - ducks[i].yPos, 2)/64.0 <= 1.0) && mousePressed) {
      ducks[i].disappear = true;
      count -= 1;
    }
  }
  
  background(200);
  setup();

  if (name.equals("Add a duck")) {
    ducks = Arrays.copyOf(ducks, ducks.length+1);
    ducks[ducks.length-1] = new Duck(0, int(random(200,351)), 25); 
  }
  
  if (brcValue("Lots of ducks").equals("true")) {
    if (frameCount % 10 == 0) {
      ducks = Arrays.copyOf(ducks, ducks.length+1);
      ducks[ducks.length-1] = new Duck(0, int(random(200,351)), 25);  
    }  
  }
  
  if (brcValue("curve").equals("s")) {
    for (int i = 0; i < ducks.length; i++) {
      ducks[i].swimSine();
      ducks[i].inScreen();
    }
  }
  
  if (brcValue("curve").equals("t")) {
    for (int i = 0; i < ducks.length; i++) {
      ducks[i].swimTangent();
      ducks[i].inScreen();
    }
  }
   
  if (brcValue("curve").equals("l")) {
    for (int i = 0; i < ducks.length; i++) {
      ducks[i].swimLoop();
      ducks[i].inScreen();
    }
  }
  
  for (int i = 0; i < ducks.length; i++) {
    if (ducks[i].visible && !ducks[i].disappear) {
      count += 1;
    }
  }
  
  brcSetMonitor("count", count);
  
  count = 0;
}

void clearDucks() {
  ducks = new Duck[0];
  setup();
}
