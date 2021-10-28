//Emma SUn
//oct 20th 2021
//dungeon

//objects
ArrayList<GameObject> myObjects;
ArrayList<darkness> dark;
Hero myHero;

//colors
color lightbrown =#59220E;
color darkbrown = #260705;
color northRoom, southRoom, westRoom, eastRoom;

//images
PImage sign;
PImage map;

//GIF
Gif introGif;

//font
PFont intro;
PFont windows;

//button class
boolean mouseReleased;
boolean hadPressed;
Button introStart;

//keys
boolean wkey, akey, skey, dkey;

//mode frameowrk
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

void setup() {
  size(800, 600, FX2D);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER);
  mode = GAME;

  //keys
  wkey = akey = skey = dkey = false;

  //gif
  introGif = new Gif(12, "frame_", "_delay-0.15s.png", 400, 300, 940, 614);

  //fonyt
  intro = createFont("Cardinal.ttf", 50);
  windows = createFont("MS Sans Serif 8pt bold.ttf", 50);

  //images
  sign = loadImage("sign.png");
  map = loadImage("New Piskel-1.png.png");

  //buttons
  introStart = new Button("START", 400, 500, 400, 100, darkbrown, lightbrown, intro);

  //game object
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myHero);

  dark = new ArrayList<darkness>(1000);
  int size = 100;
  int x = 0, y = 0;

  while (y < 600 && x < 800) {
    dark.add(new darkness(x, y, size));

    x = x + size;
    if ( x >= 800) {
      x = 0;
      y = y + size;
    }
  }
}

void draw() {
  clicked();

  //mode framwoekr
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error:" + mode);
  }
}
