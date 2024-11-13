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
  
  ++counting;
  int sec = counting/fps;
  int frameRest = counting % fps;
  float detailedSec = (float)counting/fps;

  float drawSize = sizeBase + speed*detailedSec;
  
  if (drawSize < 400)
  {
    fill(200,235,100);// 填充颜色 影响接下来所有图形
    ellipse(width/2,height/2,drawSize,drawSize);
  }
  else
  {
    noFill();// 拒绝颜色填充 影响接下来所有图形

    // 在非填充之后，我希望每间隔x帧画一次，而不要连续去画
    int framespan = 10;

    if (frameRest % framespan == 0)
    {
      // 这里画出来是一个椭圆
      ellipse(width/2,height/2,drawSize*1.5,drawSize);
    }
  }
  
  
  
}