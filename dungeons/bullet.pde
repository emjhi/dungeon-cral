class Bullet extends GameObject {

  PVector aimVector;
  color colour;

  Bullet(PVector aim, color c, int s) {
    aimVector = aim;
    colour = c;
    size = s;
    location = new PVector(myHero.location.x, myHero.location.y);
    velocity.add(aim);
    
    roomX = myHero.roomX;
    roomY = myHero.roomY;
  }

  void show() {

    fill(colour);
    circle(location.x, location.y, size);
  }

  void act() {
    //super.act();
    location.add(velocity);

    if (location.x <= width*0.1 || location.x >= width*0.9 || location.y <= height*0.1 || location.y >= height*0.9) hp--;
  }
}
