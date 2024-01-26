
float x, y, x_n, y_n, x_og, y_og;

int r, g, b;
float max_cnt;

void setup() {
  size(1000, 1000);
  //fullScreen();
  //translate(width/2, height/2);
  max_cnt = 100;
}




void draw() {

  loadPixels();
  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      x = float(i);
      y = float(j);

      x = map(x, 0, width, -3.5f, 3.5f);
      y = map(y, 0, height, -3.5f, 3.5f);
      x_og = map(mouseX, 0, width, -1, 1);
      y_og = map(mouseY, 0, height, -1, 1);
      
      r = 175;
      g = 105;
      b = 195;
      
      int cnt = 0;
      while (cnt < max_cnt) {
        x_n = (x*x - y*y) + x_og;
        y_n = 2*x*y + y_og;
        x = x_n;
        y = y_n;
        if (sqrt(x*x + y*y) > 20) {
          r = cnt%255;
          g = (cnt/2)%255;
          b = (cnt*2)%255;
          break;
        }
        cnt+=1;
      }
      //if (cnt == max_cnt) {
        // r = 0;
       // g = 0;
      //  b = 0;
      //}

      //println(x, y);
      pixels[i + j * width] = color(r, g, b);
 

    }
  }

  updatePixels();
  //noLoop();
}
