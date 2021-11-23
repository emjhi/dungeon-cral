class Hero extends GameObject {

  float immunTimer;
  float speed; 
  int lives;
  int health;
  Weapon myWeapon;
  int damage;

  Hero() {
    super();
    health = 100;
    lives = 3;
    speed = 5;
    roomX = 1;
    roomY = 1;
    size = 30;

    immunTimer = 100;

    myWeapon = new Spectre();
  }

  void show() {
    strokeWeight(3);
    stroke(0);
    fill(cyan);

    if (immunTimer > 0) {
      fill(blue);
    }
    circle(location.x, location.y, size);

    fill(0);
    textSize(25);
    text("ammo:" + myWeapon.amount + "/" + myWeapon.ammo, 625, 500);
  }

  void act() {
    super.act();

    if (health <= 0) {
      lives--;
    }
    
    //move
    if (velocity.mag() > speed)velocity.setMag(speed);

    if (wkey) velocity.y = -speed;
    if (skey) velocity.y = speed;
    if (akey) velocity.x = -speed;
    if (dkey) velocity.x = speed;

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
            health--;
            //hp = hp - int(obj.damage.mag());
            immunTimer = 100;
          }
        }
        if (obj instanceof EBullet && collidingWith(obj)) {
          float d = dist(obj.location.x, obj.location.y, location.x, location.y);
          if ( d <= size/2 + obj.size/2) {
            health = health - 10;
            //hp = hp - obj.damage;
            immunTimer = 100;
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
          item.hp--;
        }
      }
    }
  }
}
