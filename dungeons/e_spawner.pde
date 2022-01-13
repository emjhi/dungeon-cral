class Spawner extends Enemy {

  Spawner(int x, int y, int lx, int ly) {
    super(SPAWNER_HP, SPAWNER_SIZE, x, y, lx, ly);
    timer = 0; 
    threshold = random(1000);
    xp = 10;
  }

  void show() {
    imageMode(CENTER);
    spawner.resize(SPAWNER_SIZE, 0);
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
      timer = 0;
      threshold = random(1000);
      myObjects.add(new Baddie(roomX, roomY, width/2, height/2));
    }
    println(timer, threshold);
  }
}
