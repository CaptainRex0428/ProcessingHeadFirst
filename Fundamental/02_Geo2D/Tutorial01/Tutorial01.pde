int fps = 60;

void setup() 
{
    size(900, 600, OPENGL);
    background(30);
    frameRate(fps);
}

void draw() 
{
    stroke(200);
    strokeWeight(6);
    noFill();

    // 点
    point(100,50);

    // 线
    line(100, 100, 500, 100);

    // 四边形
    rect(100, 150, 100, 50);
    rect(250, 150, 100, 50, 15);

    //圆形
    ellipse(150, 300, 100, 100);
    ellipse(300, 300, 150, 100);

    //三角形
    triangle(150, 380, 100, 450, 200, 450);

    //拱形
    arc(150, 520, 150, 60, PI, 2*PI);
}
