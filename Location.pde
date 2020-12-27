class Location {
  
  int row;
  int col;
  
  Location(int row, int col) {
    this.row = row;
    this.col = col;
  }
  
  int getXValue() {
    return col * SCALE;
  }
  
  int getYValue() {
    return row * SCALE;
  }
  
}
