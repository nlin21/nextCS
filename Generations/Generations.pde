int POP_COLS = 6;
int POP_ROWS = 5;
int OFFSET = 1;
int POP_SIZE = POP_COLS * POP_ROWS;
int GRID_SIZE = int(pow(2, Individual.SIZE_GENE_LENGTH+1) - 1);
int GENERATION = 1;

Population pop;

void settings() {
    size(POP_COLS*GRID_SIZE + (POP_COLS-1)*OFFSET,
         POP_ROWS*GRID_SIZE + (POP_ROWS-1)*OFFSET);
}//settings
    
void setup() {
  pop = new Population(POP_SIZE);
  makePopulation();
}//setup

void draw() {
  background(255);
  pop.drawPopGrid(POP_COLS, POP_ROWS, GRID_SIZE, OFFSET, true);
  drawGrid();
  pop.drawHighlight(0, color(255,0,0));
  pop.drawHighlight(pop.getBestIndex(), color(0,255,100));
}//draw

void keyPressed() {
  if (key == 'p') {
    makePopulation();
    GENERATION = 1;
  }  
  if (key == 'm') {
    pop = pop.matingSeason();
    pop.setFitness(pop.get(0));
    println("Generation " + GENERATION);
    println("Best fitness: " + pop.getBestFitness());
    println("Avg fitness: " + pop.getAvgFitness() + "\n");
    GENERATION++;
  }
}//keypressed

void makePopulation() {
  pop = new Population(POP_SIZE);
  pop.randomPop();
  pop.setFitness(pop.get(0));
  println("Total fitness: ", pop.totalFitness);
}//makepopulation()


void drawGrid() {
  stroke(0);
  for (int i = 1; i < POP_COLS; i++) {
    int x = i * (GRID_SIZE + OFFSET);
    line(x, 0, x, height-1);
  }//row dividers
  
  for (int i = 1; i < POP_ROWS; i++) {
    int y = i * (GRID_SIZE + OFFSET);
    line(0, y, width-1, y);
  }//column dividers
}//drawgrid
    
