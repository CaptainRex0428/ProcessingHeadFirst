int frameCount = 0;
int fps = 60;

void setup()
{
    size(1200,600);
    frameRate(fps);
}

void draw()
{
    ++frameCount;
    float time = (float)frameCount / fps;
}


