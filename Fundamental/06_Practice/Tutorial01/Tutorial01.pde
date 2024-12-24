int frameCount = 0;
int fps = 60;

void setup() 
{
  size(1000, 1000, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  background(30);

  frameRate(fps);
}

void draw() 
{
  ellipse(mouseX, mouseY, 50, 50);

  ++frameCount;
  int sec = frameCount/fps;
  int frameRest = frameCount % fps;

  float detailedSec = (float)frameCount/fps;

  
}