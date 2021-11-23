class GameObject {

  int hp;
  PVector location;
  PVector velocity;
  int roomX, roomY;
  int size;
  int lives;

  GameObject() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    hp = 1;
  }

  void show() {
  }

  void act() {
    location.add(velocity);

    //wall
    if (location.x <= width*0.1) location.x = width*0.1;
    if (location.x >= width*0.9) location.x = width*0.9;
    if (location.y <= height*0.1) location.y = height*0.1;
    if (location.y >= height*0.9) location.y = height*0.9;
  }

  boolean roomingWith(GameObject obj) {
    if (roomX == obj.roomX && roomY == obj.roomY)
      return true;
    else
      return false;
  }

  boolean collidingWith(GameObject obj) {
    float d = dist(obj.location.x, obj.location.y, location.x, location.y);
    if (roomingWith(obj) && d < size/2 + obj.size/2)
      return true;
    else 
    return false;
  }
}
