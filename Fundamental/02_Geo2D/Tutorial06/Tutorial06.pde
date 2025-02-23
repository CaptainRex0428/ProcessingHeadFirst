int fps = 60;
int frameCounting = 0;

float rInner = 100.f;
float rOuter = 350.f;

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
    // println(timer);
    float a = (sin(timer) + 1) * 0.5;
    int num = (int)(a * 20);
    
    background(30);

    stroke(70,144,255);
    noFill();
    
    push();
    translate(width/2,height/2);

    circle(0, 0, rInner*2);
    circle(0, 0, rOuter*2);
   
    for(int i = 0; i<num; ++i)
    {
        float x1 = rInner*cos(2*PI/num*i);
        float y1 = rInner*sin(2*PI/num*i);
        float x2 = rOuter*cos(2*PI/num*i);
        float y2 = rOuter*sin(2*PI/num*i);

        line(x1,y1,x2,y2);
    }

    pop();
}



