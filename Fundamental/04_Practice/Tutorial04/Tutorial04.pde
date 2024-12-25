int frameCount = 0;
int fps = 120;

int margin = 200;
float numX = 4;
float numY = 4;

float scale = 1.1;

void setup()
{
    size(800,800,JAVA2D);
    frameRate(fps);

    noLoop();
}

void draw()
{
    ++frameCount;

    background(15,20,30);
    noFill(); 

    println(numX);

    float gridX = (width - 2*margin)/numX;
    float gridY = (height - 2*margin)/numY;

    for (int i = margin ; i <= width-margin; i += gridX)
    {
        for (int j = margin; j <= height-margin; j += gridY)
        {
            pushMatrix();

            translate(i,j);
            scale(scale);

            strokeWeight(3);
            
            // stroke(255);
            // point(0,0);

            stroke(random(255),random(255),random(255));
            strokeCap(CORNER);

            for (int n = 0; n < 7; ++n)
            {
                float x1 = -random(gridX/2);
                float y1 = -random(gridY/2);
                float x2 = random(gridX/2);
                float y2 = -random(gridY/2);
                float x3 = random(gridX/2);
                float y3 = random(gridY/2);
                float x4 = -random(gridX/2);
                float y4 = random(gridY/2);

                quad(x1, y1, x2, y2, x3, y3, x4, y4);
            }
            

            popMatrix();
        }
    }
}

void keyPressed()
{
    if (key==' ') redraw();
}