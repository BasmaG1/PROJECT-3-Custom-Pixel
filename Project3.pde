
 
String filename = "color.jpg";
PImage p;
void setup() {
p = loadImage(filename);           
size(796,600);            //<>//
image(p, 0, 0);
}
void draw()
{
 int pxSize,npoints;  
 pxSize=int(map(mouseX,0,width,1,100));
 npoints=int(map(mouseY,0,height,3,50));
 print("pxSize:",pxSize,":npoints",npoints,char(10)); 
 changepixel(pxSize,npoints); 
}
void changepixel(int pxSize, int npoints) {
   float ratio;
  if (width < height) {
    ratio = height/width;
  }
  else {
    ratio = width/height;
  }
 
  int pxH = int(pxSize * ratio);
  
  noStroke();
  for (int x=0; x<width; x+=pxSize) {
    for (int y=0; y<height; y+=pxH) {
      fill(p.get(x, y));
      //rect(x, y, pxSize, pxH);
       polygon(x, y, pxSize, npoints);
    }
  }
}
  void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
