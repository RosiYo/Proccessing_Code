ArrayReverser arrayReverser;

void setup(){
  arrayReverser = new ArrayReverser();
  arrayReverser.setArrayValues(createRandomizedArray(10, 100));
  
  for(int i = 0; i <= arrayReverser.getArrayValues().length - 1; i++){
    System.out.println(arrayReverser.getArrayValues()[i]);
  }
}

private int[] createRandomizedArray(int arrayLength, int maxLimit){
  int[] arrayRandomized = new int[arrayLength];
  
  for(int i = 0; i <= arrayRandomized.length - 1; i++){
    arrayRandomized[i] = floor(random(maxLimit));
  }
  
  return arrayRandomized;
}
