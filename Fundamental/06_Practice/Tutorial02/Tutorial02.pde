int counting = 0;
int fps = 60;

float arcSize = 200;

float sw, alpha;
float yStep = 10;

void setup() 
{
    size(800, 800, JAVA2D);
    frameRate(fps);
}

void draw() 

{
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    background(#eeeeee);

    mouseX = constrain(mouseX, 10, width);
    mouseY = constrain(mouseY, 10, height);

    // yStep = mouseY;
    // arcSize = mouseX;

    noFill();
    stroke(20);
    

    for(float y = -arcSize; y< height+arcSize; y+= yStep)
    {
        sw = map(sin(radians(y+alpha)),-1,1,2,yStep);
        strokeWeight(sw);
        for (float x1 = arcSize/2;  x1 < width+arcSize; x1 += arcSize)
        {
            arc(x1,y,arcSize/2,arcSize/2,0.0,PI);
        }

        sw = map(sin(radians(y-alpha)),-1,1,2,yStep);
        strokeWeight(sw);
        for (float x2 = 0;  x2 < width+arcSize; x2 += arcSize)
        {
            arc(x2,y,arcSize/2,arcSize/2,PI,TWO_PI);
        }
    }

    alpha++;
}