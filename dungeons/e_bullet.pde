class EBullet extends GameObject {

  PVector x, y;
  int shotTimer;
  int damage;

  EBullet(float x, float y, int d) {
    shotTimer = 50;
    location = new PVector(x, y);
    velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
    velocity.setMag(7);
    size = 10;
    damage = d;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {

    stroke(0);
    fill(pink);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    location.add(velocity);

    if (location.x <= width*0.1 || location.x >= width*0.9 || location.y <= height*0.1 || location.y >= height*0.9) hp--;
  }
}
