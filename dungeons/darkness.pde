class darkness {

  int x, y;
  int size;
  float opacity;

  darkness(int _x, int _y, int s) {
    x = _x;
    y = _y;
    size = s;
    opacity = 0;
  }

  void show() {
    rectMode(CORNER);
    fill(0, 0, 0, opacity);
    stroke(255);
    strokeWeight(0);
    square(x, y, size);
    rectMode(CENTER);
  }

  void act() {
    if (dist(myHero.location.x, myHero.location.y, x, y) <= 50) {
      opacity = 255;
    }
  }
}
