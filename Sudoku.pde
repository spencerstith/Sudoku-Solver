Game game;

void setup() {
  size(541, 541);
  stroke(255);
  noFill();
  textSize(32);
  textAlign(CENTER);
  game = new Game(board_easy1);
  game.beginSolve();
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
