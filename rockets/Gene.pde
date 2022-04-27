class Gene {
  int[] genotype; // bit array, g[0] is little end
  
  Gene(int gl) {
    genotype = new int[gl];
    
    for (int i = 0; i < genotype.length; i++) {
      genotype[i] = int(random(2));
    }
  }
  
  Gene(Gene copyFrom) {
    //genotype = otherG.genotype //BAD WONT WORK!
    genotype = new int[copyFrom.genotype.length];
    arrayCopy(copyFrom.genotype, genotype);
  }
  
  int getValue() {
    // bit array: g[0] is little end
    int v = 0;
    int placeval = 1;
    for(int i = 0; i < genotype.length ; i++) {
      v += genotype[i] * placeval;
      placeval *= 2;
    }
    return v;
  }
  
  void mutate() {
    int rand_i = int(random(genotype.length));
    genotype[rand_i] = 1 - genotype[rand_i];
  }
  
  String toString() {
    //Prints bigendian
    String s = "BE->";
    //Put together binary string
    //Start with big end
    for (int i = genotype.length - 1; i >= 0; i--) {
      s += genotype[i];
    }
    s += " " + getValue();
    return s;
  }
}
