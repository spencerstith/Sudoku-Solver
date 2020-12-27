class Tile {
  
  Location location;
  int value;
  boolean immutable;
  
  Tile(Location location, int value, boolean immutable) {
    this.location = location;
    this.value = value;
    this.immutable = immutable;
  }
  
  void setValue(int value) {
    this.value = value;
  }
  
  void show() {
    noFill();
    rect(location.getXValue(), location.getYValue(), SCALE, SCALE);
    if (immutable) {
      fill(WHITE);
    } else {
      fill(BLUE);
    }
    if (value != 0) {
      text(value, location.getXValue() + SCALE / 2, location.getYValue() + SCALE / 2);
    }
  }
  
}
