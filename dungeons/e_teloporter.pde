class Teloporter extends Enemy {

  int shotTimer, shotThreshold;


  Teloporter(int x, int y) {
    super(TELO_HP, TELO_SIZE, x, y, TELO_DAMAGE);
    timer = 0; 
    threshold = random(1000);

    shotTimer = 0;
    shotThreshold = 100;
  }

  void show() {
    imageMode(CENTER);
    image(telo, location.x, location.y);
    imageMode(CORNER);
    
    println(timer, threshold);
    fill(255, 0, 0);
    textSize(15);
    text(hp, location.x, location.y + 40);
  }

  void act() {
    super.act();

    shotTimer++;
    if (shotTimer >= shotThreshold) {
      myObjects.add(new EBullet(location.x, location.y, 10));
      shotTimer = 0;
    }

    timer++;
    if (timer >= threshold) {
      location.x = random(100, 700);
      location.y = random(100, 500);
      timer = 0;
      threshold = random(1000);
    }
  }
}
