void intro() {
  //background
  introGif.show();
  introStart.show();
  if (introStart.clicked) {
    mode = GAME;
  }

  image(sign, 415, 125, 650, 350);

  //text
  textFont(intro);
  textSize(50);
  fill(255);
  text("Dungeon", 400, 100);
  text("Crawl", 400, 160);
}
