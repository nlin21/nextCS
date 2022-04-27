class Population {

  Individual[] pop;
  float totalFitness, highestFitness;

  Population(int popSize) {
    pop = new Individual[popSize];
    randomPop();
  }

  void randomPop() {
    for (int i = 0; i < pop.length; i++) {
      pop[i] = new Individual();
    }
  }

  void drawTarget() {
    fill(255, 215, 0);
    rect(width/2, 20, 10, 10);
  }

  Individual get(int index) {
    return pop[index];
  }

  void setFitness() {
    for (int i = 0; i < pop.length; i++) {
      pop[i].setFitness();
      totalFitness += pop[i].fitness;
    }
  }

  int getBestIndex() {
    int n = 0;
    float f = pop[0].fitness;
    for (int i = 1; i < pop.length; i++) {
      if (pop[i].fitness > f) {
        f = pop[i].fitness;
        n = i;
      }
    }
    return n;
  }

  float getHighestFitness() {
    float f = pop[0].fitness;
    for (int i = 1; i < pop.length; i++) {
      if (pop[i].fitness > f) {
        f = pop[i].fitness;
      }
    }
    return f;
  }
  
  float getAverageFitness() {
    float f = 0.;
    for (int i = 0; i < pop.length; i++) {
      f += pop[i].fitness;
    }
    return f / pop.length;
  }

  Individual select() {
    float r = random(0, totalFitness);
    float runningFitness = 0.;
    for (int i = 0; i < pop.length; i++) {
      runningFitness += pop[i].fitness;
      if (r < runningFitness) {
        return pop[i];
      }
    }
    return null;
  }

  Population matingSeason() {
    Population newPop = new Population(pop.length);
    arrayCopy(pop, getBestIndex(), newPop.pop, 0, 1);
    newPop.pop[0].rocket.reset();
    for (int i = 1; i < newPop.pop.length; i++) {
      Individual child = new Individual();
      child = select().mate(select());
      child.setMoves();
      newPop.pop[i] = child;
    }
    return newPop;
  }
}
