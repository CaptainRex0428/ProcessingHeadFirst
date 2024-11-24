int fps = 60;
int frameCounting = 0;

void setup() 
{
    size(1200, 600, JAVA2D);
    background(30);
    frameRate(fps);
    
    stroke(255);
    noFill();

    beginShape();
    vertex(200, 100); // A1
    bezierVertex(300, 100, 300, 200, 400, 350); // -> A2
    bezierVertex(450, 450, 600, 500, 800, 300); // -> A3
    endShape();

    fill(255,0,0);
    circle(200, 100,10);

    fill(0,255,0);
    circle(300, 100,10);
    circle(300, 200,10);
    circle(400, 350,10);

    fill(0,0,255);
    circle(450, 450,10);
    circle(600, 500,10);
    circle(800, 300,10);

}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}
