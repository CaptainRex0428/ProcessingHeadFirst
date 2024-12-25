int frameCount = 0;
int fps = 120;

void setup()
{
    size(1000,800,JAVA2D);
    background(#000000);
    frameRate(fps);
}

void draw()
{
    ++frameCount;
}