class Population {

  Individual[] pop;
  float totalFitness;
  float highestFitness;
  float mutationRate;
  
  Population(int popSize) {
    pop = new Individual[popSize];
    mutationRate = 0.01;
  }

  void randomPop() {
    for (int i = 0; i < pop.length; i++) {
      pop[i] = new Individual(true);
    }
  }
  
  void drawPopGrid(int cols, int rows, int gridSize, int offset, boolean showFitness) {
    stroke(0);
    for (int i = 1; i < cols; i++) {
      int x = i * (gridSize + offset);
      line(x, 0, x, height-1);
    }
    for (int i = 1; i < rows; i++) {
      int y = i * (gridSize + offset);
      line(0, y, width-1, y);
    }
    for (int i = 0; i < pop.length; i++) {
      pop[i].display(gridSize*(i%cols) + int(0.5*gridSize) + offset*(i%cols), gridSize*(floor(i/cols)) + int(0.5*gridSize) + offset*(floor(i/cols)), showFitness);
    }
  }
  
  Individual get(int index) {
    return pop[index];
  }
  
  void setFitness(Individual target) {
    for (int i = 1; i < pop.length; i++) {
      pop[i].setFitness(target);
      totalFitness += pop[i].fitness;
    }
    pop[0].fitness = 1;
  }
  
  Individual select() {
    float r = random(0, totalFitness);
    float runningFitness = 0.0;
    for (int i = 1; i < pop.length; i++) {
      runningFitness += pop[i].fitness;
      if (r < runningFitness) {
        return pop[i-1];
      }
    }
    return null;
  }
  
  Population matingSeason() {
    Population newPop = new Population(pop.length);
    arrayCopy(pop, 0, newPop.pop, 0, 1);
    for (int i = 1; i < newPop.pop.length; i++) {
      Individual child = new Individual(false);
      child = select().mate(select());
      child.mutate(mutationRate);
      child.setPhenotype();
      newPop.pop[i] = child;
      //newPop.pop[i] = this.select().mate(this.select());
      //newPop.pop[i].mutate(mutationRate);
      //newPop.pop[i].setPhenotype();
    }
    return newPop;
  }
  
  int getBestIndex() {
    int n = 1;
    float f = pop[1].fitness;
    for (int i = 2; i < pop.length; i++) {
      if (pop[i].fitness > f) {
        f = pop[i].fitness;
        n = i;
      }
    }
    return n;
  }
  
  float getBestFitness() {
    float f = pop[1].fitness;
    for (int i = 2; i < pop.length; i++) {
      if (pop[i].fitness > f) {
        f = pop[i].fitness;
      }
    }
    return f;
  }
  
  float getAvgFitness() {
    return totalFitness/pop.length;
  }
  
  void drawHighlight(int index, color c) {
    noFill();
    strokeWeight(5);
    stroke(c);
    rect(GRID_SIZE*(index%POP_COLS) + OFFSET*(index%POP_COLS), GRID_SIZE*(floor(index/POP_COLS)) + OFFSET*(floor(index/POP_COLS)), GRID_SIZE, GRID_SIZE);
    stroke(255);
    strokeWeight(1);
  }
  
}
