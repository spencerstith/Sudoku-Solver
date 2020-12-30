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
    //return checkZeros() && checkRows() && checkColumns() && checkSquares();
    return checkSquares();
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

  // All Rows
  boolean checkRows() {
    for (int i = 0; i < 9; i++) {
      if (!checkRow(i)) {
        return false;
      }
    }
    return true;
  }
  
  // Single row
  boolean checkRow(int row) {
    for (int i = 0; i < 9; i++) {
      int value = tiles[row][i].getValue();
      for (int j = 0; j < 9; j++) {
        if (i != j && tiles[row][j].getValue() == value) {
          return false;
        }
      }
    }
    return true;
  }

  // All Columns
  boolean checkColumns() {
    for (int i = 0; i < 9; i++) {
      if (!checkColumn(i)) {
        return false;
      }
    }
    return true;
  }
  
  // Single Column
  boolean checkColumn(int col) {
    for (int i = 0; i < 9; i++) {
      int value = tiles[i][col].getValue();
      for (int j = 0; j < 9; j++) {
        if (i != j && tiles[j][col].getValue() == value) {
          return false;
        }
      }
    }
    return true;
  }

  // Squares
  boolean checkSquares() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (!checkSquare(i, j)) {
          return false;
        }
      }
    }
    return true;
  }
  
  boolean checkSquare(int sqRow, int sqCol) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        int value = tiles[sqRow * 3 + i][sqCol * 3 + j].getValue();
        for (int m = 0; m < 3; m++) {
          for (int n = 0; n < 3; n++) {
            if (!(i == m && j == n) && tiles[sqRow * 3 + m][sqCol * 3 + n].getValue() == value) {
              return false;
            }
          }
        }
      }
    }
    return true;
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
