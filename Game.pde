class Game {

  Tile[][] tiles;

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

    // Highlight current cell
    tiles[current.getR()][current.getC()].setHighlight(HIGHLIGHT);

    // Show thick lines
    strokeWeight(3);
    line(3 * SCALE, 0, 3 * SCALE, height);
    line(6 * SCALE, 0, 6 * SCALE, height);
    line(0, 3 * SCALE, width, 3 * SCALE);
    line(0, 6 * SCALE, width, 6 * SCALE);
    strokeWeight(1);
  }

  void changeValue(int row, int col) {
    tiles[row][col].plusOne();
  }

  // ********************
  // Checkers
  // ********************

  // Checking driver
  boolean checkBoard() {
    return checkZeros() && checkRows() && checkColumns() && checkSquares();
  }
  
  // Zeros
  boolean checkZeros() {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        if (tiles[row][col].getValue() == 0) {
          return false;
        }
      }
    }
    return true;
  }

  // Rows
  boolean checkRows() {
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
    return true;
  }

  // Columns
  boolean checkColumns() {
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
    return true;
  }

  // Squares
  boolean checkSquares() {
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
  
  // Checks to see if an array contains a certain boolean value
  boolean contains(boolean[] arr, boolean value) {
    for (int i = 0; i < arr.length; i++) {
      if (arr[i] == value) {
        return true;
      }
    }
    return false;
  }

  // ********************
  // Solvers
  // ********************

  // Force solve with provided solution. Used for debugging and testing purposes
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
  
  // Used to keep track of current cell being analyzed
  Location current;

  void beginSolve() {
    current = getNextLocation(new Location(0, -1));
  }

  void step() {
    /*
    // See if we have a solution
     if (checkBoard()) {
     noLoop();
     }
     */
    int currentValue = tiles[current.getR()][current.getC()].getValue();
    if (currentValue == 9) {
      current = getLastLocation(current);
    }
  }
  
  // Helper functions for solvers
  Location getLastLocation(Location current) {
    int row = current.getR();
    int col = current.getC() - 1;
    if (col <= -1) {
      row--;
      col = 8;
      if (row <= -1) {
        return new Location(-1, -1);
      }
    }
    // Keep going if it is immutable
    if (tiles[row][col].isImmutable()) {
      return getLastLocation(new Location(row, col));
    } else {
      return new Location(row, col);
    }
  }

  Location getNextLocation(Location current) {
    int row = current.getR();
    int col = current.getC() + 1;
    if (col >= 9) {
      row++;
      col = 0;
      if (row >= 9) {
        return new Location(-1, -1);
      }
    }
    // Keep going if it is immutable
    if (tiles[row][col].isImmutable()) {
      return getNextLocation(new Location(row, col));
    } else {
      return new Location(row, col);
    }
  }
}
