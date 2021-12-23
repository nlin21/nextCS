int BubbleSort(int[] data) {
  int i, j, ncomps, temp;
  boolean Morework;
  ncomps = 0;
  
  for (i = data.length-1; i >= 1; --i) {
    Morework = false;
    for (j = 0; j < i; ++j) {
      if (data[j] > data[j+1]) {
        temp = data[j];
        data[j] = data[j+1];
        data[j+1] = temp;
        WriteSwap(j, j+1, true);
        Morework = true;
      }
      else
        WriteSwap(j,j+1,false);
      ncomps++;
    }
    if (!Morework)
      break;
  }
  return ncomps;
}
