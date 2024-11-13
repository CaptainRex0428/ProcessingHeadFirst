int counting = 0;
int fps = 60;

void setup() 
{
  size(500, 300, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  background(200);

  frameRate(fps);
}

void draw() 
{
  ellipse(mouseX, mouseY, 50, 50);

  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  if (frameRest == 0)
  {
    println(sec);
  }

  println(detailedSec);
}