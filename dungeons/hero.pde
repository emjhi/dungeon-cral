class Hero extends GameObject {

  float immunTimer;
  float speed; 
  int lives;
  int health;
  Weapon myWeapon;
  Gif currentAction;

  Hero() {
    super();
    health = 100;
    lives = 3;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 75;

    immunTimer = 150;

    myWeapon = new Spectre();
    currentAction = mandownGif;
  }

  void show() {

    imageMode(CENTER);
    currentAction.show(location.x, location.y, size, size);
    imageMode(CORNER);

    if (immunTimer > 0) {
      fill(blue);
    }

    text(immunTimer, 400, 300);
  }

  void act() {
    super.act();

    if (immunTimer <= 0) {

      if (health <= 0) {
        lives--;
        health = 100;
        immunTimer = 150;

        if (lives <= 0) {
          hp = 0;
          health = 0;
        }
      }
    }

    //move
    if (velocity.mag() > speed)velocity.setMag(speed);

    if (wkey) {
      velocity.y = -speed;
      currentAction = manupGif;
    }
    if (skey) {
      velocity.y = speed;
      currentAction = mandownGif;
    }
    if (akey) {
      velocity.x = -speed;
      currentAction = manleftGif;
    }
    if (dkey) {
      velocity.x = speed;
      currentAction = manrightGif;
    }

    if (!wkey && !skey) velocity.y = velocity.y * 0.5;
    if (!akey && !dkey) velocity.x = velocity.x * 0.5;


    //CHECK EXITS
    if (northRoom != #FFFFFF && location.y == height*0.1 && location.x >= width/2 - 50 && location.x <= width/2 + 50) {
      roomY--;
      location = new PVector(width/2, height*0.9 - 10);
    } else if (southRoom != #FFFFFF && location.y == height*0.9 && location.x >= width/2 - 50 && location.x <= width/2 + 50) {
      roomY++;
      location = new PVector(width/2, height*0.1 +10);
    } else if (eastRoom != #FFFFFF && location.x == width*0.9 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
      roomX++;
      location = new PVector(width*0.1 + 10, height/2);
    } else if (westRoom != #FFFFFF && location.x == width*0.1 && location.y >= height/2 - 50 && location.y <= height/2 + 50) {
      roomX--;
      location = new PVector(width*0.9 - 10, height/2);
    }

    myWeapon.update();
    if (spacekey) {
      myWeapon.shoot();
    }

    if (immunTimer >= 0) immunTimer--;

    //collisions
    for (int i = 0; i < myObjects.size(); i++) {
      GameObject obj = myObjects.get(i);
      if (immunTimer <= 0) {
        if (obj instanceof Enemy && collidingWith(obj)) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if ( d <= size/2 + obj.size/2) {
            health = health - 10;
            immunTimer = 150;
          }
        }
        if (obj instanceof EBullet && collidingWith(obj)) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if ( d <= size/2 + obj.size/2) {
            health = health - int(obj.velocity.mag());
            immunTimer = 150;
          }
        }
      }
      if (obj instanceof DroppedItem && collidingWith(obj)) {
        DroppedItem item = (DroppedItem) obj;
        if (item.type == GUN) {
          myWeapon = item.w;
          item.hp--;
        }
        if (item.type == AMMO) {
          myWeapon.amount = myWeapon.ammo;
          item.hp--;
        }
        if (item.type == HEALTH) {
          health = health + 25;
          if (health >= 100) health = 100;
          item.hp--;
        }
      }
    }
  }
}
