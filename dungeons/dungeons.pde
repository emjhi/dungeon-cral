//Emma SUn
//oct 20th 2021
//dungeon

//dropped items
final int AMMO = 0;
final int GUN = 1;
final int HEALTH = 2;
final int LIVES = 3;

//enemy settings
int BADDIE_HP = 100; 
int BADDIE_SIZE = 30;

int SNEAKY_HP = 100;
int SNEAKY_SIZE = 30;

int SPAWNER_HP = 300;
int SPAWNER_SIZE = 50;

int TURRET_HP = 50;
int TURRET_SIZE = 50;
int TURRET_DAMAGE = 15;

int TELO_HP = 100;
int TELO_SIZE = 30;
int TELO_DAMAGE = 5;
//wapon settings
int OP_THRESHOLD = 100;
int OP_SPEED = 100;
int OP_AMMO = 5;

int SPECTRE_THRESHOLD = 20;
int SPECTRE_SPEED = 10;
int SPECTRE_AMMO = 30;

int SHOTGUN_THRESHOLD = 10;
int SHOTGUN_SPEED = 7;
int SHOTGUN_AMMO = 30;

//objects
ArrayList<GameObject> myObjects;
ArrayList<darkness> dark;
Hero myHero;

//colors
color green = #2aff00;
color ligrey = #c3c3c3;
color darkgrey = #818181;
color cyan = #008080;
color blue = #010081;
color pink = #ff0081;

color northRoom, southRoom, westRoom, eastRoom;

//images
PImage map, map2;
PImage introimage;
PImage mapWindow;
PImage baddie, boi2, sneaky, turret, telo, spawner;
PImage manup, mandown, manleft, manright;

//GIF
Gif introGif;
Gif manupGif, mandownGif, manleftGif, manrightGif;

//font
PFont windows;

//button class
boolean mouseReleased;
boolean hadPressed;
Button pause;

//keys
boolean wkey, akey, skey, dkey, spacekey;

//mode frameowrk
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

void setup() {
  size(800, 600, FX2D);
  rectMode(CENTER);
  textAlign(CENTER);
  mode = INTRO;

  //keys
  wkey = akey = skey = dkey = spacekey = false;

  //gif
  introGif = new Gif(15, "introGif/frame_", "_delay-0.06s.png", 20, 115, 75, 150);
  
  manupGif = new Gif(2, "man/up/frame_", "_delay-0.25s.png");
  mandownGif = new Gif(2, "man/down/frame_", "_delay-0.25s.png");
  manleftGif = new Gif(2, "man/left/frame_", "_delay-0.25s.png");
  manrightGif = new Gif(2, "man/right/frame_", "_delay-0.25s.png");
  //fonyt
  windows = createFont("MS Sans Serif 8pt bold.ttf", 50);

  //images
  map = loadImage("New Piskel-1.png");
  map2 = loadImage("New Piskel-1.png.png");
  introimage = loadImage("intro screen.jpg");
  mapWindow = loadImage("map window.png");
  baddie = loadImage("pixil-frame-0.png");
  boi2 = loadImage("pixil-frame-0 (1).png");
  sneaky = loadImage("pixil-frame-1 (2).png");
  turret = loadImage("pixil-frame-0 (4).png");
  telo = loadImage("pixil-frame-0 (5).png");
  spawner = loadImage("MobSpawnerNew.png");

  //buttons
  pause = new Button(" I I ", 750, 40, 50, 50, ligrey, darkgrey, windows);

  //game objects
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myHero);
  myObjects.add(new Teloporter(1, 1));

  //darkness
  dark = new ArrayList<darkness>(1000);
  int size = 5;
  int x = 0, y = 0;

  while (y < 600 && x < 800) {
    dark.add(new darkness(x, y, size));

    x = x + size;
    if ( x >= 800) {
      x = 0;
      y = y + size;
    }
  }

  //loading enemies
  x = 0;
  y = 0;

  while (y < map.height) {
    color roomColour =  map.get(x, y);

    if (roomColour == pink ) {
      myObjects.add(new Spawner(x, y));
      myObjects.add(new Turret(x, y));
    }

    if (roomColour == blue) {
      myObjects.add(new Sneaky(x, y));
    }

    if (roomColour == cyan) {
      myObjects.add(new Baddie(x, y));
    }

    x++;
    if (x == map.width) {
      x = 0;
      y++;
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
