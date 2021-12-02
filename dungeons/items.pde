class DroppedItem extends GameObject {

  int type;
  int weap;
  Weapon w;
  Gif Item;


  DroppedItem(float x, float y, int rx, int ry) {
    type = int(random(0, 4));
    weap = int(random(0, 3));
    if (weap == 0) w = new Spectre();
    if (weap == 1) w = new Shotgun();
    if (weap == 2) w = new Operator();
    
    hp = 1;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    size = 40;
    roomX = rx;
    roomY = ry;
    Item = healthGif;
  }

  void show() {
    if (type == 2) { //health
      Item = healthGif;
    }
    if (type == 1) { //gun
      Item = weaponGif;
    }
    if (type == 0) {//ammo
      Item = ammoGif;
    }
    if (type == 3) {
      Item = livesGif;
    }
    Item.show(location.x, location.y, size, size);
  }

  void act() {
  }
}
