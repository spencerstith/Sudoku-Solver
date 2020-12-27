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
