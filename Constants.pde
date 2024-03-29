final int SCALE = 60;
final color GREEN = color(0, 255, 0);
final color WHITE = color(255, 255, 255);
final color HIGHLIGHT = color(255, 255, 0, 255 / 2);

final int[][] board_easy1 = {
  {0, 7, 0, 0, 0, 0, 0, 0, 9},
  {5, 1, 0, 4, 2, 0, 6, 0, 0},
  {0, 8, 0, 3, 0, 0, 7, 0, 0},
  {0, 0, 8, 0, 0, 1, 3, 7, 0},
  {0, 2, 3, 0, 8, 0, 0, 4, 0},
  {4, 0, 0, 9, 0, 0, 1, 0, 0},
  {9, 6, 2, 8, 0, 0, 0, 3, 0},
  {0, 0, 0, 0, 1, 0, 4, 0, 0},
  {7, 0, 0, 2, 0, 3, 0, 9, 6},
};

final int[][] board_easy1_solution = {
  {3, 0, 4, 1, 6, 8, 2, 5, 0},
  {0, 0, 9, 0, 0, 7, 0, 8, 3},
  {2, 0, 6, 0, 9, 5, 0, 1, 4},
  {6, 9, 0, 5, 4, 0, 0, 0, 2},
  {1, 0, 0, 7, 0, 6, 9, 0, 5},
  {0, 5, 7, 0, 3, 2, 0, 6, 8},
  {0, 0, 0, 0, 7, 4, 5, 0, 1},
  {8, 3, 5, 6, 0, 9, 0, 2, 7},
  {0, 4, 1, 0, 5, 0, 8, 0, 0},
};
