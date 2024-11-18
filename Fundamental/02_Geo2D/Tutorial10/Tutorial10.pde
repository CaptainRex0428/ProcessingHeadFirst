int fps = 60;
int frameCounting = 0;

void setup() 
{
    size(1200, 1200, JAVA2D);
    background(30);
    frameRate(fps);
}

void draw()
{
    ++frameCounting;
    float timer = (float)frameCounting/(float)fps;
}
