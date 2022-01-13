void gameover() {

  imageMode(CENTER);
  image(gameover, 400, 300);
  imageMode(CORNER);

  if (points >= 95) {
    fill(0);
    textFont(windows);
    textSize(50);
    text("YOU WIN", width/2, height/2);
  } else {

    fill(0);
    textFont(windows);
    textSize(50);
    text("YOU LOST", width/2, height/2);
  }

  if (mouseX >= 540 && mouseY >= 340 && mouseX <= 670 && mouseY <= 380 && mouseReleased) {
    exit();
  }

  if (mouseX >= 340 && mouseY >= 340 && mouseX <= 450 && mouseY <= 380 && mouseReleased) {
    mode = INTRO;
  }

  if (mouseX >= 240 && mouseY >= 340 && mouseX <= 260 && mouseY <= 380 && mouseReleased) {
    mode = INTRO;
  }
}
