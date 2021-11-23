import java.util.Arrays;

Duck[] ducks = new Duck[0];
boolean running = true;

void setup() {
  frameRate(60);
  size(600,400);
   
  noStroke();
  background(126,200,80);
  fill(56,175,205);
  rect(0,175,600,200);
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
    }
  }
  
  if (brcValue("curve").equals("t")) {
    for (int i = 0; i < ducks.length; i++) {
      ducks[i].swimTangent();
    }
  }
   
}

void clearDucks() {
  ducks = new Duck[0];
  setup();
}
