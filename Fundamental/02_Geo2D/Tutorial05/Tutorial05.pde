int fps = 60;
int frameCounting = 0;

void drawDashedBezier(float x1, float y1, float cx1, float cy1, float cx2, float cy2, float x2, float y2, float dashLength, float gapLength, color InColor, float weight) 
{
  stroke(InColor);
  strokeWeight(weight);
  strokeCap(ROUND);

  float currentLength = 0.0;
  float lengthBefore = 0.0;

  // 遍历贝塞尔曲线的每一小段，分段绘制虚线
  while (currentLength < 1) 
  {
    float nextLength = min(currentLength + dashLength, 1);

    float cxStart = bezierPoint(x1, cx1, cx2, x2, lengthBefore);
    float cyStart = bezierPoint(y1, cy1, cy2, y2, lengthBefore);;

    // 获取起点和终点的位置
    float xStart = bezierPoint(x1, cx1, cx2, x2, currentLength);
    float yStart = bezierPoint(y1, cy1, cy2, y2, currentLength);
    float xEnd = bezierPoint(x1, cx1, cx2, x2, nextLength);
    float yEnd = bezierPoint(y1, cy1, cy2, y2, nextLength);

    // 预计算下一段位置
    lengthBefore = currentLength;
    currentLength = nextLength + gapLength;

    float cxEnd = bezierPoint(x1, cx1, cx2, x2, currentLength);;
    float cyEnd = bezierPoint(y1, cy1, cy2, y2, currentLength);

    // 绘制一小段曲线
    curve(cxStart, cyStart, xStart, yStart,xEnd , yEnd, cxEnd, cyEnd);
    
  }
}

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);

    float x1 = 50, y1 = 300;
    float cx1 = 150, cy1 = 50;
    float cx2 = 450, cy2 = 350;
    float x2 = 550, y2 = 100;

    float dashLength = 0.04; 
    float gapLength = 0.02;

    drawDashedBezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2, dashLength, gapLength, 240, 6);
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}



