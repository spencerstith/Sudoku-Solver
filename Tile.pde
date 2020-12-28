class Tile {
  
  Location location;
  int value;
  boolean immutable;
  color highlight;
  
  Tile(Location location, int value, boolean immutable) {
    this.location = location;
    this.value = value;
    this.immutable = immutable;
    this.highlight = color(255, 255, 255, 0);
  }
  
  void setHighlight(color hightlight) {
    this.highlight = hightlight;
  }
  
  int getValue() {
    return value;
  }
  
  void plusOne() {
    if (!immutable) {
      value = (value + 1) % 10;
    }
  }
  
  void setValue(int value) {
    this.value = value;
  }
  
  void show() {
    fill(highlight);    
    rect(location.getXValue(), location.getYValue(), SCALE, SCALE);
    if (immutable) {
      fill(BLUE);
    } else {
      fill(WHITE);
    }
    if (value != 0) {
      text(value, location.getXValue() + SCALE / 2, location.getYValue() + SCALE / 2);
    }
  }
  
}
