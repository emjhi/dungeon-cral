class Sneaky extends Enemy {

  Sneaky(int x, int y) {
    super(SNEAKY_HP, SNEAKY_SIZE, x, y, SNEAKY_DAMAGE);
  }

  void show() {
    imageMode(CENTER);
    sneaky.resize(80, 0);
    image(sneaky, location.x, location.y);
    imageMode(CORNER);

    //health
    fill(255, 0, 0);
    textSize(15);
    text(hp, location.x, location.y + 45);
  }

  void act() {
    super.act();

    float d = dist(myHero.location.x, myHero.location.y, location.x, location.y);
    if ( d <= 200) {
      velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
      velocity.setMag(2);
    } else {
      velocity = new PVector(0, 0);
    }
  }
}
