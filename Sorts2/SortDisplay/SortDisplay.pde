// SortDisplay
boolean HaveData = false;
String Filename = "";
Display D;

int[] Data;
int[] DataBackup;
Action[] Actions;
int NumActions;
int ActionIndex = 0;
boolean Going = false;
int HoldingPos;

color Background = color(150);
color CFrom = color(100,255,100);
color CTo = color(255,100,100);
color CNormal = color(255);
color CNothing = Background;
color CHoldingColor = color(0,0,180);

int SwapState0 = 0;
int SwapState1 = 1;  // just colored
int SwapState2 = 2;  // swapped
int SwapState3 = 3;  // back to normal
int SwapState = SwapState0;

int ActionSwap = 0;
int ActionMove = 1;

void setup() {
  size(700,500);
  background(Background);
  
  //brcShowMessages(true);
}

void draw() {
  brc();
  
  String name = brcChanged();
  if (name.equals("Filename")) Filename = brcValue(name);
  
  if (name.equals("ReadFile")) {
    if (Filename == "")
      println("No filename!");
    else {
      String result = GetData(Filename);
      if (result.length() > 0)
        println(result);
    }
    D = new Display(Data);
    D.displayAll();
    HaveData = true;
    SwapState = SwapState0;
  }
  
  if (name.equals("frame-rate"))
    frameRate(int(brcValue(name)));
    
  if (name.equals("Restart")) {
    Going = false;
    ActionIndex = 0;
    for(int i = 0; i < Data.length; ++i)
      Data[i] = DataBackup[i];
    D.displayAll();
  }
  
  if (SwapState != SwapState0)   // are we swapping?
    Go_once();
    
  if (name.equals("Go-once"))
    Go_once();
    
  if (name.equals("Restart")) {
    if (HaveData) ActionIndex = 0;
  }
  
  
  if (name.equals("Go-start"))
    Going = true;
  if (name.equals("Go-stop"))
    Going = false;
    
  if (Going)
    Go_once();
    
}

void Go_once() {
  color c;
  if (!HaveData) return;
  if (ActionIndex >= NumActions) {
    Going = false;
    return;
  }
  if (Actions[ActionIndex].type == ActionMove) {
    Data[Actions[ActionIndex].to] = Data[Actions[ActionIndex].from];
    Data[Actions[ActionIndex].from] = 0;
    D.displayOne(Actions[ActionIndex].from,CNothing);
    if (Actions[ActionIndex].to == HoldingPos)
      c = CHoldingColor;
    else
      c = CNormal;
    D.displayOne(Actions[ActionIndex].to,c);
    println(Actions[ActionIndex].from,Actions[ActionIndex].to);
    ActionIndex++;
  }
  else {
    if (SwapState == SwapState0) {
      if (!Actions[ActionIndex].swap) {
        D.displayOne(Actions[ActionIndex].from,CFrom);
        D.displayOne(Actions[ActionIndex].to,CFrom);
        SwapState = SwapState2;
        return;
      }
      D.displayOne(Actions[ActionIndex].from,CFrom);
      D.displayOne(Actions[ActionIndex].to,CTo);
      SwapState = SwapState1;
      return;
    }
    if (SwapState == SwapState1) {
      int temp = Data[Actions[ActionIndex].to];
      Data[Actions[ActionIndex].to] = Data[Actions[ActionIndex].from];
      Data[Actions[ActionIndex].from] = temp;
      D.displayOne(Actions[ActionIndex].to,CFrom);
      D.displayOne(Actions[ActionIndex].from,CTo);
      SwapState = SwapState2;
      return;
    }
    if (SwapState == SwapState2) {
      D.displayOne(Actions[ActionIndex].from,CNormal);
      D.displayOne(Actions[ActionIndex].to,CNormal);
      SwapState = SwapState0;
      ActionIndex++;
    }
  }
  
}
String GetData(String filename) {
  int i, n = 0;
  int in_from, in_to, in_type;
  boolean in_swap;
  
  String[] lines = loadStrings(filename);
  if (lines == null)
    return "Filename not readable: "+filename;
  
  String[] sdata = split(lines[0]," ");
  if (sdata[0].equals("Elements")) {
    Data = new int[sdata.length+1];
    DataBackup = new int[sdata.length+1];
    for (i = 1; i < sdata.length; ++i) {
      Data[i-1] = int(sdata[i]);
      DataBackup[i-1] = Data[i-1];
    }
    Data[sdata.length-1] = 0;
    Data[sdata.length] = 0;
    DataBackup[sdata.length-1] = 0;
    DataBackup[sdata.length] = 0;
    
    HoldingPos = Data.length-1;
    println("Data.length",Data.length);
  }
  else 
    return "Bad data, first line should be Elements";
  
  Actions = new Action[lines.length-1];
  
  for (i = 1; i < lines.length; ++i) {
    String[] parts = split(lines[i], " ");
    if (parts.length == 4 && parts[0].equals("swap")) {
      in_from = int(parts[1]);
      in_to = int(parts[2]);
      in_swap = parts[3].equals("true");
      Actions[n] = new Action(in_from,in_to,ActionSwap,in_swap);
      ++n;
    }
    else if (parts.length == 3 && parts[0].equals("move")) {
      in_from = int(parts[1]);
      in_to = int(parts[2]);
      Actions[n] = new Action(in_from,in_to,ActionMove,false);
      ++n;
    }
  }
  
  NumActions = n;
  
  println("Data: ",Data.length);
  println("NumActions: ",NumActions);
  return "";
}
  
class Action {
  int from;
  int to;
  int type;  // 0 == swap, 1 == move
  boolean swap;
  
  Action(int in_from, int in_to, int in_type, boolean in_swap) {
    from = in_from;
    to = in_to;
    type = in_type;
    swap = in_swap;
  }
}
