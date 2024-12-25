int counting = 0;
int fps = 60;

int grid = 100;
float angle;

int mX = 0, mY = 0;

int splitCount = 0;
boolean increase = false;


float scaleValue = 1;

void setup()
{
    size(1000, 600, P3D);
    // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
    frameRate(fps);

    fill(255,255,181);
    noStroke(); 
    rectMode(CENTER);

    mX = (width - floor(width/(grid*2)) * grid * 2) / 2;
    mY = (height - floor(height/(grid*2)) * grid * 2) / 2;
}

void draw() 
{
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    translate(width/2, height/2);

    scaleValue = map(mouseX, 0, width, 0.1,5);
    scale(scaleValue);

    background(#050505);

    for (int x = mX + grid - width/2; x <= width/2-mX; x+=grid*2)
    {
        for (int y = mY+grid-height/2; y <= height/2-mY; y+= grid*2)
        {
            push();

            translate(x, y);

                push();
                rotateX(radians(angle));
                rotateY(-radians(angle));

                rect(0,0,grid,grid);

                pop();

                push();
                translate(+grid,0);
                rotateX(radians(angle));
                rotateY(radians(angle));

                rect(0,0,grid,grid);

                pop();

            pop();

            push();

            translate(x, y+grid);

                push();
                rotateX(-radians(angle));
                rotateY(-radians(angle));

                rect(0,0,grid,grid);

                pop();

                push();
                translate(+grid,0);
                rotateX(-radians(angle));
                rotateY(radians(angle));

                rect(0,0,grid,grid);

                pop();

            pop();
        }
    }

    angle += 1;

    if (angle % 180 == 0)
    {
        ++splitCount;
        // println(splitCount);

        if (splitCount % 5 == 0)
        {
            increase = !increase;

            // println("Change");
        }

        if (increase)
        {
            grid *= 2;
        }
        else
        {
            grid/=2;
        };

    }
}