class DroppedItem extends GameObject {

  int type;
  Weapon w;

  DroppedItem(float x, float y, int rx, int ry) {
    type = int(random(0, 3));
    w = new Operator();
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 20;
    roomX = rx;
    roomY = ry;
  }

  void show() {
    if (type == 2) { //health
      fill(255, 0, 0);
    }
    if (type == 1) { //gun
      fill(blue);
    }

    if (type == 0) {//ammo
      fill(green);
    }
    circle(location.x, location.y, size);
  }

  void act() {
  }
}
