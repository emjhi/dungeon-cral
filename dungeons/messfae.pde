class Message extends GameObject {

  int timer, threshold;
  String text;
  PFont font;
  int size;
  float x, y;
  int opacity;

  Message(String t, float _x, float _y) {
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 40;
    text = t;
    x = _x;
    y = _y;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    opacity = 255;
    timer = 150;
    threshold = 100;
  }

  void show() {
    timer--;

    if (timer <= threshold) {
      opacity -= 5;
      if (opacity == 0) timer = 150;
    }

    textFont(windows);
    textSize(20);
    fill(0, 0, 0, opacity);
    text(text, x, y);
    println(timer);

    y--;
  }

  void act() {
  }
}
