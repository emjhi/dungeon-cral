class Spawner extends Enemy {

  Spawner(int x, int y) {
    super(SPAWNER_HP, SPAWNER_SIZE, x, y, SPAWNER_DAMAGE);
    timer = 0; 
    threshold = random(1000);
  }

  void show() {
    imageMode(CENTER);
    spawner.resize(100, 0);
    image(spawner, location.x, location.y);
    imageMode(CORNER);
    fill(255, 0, 0);
    textSize(15);
    text(hp, location.x, location.y + 70);
  }

  void act() {
    super.act();

    timer++;
    if (timer >= threshold) {
      myObjects.add(new Baddie(x, y)); 
      timer = 0;
      threshold = random(1000);
    }

    println(timer, threshold);
  }
}