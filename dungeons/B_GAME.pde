void game() {
  drawRoom();
  drawGameObj();
  drawDarkness();
}





void drawRoom() {
  background(0, 0, 255);

  //linrds
  stroke(0);
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
    obj.show();
    obj.act();
    if (obj.hp <= 0) {
      myObjects.remove(i);
      i--;
    }
  }
}

void drawDarkness() {
  for (int i = 0; i < dark.size(); i++) {
    dark.get(i).show();
    dark.get(i).act();
  }
}
