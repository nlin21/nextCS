int SelectionSort(int[] data) {
  int ncomps, min_pos, temp;
  ncomps = 0;
  min_pos = 0;
  
  for (int i = 0; i < data.length-1; i++) {
    min_pos = i;
    for (int j = i+1; j < data.length; j++) {
      if (data[j] <= data[min_pos]) {
        min_pos = j;
      }
      ncomps++;
    }
    if (min_pos != i) {
      temp = data[min_pos];
      data[min_pos] = data[i];
      data[i] = temp;
      WriteSwap(min_pos, i, true);
    } else {
      WriteSwap(min_pos, i, false);
    }
    ncomps++;
  }
 
  return ncomps;
}
