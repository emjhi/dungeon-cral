class Gif {

  int f, fr, framerate;
  PImage[] gif;
  int n;
  float x, y, w, h;

  Gif(int nf, String pre, String end, int fr) {
    n = 0;
    f = nf;
    framerate = fr;

    gif = new PImage[f];
    int i = 0;
    while ( i < f) {
      gif[i] = loadImage(pre+i+end);
      i++;
    }
  }

  Gif(int nf, String pre, String end, float _x, float _y, float _w, float _h, int fr) {
    n = 0;
    f = nf;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    framerate = fr;
    
    gif = new PImage[f];
    int i = 0;
    while ( i < f) {
      gif[i] = loadImage(pre+i+end);
      i++;
    }
  }


  void show() {
    image(gif[n], x, y, w, h);
    if (frameCount % framerate == 0) n = n + 1;
    if (n == f) n = 0;
  }
  
  void show(float x, float y, float w, float h) {
    image(gif[n], x, y, w, h);
    if (frameCount % framerate == 0) n = n + 1;
    if (n == f) n = 0;
  }
}
