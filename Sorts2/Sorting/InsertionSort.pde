int InsertionSort(int[] data) {
  int ncomps, temp;
  ncomps = 0;

  for (int i = 0; i < data.length-1; i++) {
    if (data[i+1] < data[i]) {
      temp = data[i+1];
      WriteMove(i+1, data.length+1);
      ncomps++;
      if (temp < data[0]) {
        for (int j = i; j >= 0; j--) {
          data[j+1] = data[j];
          WriteMove(j, j+1);
          ncomps++;
        }
        data[0] = temp;
        WriteMove(data.length+1, 0);
        ncomps++;
      } else {
        for (int j = i; j>= 0; j--) {
          data[j+1] = data[j];
          WriteMove(j, j+1);
          ncomps++;
          if (temp >= data[j-1] && temp <= data[j+1]) {
            data[j] = temp;
            WriteMove(data.length+1, j);
            ncomps++;
            break;
          }
        }
      }
    }
  }

  return ncomps;
}

    
