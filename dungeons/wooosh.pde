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
