// HOW TO SOLVE
// In checkers area, include a method that will check wheter or not changing a value will break the board
//   If it does, increment the number and check again.
//     If you get to 9 and it still doesn't work, return -1 and check for that in the step method.
//     Go back one and increment from there, continuing onward.
//   If it does not, place that value there and move on.

Game game;

void setup() {
  size(541, 541);
  stroke(255);
  noFill();
  textSize(32);
  textAlign(CENTER);
  game = new Game(board_easy1);
  game.beginSolve();
  frameRate(5);
}

void draw() {
  background(0);
  game.step();
  game.show();
}

void mouseClicked() {
  int col = (int)(mouseX / SCALE);
  int row = (int)(mouseY / SCALE);
  game.changeValue(row, col);
}

void keyPressed() {
  if (keyCode == 'F') {
    game.hardSolve(board_easy1_solution);
  }
  if (keyCode == 'C') {
    println(game.checkBoard());
  }
}
