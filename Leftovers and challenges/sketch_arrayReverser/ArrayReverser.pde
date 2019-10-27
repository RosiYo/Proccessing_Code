class ArrayReverser{
  public int[] valuesToReverse;
  
  public ArrayReverser(){}
  
  public void setArrayValues(int[] valuesToReverse){
    this.valuesToReverse = valuesToReverse;
    
    for(int i = 0; i <= valuesToReverse.length - 1; i++){
      System.out.println(valuesToReverse[i]);
    }
  }
  
  public int[] getArrayValues(){
    int[] valuesReversed = reverseValues(this.valuesToReverse);
    return valuesReversed;
  }
  
  private int[] reverseValues(int[] valuesToReverse){
    int[] storageArray = new int[valuesToReverse.length];
    int arrayIndex = valuesToReverse.length - 1;
    
    for(int i = 0; i <= arrayIndex; i++){
      storageArray[i] = valuesToReverse[arrayIndex - i];
    }
    
    return storageArray;
  }
}
