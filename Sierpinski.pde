/* 
  An object template to draw a Sierpinski Christmas Tree. 
  I used 'Sierpinski's Triangle - Processing' (Adams, 2020) 
  {https://medium.com/@adamsjr8576/sierpinskis-triangle-processing-68c226a98a47}
  as reference and further developed this object class.
  Adams used equilateral triangle in his codes. I alternated it into an isosceles triangle
  
  line 46: sierpinski function: recursion terminates when layer is equal to base, namely the outer and the biggest triangle is drawn at last.
  each recursion (the else statement) creates 3 sierpinski objects. These are the inner triangles
  color feature: when mouse is closer to the left of the screen, the tree turns green; when its close to the right side of the screen, it turns red  
*/

class Sierpinski {
int x;
int y;
float heightTriangle;
float bottom_length;
final int layer = 1; // when this incrementer is greater than 1, there is a stackoverflow error. Thus, I declared this variable as final
int base; //terminator of the recursion
int treeTrunk; //height of the tree stem
int treeTrunkw;//width of the tree stem
float startPointx; //initial x position
float startPointy; //initial y position

//Constructor
  Sierpinski(int x, int y, float input_heightTriangle, float input_bottom_length, int input_base){
    this.x=x;
    this.y=y;
    heightTriangle=input_heightTriangle;
    bottom_length=input_bottom_length;
    base=input_base;
    treeTrunk= 250;
    treeTrunkw=50;
    startPointx = x;
    startPointy = y;
  }


  void draw() {
      sierpinski(startPointx, startPointy-treeTrunk, heightTriangle, bottom_length, layer, int(map(mouseX, 0, width, 1, base)));
      fill(162,134,41);
      stroke(162,134,41);
      rect(startPointx+(bottom_length/2)-(treeTrunkw/2), startPointy-treeTrunk,treeTrunkw,treeTrunk);
      noFill();
  }


  void sierpinski(float x, float y, float heightTriangle, float bottom_length, int layer, int base) {
    if(layer == base) {
      fill(map(mouseX, 0, width, 0, 255),map(mouseX, 0, width, 255, 0),map(mouseX, 0, width, 0, 10));
      stroke(map(mouseX, 0, width, 0, 255),map(mouseX, 0, width, 255, 0),map(mouseX, 0, width, 0, 10));
      triangle(x, y, (x + bottom_length/2), y-heightTriangle, x+bottom_length, y);
    } else {
      sierpinski(x, y, heightTriangle/2, bottom_length/2, layer + 1, base);
      sierpinski(x+bottom_length/2, y, heightTriangle/2, bottom_length/2, layer + 1, base);
      sierpinski(x+bottom_length/4, y-heightTriangle/2, heightTriangle/2, bottom_length/2, layer + 1, base);
     }
    }
  }
