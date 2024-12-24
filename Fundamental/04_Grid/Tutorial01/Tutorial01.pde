int counting = 0;
int fps = 60;

int grid = 100;
float angle;

int mX = 50, mY = 50;

void setup()
{
    size(1000, 800, P3D);
    // 内置渲染图形模式 JAVA2D P2D P3D OPENGL
    frameRate(fps);

    fill(255,255,181);
    noStroke();

    rectMode(CENTER);
}

void draw() 
{
    ++counting;
    int sec = counting/fps;
    int frameRest = counting % fps;

    float detailedSec = (float)counting/fps;

    background(#050505);

    for (int x = mX + grid; x < width-mX; x+=grid*2)
    {
        for (int y = mY + grid; y < height-mY; y+= grid*2)
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
}