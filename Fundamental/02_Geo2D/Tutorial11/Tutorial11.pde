int fps = 60;
int frameCounting = 0;

int edgeNum = 8;
float extern = 280.f;

void setup() 
{
    size(1200, 600, JAVA2D);
    background(30);
    frameRate(fps);
    
    stroke(255);
    strokeWeight(10);
    noFill();

    push();

    translate(width/2, height/2);
    beginShape();
    
    for (int i = 0; i < edgeNum; ++i)
    {
        float angle = i*TWO_PI/edgeNum;
        float x = extern * cos(angle);
        float y = extern * sin(angle);
        vertex(x,y);
    }

    endShape(CLOSE);

    pop();
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}
