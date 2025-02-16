int counting = 0;
int fps = 60;
int speed = 300;

float sizeBase=20;
int weight = 6;

void setup() 
{

  size(1000, 500, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  background(45);

  frameRate(fps);
}

void draw() 
{
  strokeWeight(weight); // 边框粗细 影响接下来所有图形
  stroke(255,255,255);// 边框颜色 影响接下来所有图形
  fill(200,235,100);// 填充颜色 影响接下来所有图形

  ++counting;

  float detailedSec = (float)counting/fps;

  float amplitude = 100; // 振幅，控制大小变化的范围
  float frequency = 1;   // 频率，控制变化的速度
  float drawSize = sizeBase + amplitude * sin(TWO_PI * frequency * detailedSec);

  ellipse(width/2,height/2,drawSize,drawSize);
}