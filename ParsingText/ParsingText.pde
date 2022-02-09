String test = "data/test1.txt";
String hw = "http://bert.stuy.edu/pbrooks/fall2021/materials/nextcs-1/flexarray/travel.txt";

String[] lines = loadStrings(hw);
String answer = "";
  
for (int i = 0; i < lines.length; i++) {
  for (int j = 0; j < lines.length; j++) {
    String[] parts = split(lines[j]," ");
    
    if (parts[0].equals(str(i))) {
      if (parts[1].equals("{NL}")) {
        answer = answer + "\n";
        break;
      } else {
        answer = answer + " " + parts[1];
        break;
      }
    }
  }
}

println(answer);
