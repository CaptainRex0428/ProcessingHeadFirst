int fps = 60;
int frameCounting = 0;

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);
    stroke(240);
    noFill();
    
    // 辅助控制点（起点和终点之外的点）
    float x1 = 50, y1 = 300;
    float x2 = 100, y2 = 50;
    float x3 = 300, y3 = 350;
    float x4 = 350, y4 = 100;

    // 绘制曲线（实际通过 x2, y2 和 x3, y3）
    curve(x1, y1, x2, y2, x3, y3, x4, y4);
    bezier(x1, y1, x2, y2, x3, y3, x4, y4);

    // 绘制四个点标记
    fill(0,255, 0);
    ellipse(x1, y1, 10, 10); 
    ellipse(x4, y4, 10, 10); 
    
    fill(255 , 0, 0);
    ellipse(x2, y2, 10, 10); 
    ellipse(x3, y3, 10, 10); 
    
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}

