int counting = 0;
int fps = 60;

float loopCount = 30;

int splitWidth = 200;

void setup() 
{
    size(800, 800, JAVA2D);
    frameRate(fps);

    noLoop();
}

void draw() 
{
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    for (int i = -splitWidth / 2; i < width + splitWidth / 2; i += splitWidth)
    {
        for(int j = -splitWidth / 2; j < height + splitWidth / 2; j += splitWidth)
        {
            push();
            translate(i,j);

            noStroke();
            fill(random(125),random(125),random(125));
            rectMode(CENTER);
            rect(0,0,splitWidth,splitWidth);

            for (int n =0; n < loopCount; ++n)
            {
                stroke(random(255),random(255),random(255));
                for (int a = 0; a <360; a+=2)
                {
                    float x = random(splitWidth/10, splitWidth/5);
                    float xx = random(splitWidth/4,splitWidth/2.2);
                    strokeWeight(random(1,2));
                    strokeCap(CORNER);

                    pushMatrix();
                    rotate(radians(a) + radians(n * 2/loopCount));
                    line(x,0,xx,0);
                    popMatrix();
                }
            }
            pop();
        }
    }
    
}

void keyPressed()
{
    if (key==' ') redraw();
}