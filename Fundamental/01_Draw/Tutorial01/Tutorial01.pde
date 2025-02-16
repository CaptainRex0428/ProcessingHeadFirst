int counting = 0;
int fps = 60;

void setup() 
{
  size(500, 300, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  // background(0,50,100);

  frameRate(fps);
}

void draw() 
{
  // info layer
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;

  float detailedSec = (float)counting/fps;

  if (frameRest == 0)
  {
    println("sec: "+sec);
  }

  println("detailedSec: "+detailedSec);
}