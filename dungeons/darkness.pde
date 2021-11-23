class darkness {

  int x, y;
  int size;
  float opacity;
  float d;

  darkness(int _x, int _y, int s) {
    x = _x;
    y = _y;
    size = s;
    opacity = 100;
  }

  void show() {
    d = dist(x, y, myHero.location.x, myHero.location.y);
    opacity = map(d, 50, 150, 100, 200);

    rectMode(CORNER);
    fill(0, 0, 0, opacity);
    noStroke();
    square(x, y, size);
    rectMode(CENTER);
  }
}
