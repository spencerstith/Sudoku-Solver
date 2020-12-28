class Game {

  Tile[][] tiles;
  Location current;

  Game(int[][] board) {
    tiles = new Tile[9][9];
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        int value = board[row][col];
        tiles[row][col] = new Tile(
          new Location(row, col), 
          value, 
          value != 0 ? true : false
          );
      }
    }
    this.current = new Location(0, 0);
  }
  
  Tile getTile(int row, int col) {
    return tiles[row][col];
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
  
  Location getNextLocation(Location current) {
    int col = current.getC() + 1;
    int row = current.getR();
    if (col >= 9) {
      col = 0;
      row++;
      if (row >= 9) {
        return new Location(-1, -1);
      }
    }
    return new Location(row, col);
  }

  void hardSolve(int[][] solution) {
    for (int row = 0; row < tiles.length; row++) {
      for (int col = 0; col < tiles.length; col++) {
        int value = solution[row][col];
        if (value != 0) {
          tiles[row][col].setValue(value);
        }
      }
    }
  }

  void changeValue(int row, int col) {
    tiles[row][col].plusOne();
  }

  boolean checkBoard() {
    // Find zeros
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (tiles[row][col].getValue() == 0) {
          return false;
        }
      }
    }

    // Rows
    for (int row = 0; row < 9; row++) {
      boolean[] discovered = new boolean[9];
      for (int col = 0; col < 9; col++) {
        int index = tiles[row][col].getValue() - 1;
        if (discovered[index]) {
          return false;
        }
        discovered[index] = true;
      }
      if (contains(discovered, false)) {
        return false;
      }
    }

    // Columns
    for (int col = 0; col < 9; col++) {
      boolean[] discovered = new boolean[9];
      for (int row = 0; row < 9; row++) {
        int index = tiles[col][row].getValue() - 1;
        if (discovered[index]) {
          return false;
        }
        discovered[index] = true;
      }
      if (contains(discovered, false)) {
        return false;
      }
    }

    // Squares
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        boolean[] discovered = new boolean[9];
        for (int m = 1; m <= 3; m++) {
          for (int n = 1; n <= 3; n++) {
            int index= tiles[i * 3 + m - 1][j * 3 + n - 1].getValue() - 1;
            if (discovered[index]) {
              return false;
            }
            discovered[index] = true;
          }
        }
        if (contains(discovered, false)) {
          return false;
        }
      }
    }

    return true;
  }

  boolean contains(boolean[] arr, boolean value) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == value) {
        return true;
      }
    }
    return false;
  }
}
