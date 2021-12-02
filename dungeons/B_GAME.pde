void game() {
  drawRoom();
  drawGameObj();
  //drawDarkness();

  //map
  rectMode(CORNER);
  fill(255);
  noStroke();
  rect(-3, -5, 200, 185);
  drawMiniMap();
  mapWindow.resize(200, 200);
  image(mapWindow, -3, -5);

  //text
  fill(pink);
  textSize(25);
  text("lives:" + myHero.lives, 675, 75);
  text("health:" + myHero.health, 675, 125);
  text("ammo:" + myHero.myWeapon.amount + "/" + myHero.myWeapon.ammo, 625, 500);

  pause.show();
  if (pause.clicked) mode = PAUSE;
  
  if (ukey) mode = UPGRADE;
}





void drawRoom() {
  background(darkgrey);

  //linrds
  stroke(ligrey);
  line(0, 0, width, height);
  line(0, 600, width, 0);

  //exits
  northRoom = map.get(myHero.roomX, myHero.roomY - 1);
  southRoom = map.get(myHero.roomX, myHero.roomY + 1);
  eastRoom = map.get(myHero.roomX + 1, myHero.roomY);
  westRoom = map.get(myHero.roomX - 1, myHero.roomY);

  noStroke();
  fill(0);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.1, 100, 100);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.9, 100, 100);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.9, height/2, 100, 100);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.1, height/2, 100, 100);
  }

  //floor
  fill(255);
  rect(width/2, height/2, width*0.8, height*0.8);
}

void  drawGameObj() {
  for (int i = 0; i < myObjects.size(); i++) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();

      if (obj.hp <= 0) {
        myObjects.remove(i);
        i--;
      }
    }
  }
}

void drawDarkness() {
  for (int i = 0; i < dark.size(); i++) {
    dark.get(i).show();
  }
}

void drawMiniMap() {
  pushMatrix();
  translate(40, 20);
  int x = 0, y = 0;
  float size = 10;

  while (y < map2.height) {
    color c = map2.get(x, y);
    noStroke();
    fill(c);
    square(x*size, y*size, size);

    x++;
    if ( x >= map2.width) {
      x = 0;
      y++;
    }
  }
  fill(cyan);
  square(myHero.roomX*size, myHero.roomY*size, size);
  rectMode(CENTER);
  popMatrix();
}
