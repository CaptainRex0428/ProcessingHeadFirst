int fps = 60;
int frameCounting = 0;

void setup() 
{
    size(1200, 1200, JAVA2D);
    background(30);
    frameRate(fps);

    stroke(244);
    fill(150);

    // 封闭图形
    beginShape();
    vertex(300, 100);
    vertex(500, 100);
    vertex(600, 300);
    vertex(400, 450);
    vertex(200, 300);
    endShape(CLOSE);

    // 非封闭图形
    beginShape();
    vertex(800, 100);
    vertex(1000, 100);
    vertex(1100, 300);
    vertex(900, 450);
    vertex(700, 300);
    endShape();

    // 仅三角形
    beginShape(TRIANGLES);
    vertex(800, 600);
    vertex(1000, 600);
    vertex(1100, 800);
    vertex(900, 950);
    vertex(700, 800);
    endShape();
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}



