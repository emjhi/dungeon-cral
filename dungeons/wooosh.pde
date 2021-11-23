class Shotgun extends Weapon {

  Shotgun() {
    super(SHOTGUN_THRESHOLD, SHOTGUN_SPEED, SHOTGUN_AMMO);
  }

  void shoot() {
    if (shotTimer >= threshold && amount > 0) {
      PVector aimVector = new PVector(mouseX - myHero.location.x, mouseY - myHero.location.y);
      aimVector.setMag(bulletSpeed);
      aimVector.rotate(random(-PI, PI));
      myObjects.add(new Bullet(aimVector, pink, 5));
      shotTimer = 0;
      amount--;
    }
  }
}
