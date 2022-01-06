class Baddie extends Enemy {

  Baddie(int x, int y) {
    super(BADDIE_HP, BADDIE_SIZE, x, y);
    xp = 6;
  }

  void show() {
    
    imageMode(CENTER);
    circle(location.x, location.y, size);
    image(baddie, location.x, location.y);
    imageMode(CORNER);
    
    //health
    fill(255, 0, 0);
    textSize(15);
    text(hp, location.x, location.y + 45);
  }
  
  
  void act(){
   super.act();
   
   velocity = new PVector(myHero.location.x - location.x, myHero.location.y - location.y);
   velocity.setMag(2);
  }
}
