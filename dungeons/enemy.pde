class Enemy extends GameObject {

  float timer, threshold;
  int x;
  int y;
  int chance;


  Enemy() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 30;
    xp = 1;
    chance = int(random(0, 2));
  }

  Enemy(int health, int s, int x, int y) {
    hp  = health;
    size = s;
    roomX = x;
    roomY = y;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
  }

  Enemy(int health, int s, int x, int y, int lx, int ly) {
    hp  = health;
    size = s;
    roomX = x;
    roomY = y;
    location = new PVector(lx, ly);
    velocity = new PVector(0, 0);
  }

  void show() {
    fill(255, 0, 0);
    circle(location.x, location.y, size);
    imageMode(CENTER);
    boi2.resize(80, 0);
    image(boi2, location.x, location.y);

    imageMode(CORNER);
    fill(0);
    textSize(15);
    text(hp, location.x, location.y + 55);
  }

  void act() {
    super.act();

    int i = 0;
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof Bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if ( d <= size/2 + obj.size/2) {
          hp = hp - int(obj.velocity.mag());
          obj.hp = 0;
          if (hp <= 0) {
            //if (chance >= 1) {
            myObjects.add(new DroppedItem(location.x, location.y, roomX, roomY));
            points++;
            //}
            myHero.xp += xp;
            myObjects.add(new Message("+"+xp+"xp", location.x, location.y));
          }
        }
      }
      i++;
    }
  }
}
