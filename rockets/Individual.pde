class Individual {
  
  int MAGNITUDES_GENE_LENGTH = 8;
  int ANGLES_GENE_LENGTH = 8;
  
  Gene[] magnitudes;
  Gene[] angles;
  
  Rocket rocket;
  
  float fitness;
  
  Individual() {
    magnitudes = new Gene[NUM_MOVES];
    angles = new Gene[NUM_MOVES];
    for (int i = 0; i < NUM_MOVES; i++) {
      magnitudes[i] = new Gene(MAGNITUDES_GENE_LENGTH);
      angles[i] = new Gene(ANGLES_GENE_LENGTH);
    }
    setMoves();
  }
  
  void setMoves() {
    PVector[] as = new PVector[NUM_MOVES];
    float[] ms = new float[NUM_MOVES];
    for (int i = 0; i < as.length; i++) {
      float theta = (float(angles[i].getValue())/pow(2,ANGLES_GENE_LENGTH)) * TWO_PI;
      as[i] = new PVector(cos(theta), sin(theta));
      ms[i] = (float(magnitudes[i].getValue())/pow(2,MAGNITUDES_GENE_LENGTH)) * .1;
    }
    rocket = new Rocket(as, ms, NUM_MOVES);
  }
  
  Individual mate(Individual partner) {
    Individual child = new Individual();
    for (int i = 0; i < NUM_MOVES; i++) {
      if (int(random(2)) == 0) {
        child.magnitudes[i] = magnitudes[i];
        child.angles[i] = angles[i];
      } else {
        child.magnitudes[i] = partner.magnitudes[i];
        child.angles[i] = partner.angles[i];
      }
    }
    return child;
  }
  
  void display() {
    if (moveCount < NUM_MOVES) {
      rocket.run();
      rocket.display();
    } else {
      rocket.display();
      showFitness();
    }
  }
  
  void setFitness() {
    fitness = 1 - dist(rocket.position.x, rocket.position.y, width/2, 20) / 700;
  }
  
  void showFitness() {
    textSize(15);
    fill(0);
    textAlign(CENTER);
    text(fitness, rocket.position.x, rocket.position.y);
  }

}
