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

class Spectre extends Weapon {

  Spectre() {
    super(SPECTRE_THRESHOLD, SPECTRE_SPEED, SPECTRE_AMMO);
  }
}


class Operator extends Weapon {

  Operator() {
    super(OP_THRESHOLD, OP_SPEED, OP_AMMO);
  }
}

class Shotgun extends Weapon {

  Shotgun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_SPEED, SHOTGUN_AMMO);
  }

  void shoot() {
    if (shotTimer >= threshold && amount > 0) {
      PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
      aimVector.setMag(bulletSpeed);

      for (int i = 0; i < 20; i++) {
        aimVector.rotate(random(-5, 5));
        myObjects.add(new Bullet(aimVector, pink, 7));
      }
      shotTimer = 0;
      amount--;
    }
  }
}

class Magic extends Weapon {
  Magic() {
    super(MAGIC_THRESHOLD, MAGIC_SPEED, MAGIC_AMMO);
  }
}
