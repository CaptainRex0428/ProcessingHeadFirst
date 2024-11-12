int fps = 60;
int frameCounting = 0;

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);

    stroke(244);
    fill(150);

    // 封闭图形
    beginShape();
    vertex(100, 100);
    vertex(200, 100);
    vertex(150, 200);
    endShape(CLOSE);

    // 非封闭图形
    beginShape();
    vertex(300, 100);
    vertex(400, 100);
    vertex(350, 200);
    endShape();
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}



