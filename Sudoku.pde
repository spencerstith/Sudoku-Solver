Game game;

void setup() {
  size(541, 541);
  stroke(255);
  noFill();
  textSize(32);
  textAlign(CENTER);
  game = new Game(board_easy1);
}

void draw() {
  background(0);
  game.show();
}

void mouseClicked() {
  int col = (int)(mouseX / SCALE);
  int row = (int)(mouseY / SCALE);
  game.changeValue(row, col);
  
  println("Current: ", row, col);
  Location next = game.getNextLocation(new Location(row, col));
  println("Next: ", next.getR(), next.getC());
}

void keyPressed() {
  if (keyCode == 'F') {
    game.hardSolve(board_easy1_solution);
  }
  if (keyCode == 'C') {
    println(game.checkBoard());
  }
}
