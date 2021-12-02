void upgrade() {
  imageMode(CENTER);
  introimage.resize(500, 0);
  image(introimage, width/2, height/2);

  textFont(windows);
  textSize(20);
  fill(255);
  text("UPGRADE", 220, 130);

  upgrade1.show1();//ammo
  if (upgrade1.clicked) {
    if (myHero.xp >= ammoXP) {
      myHero.myWeapon.amount = myHero.myWeapon.ammo;
      myHero.xp -= ammoXP;
    }
  }
  upgrade2.show1();//speed
  if (upgrade2.clicked) {
    if (myHero.xp >= speedXP) {
      myHero.speed++;
      myHero.xp -= speedXP;
    }
  }
  upgrade3.show1();

  fill(0);
  text("You have:"+myHero.xp+"xp", 240, 165);

  textSize(30);
  text("ammo", 320, 230);
  text("speed", 320, 305);

  imageMode(CORNER);

  //exiting
  if (mouseX >= 600 && mouseX <= 630 && mouseY >= 120 && mouseY <= 150) {
    if (mouseReleased) {
      mode = GAME;
    }
  }
  if (ukey) mode = GAME;
}
