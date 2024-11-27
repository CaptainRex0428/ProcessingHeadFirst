int fps = 60;
int frameCount = 0;

void setup()
{
    size(1200,800,JAVA2D);
    colorMode(HSB,360,100,100);
    background(random(10, 30));
    noFill();

    for (int i = 0; i < 80; ++ i)
    {
        ellipse(width/2,height/2,200+i*15,200-i*15);
        stroke(100+i*3,100,100);
        strokeWeight(max(1-0.05*i,0.01));
    }
}

void draw()
{
    ++frameCount;
    float time = (float)frameCount / fps;
}