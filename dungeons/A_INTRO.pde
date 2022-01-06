void intro() {

  //introStart.show();
  image(introimage, 0, 0);
  introGif.show(20, 115, 75, 150);

  textFont(windows);
  textSize(40);
  text("DUNGEON CRAWL", 220, 55);

  if (mouseReleased) mode = GAME;
  
}
