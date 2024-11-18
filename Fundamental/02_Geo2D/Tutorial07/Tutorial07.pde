int fps = 60;
int frameCounting = 0;

int num = 8;
float rInner = 100.f;
float rOuter = 350.f;

void drawDynamicRound(float rInner, float rOuter, int num, color strokeColor, float bias)
{
    stroke(strokeColor);
    noFill();

    push();
    translate(width/2,height/2);
    circle(0, 0, rInner*2);
    circle(0, 0, rOuter*2);

    for(int i = 0; i<num; ++i)
    {
        float x1 = rInner*cos(2*PI/num*(i+1));
        float y1 = rInner*sin(2*PI/num*(i+1));
        float x2 = rOuter*cos(2*PI/num*(i+1)*bias);
        float y2 = rOuter*sin(2*PI/num*(i+1)*bias);

        line(x1,y1,x2,y2);
    }

    pop();
}

void setup() 
{
    size(1200, 800, JAVA2D);
    background(30);
    frameRate(fps);
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
    
    rInner+= sin(timer)*0.2f;
    rOuter+= cos(timer)*0.1f;

    background(30);

    drawDynamicRound(rInner,rOuter,num,color(40,70,244),timer);
}



