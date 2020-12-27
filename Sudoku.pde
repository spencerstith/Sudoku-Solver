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
  game.changeValue(mouseX, mouseY);
}

void keyPressed() {
  if (keyCode == 'F') {
    game.hardSolve(board_easy1_solution);
  }
  if (keyCode == 'C') {
    println(game.checkBoard());
  }
}
