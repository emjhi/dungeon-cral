class Gif {

  int f;
  PImage[] gif;
  int n;
  float x, y, w, h;

  Gif(int nf, String pre, String end) {
    n = 0;
    f = nf;

    gif = new PImage[f];
    int i = 0;
    while ( i < f) {
      gif[i] = loadImage(pre+i+end);
      i++;
    }
  }

  Gif(int nf, String pre, String end, float _x, float _y, float _w, float _h) {
    n = 0;
    f = nf;
    x = _x;
    y = _y;
    w = _w;
    h = _h;

    gif = new PImage[f];
    int i = 0;
    while ( i < f) {
      gif[i] = loadImage(pre+i+end);
      i++;
    }
  }

  void show() {
    image(gif[n], x, y, w, h);
    if (frameCount % 5 == 0) n = n + 1;
    if (n == f) n = 0;
  }
}
