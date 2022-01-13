void game() {
  drawRoom();
  drawGameObj();
  drawDarkness();
  drawMiniMap();
  drawHeart();
  drawHealth();

  //buttons
  pause.show();
  //if (pause.clicked) mode = PAUSE;
  if (ukey) mode = UPGRADE;

  //text
  fill(pink);
  textSize(25);
  //text("lives:" + myHero.lives, 675, 75);
  //text("health:" + myHero.health, 675, 125);
  text("ammo:" + myHero.myWeapon.amount + "/" + myHero.myWeapon.ammo, 625, 500);

  //losing
  if (myHero.hp == 0) mode = GAMEOVER;

  //wining
  if (points >= 95) {
   mode = GAMEOVER; 
  }
}



void drawRoom() {
  background(darkgrey);

  //linrds
  stroke(ligrey);
  line(0, 0, width, height);
  line(0, 600, width, 0);

  if (pause.clicked) {
    MAP = floor2;
  } else {
    MAP = map2;
  }

  //exits
  northRoom = MAP.get(myHero.roomX, myHero.roomY - 1);
  southRoom = MAP.get(myHero.roomX, myHero.roomY + 1);
  eastRoom = MAP.get(myHero.roomX + 1, myHero.roomY);
  westRoom = MAP.get(myHero.roomX - 1, myHero.roomY);

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
  float opacity;
  float d;

  if (pause.clicked) {
    MAP = floor2;
  } else {
    MAP = map2;
  }

  d = dist(x, y, myHero.location.x, myHero.location.y);
  opacity = map(d, 200, 300, 0, 255);

  rectMode(CORNER);
  fill(255, opacity);
  noStroke();
  rect(-45, -50, 200, 185);

  while (y < MAP.height) {
    color c = MAP.get(x, y);
    noStroke();
    fill(c, opacity);

    if (myHero.myMap[y][x] == true) {
      square(x*size, y*size, size);
    }

    x++;
    if ( x >= MAP.width) {
      x = 0;
      y++;
    }
  }

  fill(cyan, opacity);
  square(myHero.roomX*size, myHero.roomY*size, size);

  rectMode(CENTER);
  popMatrix();
  tint(150, opacity);
  mapWindow.resize(200, 200);
  image(mapWindow, -3, -5);
  noTint();
}

void drawHeart() {
  if (myHero.lives == 3) {
    image(heart, 550, 15); 
    image(heart, 590, 15); 
    image(heart, 630, 15);
  } else if (myHero.lives == 2) {
    image(heart, 550, 15); 
    image(heart, 590, 15);
  } else if (myHero.lives == 1) {
    image(heart, 550, 15);
  } else if (myHero.lives == 0) {
  }
}

void drawHealth() {
  fill(0, 0, 0);
  rect(myHero.location.x, myHero.location.y + 40, 56, 10);

  fill(255, 0, 0);
  rect(myHero.location.x, myHero.location.y + 40, 50, 6);

  fill(0, 255, 0);
  rectMode(CORNER);
  if (myHero.health >= 0) {
    rect(myHero.location.x - 25, myHero.location.y + 37, myHero.health/2, 6);
  }
  rectMode(CENTER);
}
