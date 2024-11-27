int fps = 60;
int frameCount = 0;

void setup()
{
    size(1200,800,JAVA2D);
    background(30);

    smooth();
    noFill();
}

void draw()
{
    ++ frameCount;
    float time = (float)frameCount/fps;
}