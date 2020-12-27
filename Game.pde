class Game {
  
  Tile[][] tiles;
  
  Game(int[][] board) {
    tiles = new Tile[9][9];
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        tiles[row][col] = new Tile(
          new Location(row, col),
          board[row][col],
          false
        );
      }
    }
  }
  
  void show() {
    // Show tiles
    for (Tile[] row : tiles) {
      for (Tile tile : row) {
        tile.show();
      }
    }
    
    // Show thick lines
    strokeWeight(3);
    line(3 * SCALE, 0, 3 * SCALE, height);
    line(6 * SCALE, 0, 6 * SCALE, height);
    line(0, 3 * SCALE, width, 3 * SCALE);
    line(0, 6 * SCALE, width, 6 * SCALE);
    strokeWeight(1);
  }
  
}
