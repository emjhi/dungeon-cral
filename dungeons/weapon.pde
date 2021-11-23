class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int ammo;
  int amount;

  Weapon() {
    shotTimer = 0;
    threshold = 30;
    bulletSpeed = 5;
  }

  Weapon(int thr, int sp, int a) {
    shotTimer = 0;
    amount = a;
    threshold = thr;
    bulletSpeed = sp;
    ammo = a;
  }

  void update() {
    shotTimer++;
  }

  void shoot () {
    if (shotTimer >= threshold && amount > 0) {
      PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new Bullet(aimVector, pink, 10));
      shotTimer = 0;
      amount--;
    }
  }
}
