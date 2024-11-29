int fps = 60;
int frameCount = 0;

void setup()
{
    size(1200,800,JAVA2D);

    smooth();
    noFill();
    
    background(30);

    colorMode(HSB,360,100,100);
}

void draw()
{
    ++ frameCount;
    float time = (float)frameCount/fps;
    
   //  background(30);

    
    for(int i = 0; i < 100; ++i)
    {
        float hueValue = map(noise(frameCount*0.3), 0, 1, 0, 360);  
        stroke(hueValue, 100, 100);  // 动态变化的色相

        bezier(
        width/2+noise(i,time)*20, height, 
        width/2, noise(1,time,i)*height,
        noise(2,time,i) * width, noise(4,time,i) * height,
        noise(3,time,i) * width, noise(5,time,i) * height);
    }
    
}