class Hero extends GameObject {
  float speed; 
  int roomX, roomY;

  Hero() {
    super();

    speed = 5;
    roomX = 1;
    roomY = 1;
  }

  void show() {
    strokeWeight(3);
    stroke(0);
    fill(0, 255, 0);
    circle(location.x, location.y, 30);
  }

  void act() {
    super.act();

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
  }
}
