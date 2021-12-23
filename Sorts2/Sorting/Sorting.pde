// Sorts
PrintWriter output;

// Default values
String Filename = "";
boolean ToSortDisplay = true;
String SortType = "B";
String Config = "R";
int N = 0;
int[] Elements;
int Ncomps = 0;

void setup() {
  size(200,200);
  brcShowMessages(true);
}

void draw() {
  brc();
  
  String name = brcChanged();
  if (name.equals("filename"))
    Filename = brcValue(name);
  if (name.equals("dir"))
    ToSortDisplay = brcValue(name).equals("true");
  if (name.equals("types"))
    SortType = brcValue(name);
  if (name.equals("config"))
    Config = brcValue(name);
  if (name.equals("n"))
     N = int(brcValue(name));
     
  if (name.equals("DoIt")) {
    if (N > 0 && Filename.length() > 0)
      DoIt();
  }
}

void DoIt() {
  int i;
  CreateElements();
  
  // create the output file
  if (ToSortDisplay)
    output = createWriter("../SortDisplay/data/"+Filename);
  else
    output = createWriter(Filename);
  
  // write out the Elements
  String els = "Elements ";
  for (i = 0; i < N; ++i)
    els += str(Elements[i])+" ";
  output.println(els.trim());
  
  if (SortType.equals("B"))
    Ncomps = BubbleSort(Elements);
  if (SortType.equals("I"))
    Ncomps = InsertionSort(Elements);
  if (SortType.equals("S"))
    Ncomps = SelectionSort(Elements);
    
  output.flush();
  output.close();
  
  brcSetMonitor("comps",Ncomps);
  
  println("Done");
}

void CreateElements() {
  int i;
  Elements = new int[N];
  if (Config.equals("R")) {
    for (i = 0; i < N; ++i)
      Elements[i] = int(random(N/4,N));
  }
  else if (Config.equals("S")) {
    for (i = 0; i < N; ++i)
      Elements[i] = (N+i)/2;
  }
  else if (Config.equals("V")) {
    for (i = 0; i < N; ++i)
      Elements[i] = (2*N-i)/2;
  }
}

void WriteSwap(int first, int second, boolean swapped) {
  if (swapped)
    output.println("swap "+str(first)+" "+str(second)+" true");
  else
    output.println("swap "+str(first)+" "+str(second)+" false");
}

  void WriteMove(int first, int second) {
    output.println("move "+str(first)+" "+str(second));
  }
  
    
