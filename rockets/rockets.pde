int NUM_MOVES = 250;
int moveCount;
//Rocket r;

int GENERATION = 1;

boolean FNS = false;
boolean PRT = false;

boolean AUTO = true;
int DELAY_TIME = 2;

int POP_SIZE = 25;
Population pop;

void setup() {
  size(500, 500);
  //r = new Rocket(new PVector(250, 250), NUM_MOVES);
  //r.randomMoves();
  moveCount = 0;
  
  pop = new Population(POP_SIZE);
  pop.randomPop();
}

void draw() {
  background(255);
  pop.drawTarget();
  if (moveCount < NUM_MOVES) {
    //r.run();
    //r.display();
    for (int i = 0; i < POP_SIZE; i++) {
      pop.get(i).display();
    }
    moveCount++;
  }
  else {
    //r.display();
    if (FNS == false) {
      pop.setFitness();
      FNS = true;
      frameCount = 0;
    }
    for (int i = 0; i < POP_SIZE; i++) {
      pop.get(i).display();
    }
    if (PRT == false) {
      println("Generation " + GENERATION);
      println("Best fitness: " + pop.getHighestFitness());
      println("Avg fitness: " + pop.getAverageFitness() + "\n");
      GENERATION++;
      PRT = true;
    }
    if (AUTO && FNS) {
      if (frameCount < frameRate * DELAY_TIME) {
        return;
      }
      FNS = false;
      PRT = false;
      pop = pop.matingSeason();
      moveCount = 0;
    }
  }
}

void keyPressed() {
  if (key == 'p') {
    FNS = false;
    makePopulation();
    moveCount = 0;
    GENERATION = 1;
  }
  if (key == 'm') {
    FNS = false;
    pop = pop.matingSeason();
    moveCount = 0;
    println("Generation " + GENERATION);
    println("Best fitness: " + pop.getHighestFitness());
    println("Avg fitness: " + pop.getAverageFitness() + "\n");
    GENERATION++;
  }
}

void makePopulation() {
  pop = new Population(POP_SIZE);
}
