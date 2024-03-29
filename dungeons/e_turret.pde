class Turret extends Enemy {

  int shotTimer, threshold;

  Turret(int x, int y, int lx, int ly) {
    super(TURRET_HP, TURRET_SIZE, x, y, lx, ly);
    shotTimer = 0;
    threshold = 100;
    xp = 4;
  }

  void show() {
    turret.resize(TURRET_SIZE, 0);
    imageMode(CENTER);
    image(turret, location.x + 5, location.y - 15);
    imageMode(CORNER);
    fill(255, 0, 0);
    textSize(15);
    text(hp, location.x, location.y + 20);
  }

  void act() {
    super.act();

    shotTimer++;
    if (shotTimer >= threshold) {
      myObjects.add(new EBullet(location.x, location.y, TURRET_DAMAGE));
      shotTimer = 0;
    }
  }
}
