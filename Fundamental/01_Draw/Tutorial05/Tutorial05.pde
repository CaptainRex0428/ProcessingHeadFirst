int counting = 0;
int fps = 60;

PImage pic;

void setup() 
{
  size(900, 600, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  background(10);
  frameRate(fps);

  pic = loadImage("pic.png");
}

void draw() 
{
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  fill(210,0,0);
  noStroke();

  push();//将当前的图形状态（包括样式和变换）保存到堆栈中。之后，你可以自由修改这些状态，而不会影响到其他图形。

  translate(650,220);
  rotate(PI/4);

  rect(0, -200, 100, 200);
  rect(0, 0, 300, 100);

  pop();// 用于将保存的图形状态从堆栈中取出并恢复。每次调用 push() 后，通常会对应一个 pop()，这样可以确保所有的状态都被正确恢复。

  image(pic,0,0,width,height);

  
}