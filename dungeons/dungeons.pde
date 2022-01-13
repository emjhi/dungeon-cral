//Emma SUn
//oct 20th 2021
//dungeon

PImage MAP;
int points;

//dropped items
final int AMMO = 0;
final int GUN = 1;
final int HEALTH = 2;
final int LIVES = 3;

// upgrade prices
int ammoXP = 5;
int speedXP = 5;

//enemy settings
int BADDIE_HP = 100; 
int BADDIE_SIZE = 30;

int SNEAKY_HP = 100;
int SNEAKY_SIZE = 40;

int SPAWNER_HP = 300;
int SPAWNER_SIZE = 75;

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
int SPECTRE_SPEED = 15;
int SPECTRE_AMMO = 30;

int SHOTGUN_THRESHOLD = 50;
int SHOTGUN_SPEED = 10;
int SHOTGUN_AMMO = 12;

int MAGIC_THRESHOLD = 30;
int MAGIC_SPEED = 25;
int MAGIC_AMMO = 10;

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
color forest = #1b9916;
color orange = #ff8e1a;
color sky = #1affdc;
color purple = #7d1aff;

color northRoom, southRoom, westRoom, eastRoom;

//images
PImage map, map2, floor2;
PImage introimage;
PImage gameover;
PImage mapWindow;
PImage baddie, boi2, sneaky, turret, telo, spawner;
PImage button, buttonPressed;
PImage heart;
PImage firewall;

//GIF
Gif introGif;
Gif manupGif, mandownGif, manleftGif, manrightGif;
Gif healthGif, ammoGif, weaponGif, livesGif;

//font
PFont windows;

//button class
boolean mouseReleased;
boolean hadPressed;
Button pause;
Button upgrade1, upgrade2, upgrade3;

//keys
boolean wkey, akey, skey, dkey, ukey, tkey, upkey, downkey, spacekey;

//mode frameowrk
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int UPGRADE = 4;

ArrayList<Weapon> currentWeapon;

void setup() {
  size(800, 600, FX2D);
  rectMode(CENTER);
  textAlign(CENTER);
  mode = INTRO;

  currentWeapon = new ArrayList<Weapon>();
  currentWeapon.add(new Spectre());
  currentWeapon.add(new Operator());
  currentWeapon.add(new Shotgun());


  //keys
  wkey = akey = skey = dkey = ukey = upkey = tkey = downkey = spacekey = false;

  //gif
  introGif = new Gif(15, "introGif/frame_", "_delay-0.06s.png", 20, 115, 75, 150, 4);

  //drop gifs
  healthGif = new Gif(3, "drops/health/frame_", "_delay-0.25s.png.png", 15);
  ammoGif = new Gif(4, "drops/ammo/frame_", "_delay-0.5s.png.png", 10);
  weaponGif = new Gif(4, "drops/weapon/frame_", "_delay-0.5s.png.png", 10);
  livesGif = new Gif(5, "drops/lives/frame_", "_delay-0.25s.png.png", 10);

  //moving gifs
  manupGif = new Gif(2, "man/up/frame_", "_delay-0.25s.png", 15);
  mandownGif = new Gif(2, "man/down/frame_", "_delay-0.25s.png", 15);
  manleftGif = new Gif(2, "man/left/frame_", "_delay-0.25s.png", 15);
  manrightGif = new Gif(2, "man/right/frame_", "_delay-0.25s.png", 15);

  //fonyt
  windows = createFont("MS Sans Serif 8pt bold.ttf", 50);

  //images
  map = loadImage("New Piskel-1.png");
  map2 = loadImage("New Piskel-1.png.png");
  floor2 = loadImage("map2.png");

  introimage = loadImage("intro screen.jpg");
  mapWindow = loadImage("map window.png");
  button = loadImage("button.png");
  buttonPressed = loadImage("buttonPressed.png");
  heart = loadImage("pixil-frame-0 (5).png");
  gameover = loadImage("0d01101bb97d71914bf42d19d06258fa.jpg");
  firewall = loadImage("fire wall.png");

  //enemy images
  baddie = loadImage("enemy/pixil-frame-0.png");
  boi2 = loadImage("enemy/pixil-frame-0 (1).png");
  sneaky = loadImage("enemy/pixil-frame-1 (2).png");
  turret = loadImage("enemy/pixil-frame-0 (4).png");
  telo = loadImage("enemy/pixil-frame-0 (5).png");
  spawner = loadImage("enemy/MobSpawnerNew.png");

  //buttons
  pause = new Button(" I I ", 750, 40, 50, 50, ligrey, darkgrey, windows);
  upgrade1 = new Button(220, 240, 40, 40);
  upgrade2 = new Button(220, 315, 40, 40);
  upgrade3 = new Button(220, 390, 40, 40);

  //game objects
  myHero = new Hero();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myHero);

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
      myObjects.add(new Spawner(x, y, width/2, height/2));
      myObjects.add(new Turret(x, y, 640, 500));
    }

    if (roomColour == blue) {
      myObjects.add(new Sneaky(x, y, 200, 500));
      myObjects.add(new Teloporter(x, y, 500, 400));
    }

    if (roomColour == forest) {
      myObjects.add(new Sneaky(x, y, 100, 500));
      myObjects.add(new Sneaky(x, y, 600, 500));
    }

    if (roomColour == orange) {
      myObjects.add(new Spawner(x, y, 650, 500));
      myObjects.add(new Spawner(x, y, 150, 100));
    }

    if (roomColour == sky) {
      myObjects.add(new Teloporter(x, y, width/2, height/2));
      myObjects.add(new Turret(x, y, 640, 100));
    }

    if (roomColour == purple) {
      myObjects.add(new Turret(x, y, 640, 500));
      myObjects.add(new Turret(x, y, 640, 100));
      myObjects.add(new Turret(x, y, width/2, height/2));
      myObjects.add(new Turret(x, y, 100, 500));
      myObjects.add(new Turret(x, y, 100, 100));
    }

    if (roomColour == cyan) {
      myObjects.add(new Baddie(x, y, 300, 400));
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
  } else if (mode == UPGRADE) {
    upgrade();
  } else {
    println("Mode error:" + mode);
  }
}
