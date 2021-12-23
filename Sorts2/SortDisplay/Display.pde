class Display {
  int max;
  float gap;
  float colwidth;
  float yscale;
  int[] data;
  int ndata;
  
  Display(int[] the_data) {
    data = the_data;
    ndata = the_data.length;
    //println("ndata",ndata);
    gap = float(width) / (3*ndata+7);
    colwidth = 2*gap;
    max = 0;
    for(int i = 0; i < ndata; ++i) {
      if (the_data[i] > max) {
        max = the_data[i];
        //println(i,the_data[i]);
      }
    }
    yscale = 0.9 * height / max;
    println("max",max,"colwidth",colwidth);
  }
  
  void displayAll() {
    background(150);
    for (int i = 0; i < ndata; ++i)
      this.displayOne(i,CNormal);
}

  void displayOne(int index,color c) {
    float x, y;
    x = gap+index*(gap+colwidth);
    noStroke();
    fill(color(150));
    rect(x-1,0,colwidth+2,height);
    stroke(0);
    fill(c);
    y = height - data[index]*yscale;
    rect(x,y,colwidth,data[index]*yscale);
    //println(index,x,data[index]);
  }
}

    
