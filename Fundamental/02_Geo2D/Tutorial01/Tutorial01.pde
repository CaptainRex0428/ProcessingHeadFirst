int fps = 60;

class Vector2
{
    float x;
    float y;

    Vector2(float x, float y)
    {
        this.x = x;
        this.y = y;
    };

}

void drawLine(Vector2 StartPos, Vector2 EndPos)
{
    line(StartPos.x,StartPos.y,EndPos.x,EndPos.y);
}

void drawTri(Vector2 vertex1, Vector2 vertex2, Vector2 vertex3)
{
    triangle(vertex1.x,vertex1.y,vertex2.x,vertex2.y,vertex3.x,vertex3.y);
}


void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);

    stroke(200);
    strokeWeight(6);
    noFill();

    // 点
    point(100,50);

    // 线
    strokeCap(SQUARE);
    Vector2 start = new Vector2(100,100);
    Vector2 end = new Vector2(500,100);
    drawLine(start, end);

    strokeCap(PROJECT);
    line(100, 110, 500, 110);

    strokeCap(ROUND);
    line(100, 120, 500, 120);

    // //strokeCap在OpenGL模式下不生效

    // 四边形
    rect(100, 150, 100, 50);
    rect(250, 150, 100, 50, 25);
    square(400, 150, 50);

    //圆形
    ellipse(150, 300, 100, 100);
    ellipse(300, 300, 150, 100);
    circle(450, 300, 100);

    //三角形
    Vector2 v1 = new Vector2(150,380);
    Vector2 v2 = new Vector2(100,450);
    Vector2 v3 = new Vector2(200,450);
    drawTri(v1, v2, v3);

    //拱形
    arc(150, 520, 150, 60, PI, 2*PI);
    arc(350, 520, 150, 60, radians(0), radians(180));

    //贝塞尔曲线
    //中间的两个点 (cx1, cy1)和(cx2, cy2) 是辅助控制点，并不在绘制的曲线上。它们是为了引导曲线的开始和结束，使其更自然过渡。
    bezier(600, 200, 550, 300, 650, 400, 600, 500);
    
    //Catmull-Rom曲线
    //第一个点 (x1, y1) 和最后一个点 (x2, y2) 实际上是辅助控制点，并不在绘制的曲线上。它们是为了引导曲线的开始和结束，使其更自然过渡。
    curve(700, 0, 650, 200, 750, 500, 700, 700);
}

void draw() 
{
    
}
