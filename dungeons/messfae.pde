class Message extends GameObject{

  int timer, threshold;
  
  Message(float x, float y, int rx, int ry) {
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 40;
    roomX = rx;
    roomY = ry;
  }

  void show() {
  }

  void act() {
  }
}
