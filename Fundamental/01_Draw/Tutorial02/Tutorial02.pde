int counting = 0;
int fps = 30;

float timeSpan = 0.1;

int weight = 6;
float sizeBase=20;
float posBase = 50;

void setup() 
{
  size(1000, 500, JAVA2D);
  // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
  background(45);

  frameRate(fps);
}

void draw() 
{
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % (int)(fps * timeSpan);

    strokeWeight(weight); // 边框粗细 影响接下来所有图形
    stroke(255,255,255);// 边框颜色 影响接下来所有图形
    fill(200,235,100);// 填充颜色 影响接下来所有图形
    
    if(frameRest == 0)
    {
      ellipse(posBase,300,sizeBase,sizeBase);
      sizeBase +=20;
      posBase *=1.5;
    }
  
}